const {PATHS}=require('./config');
const {linked,resolve,linkPath}=require('./links');

const status=value=>String(value||'').toLowerCase();
const done=value=>status(value)==='done';
const cancelled=value=>status(value)==='cancelled';
const day=()=>new Date().toISOString().slice(0,10);

function progress(tasks){return tasks.length?Math.round(100*tasks.filter(task=>done(task.fm.status)).length/tasks.length):0}
function health(fm,tasks,today=day()){
  if(done(fm.status))return 'complete';
  if(tasks.some(task=>!done(task.fm.status)&&!cancelled(task.fm.status)&&(status(task.fm.status)==='blocked'||task.fm.blocker)))return 'blocked';
  if(fm.target_end&&fm.target_end<today||tasks.some(task=>!done(task.fm.status)&&task.fm.due&&task.fm.due<today))return 'at-risk';
  return 'on-track';
}
function nextAction(tasks,today=day()){
  const priority=value=>({urgent:0,high:1,normal:2,medium:2,low:3,none:4})[status(value)]??4;
  const candidates=tasks.filter(task=>['ready','in-progress','backlog'].includes(status(task.fm.status))&&!task.fm.blocker);
  candidates.sort((a,b)=>{
    const state=task=>['ready','in-progress'].includes(status(task.fm.status))?0:1;
    const due=task=>task.fm.due===today?0:task.fm.due&&task.fm.due<today?1:task.fm.due?2:3;
    return state(a)-state(b)||due(a)-due(b)||priority(a.fm.priority)-priority(b.fm.priority)||String(a.fm.created||'').localeCompare(String(b.fm.created||''));
  });
  return candidates[0]?linkPath(candidates[0].file.path):'';
}
function derivedProjectCode(project,milestone,phase){
  const type=String(project.project_type||'ENG');
  const m=String(milestone?.number||'M1');
  const p=String(phase?.number||'P1.1');
  const name=String(project.project_slug||project.project_code?.split('-').at(-1)||project.id||'PROJECT').toUpperCase().replace(/[^A-Z0-9]+/g,'-').replace(/^-|-$/g,'');
  return `${type}-${m}-${p}-${name}`;
}

async function run(app){
  const files=app.vault.getMarkdownFiles(),today=day();
  const tasks=files.filter(file=>file.path.startsWith(`${PATHS.taskFolder}/`)).map(file=>({file,fm:app.metadataCache.getFileCache(file)?.frontmatter||{}}));
  const entities=files.filter(file=>file.path.startsWith(`${PATHS.projects}/`)).map(file=>({file,fm:app.metadataCache.getFileCache(file)?.frontmatter||{}})).filter(row=>['project','milestone','phase'].includes(row.fm.type));
  const projects=entities.filter(row=>row.fm.type==='project'),milestones=entities.filter(row=>row.fm.type==='milestone'),phases=entities.filter(row=>row.fm.type==='phase');

  for(const project of projects){
    const projectMilestones=milestones.filter(row=>linked(app,row.fm.project,project.file,row.file)).sort((a,b)=>Number(a.fm.order||99)-Number(b.fm.order||99));
    const projectPhases=phases.filter(row=>linked(app,row.fm.project,project.file,row.file)||projectMilestones.some(m=>linked(app,row.fm.milestone,m.file,row.file))).sort((a,b)=>Number(a.fm.order||99)-Number(b.fm.order||99));
    const projectTasks=tasks.filter(task=>!cancelled(task.fm.status)&&(linked(app,task.fm.project,project.file,task.file)||projectMilestones.some(m=>linked(app,task.fm.milestone,m.file,task.file))||projectPhases.some(p=>linked(app,task.fm.phase,p.file,task.file))));
    const currentMilestone=projectMilestones.find(row=>!['done','cancelled'].includes(status(row.fm.status)));
    const currentPhase=currentMilestone&&projectPhases.find(row=>linked(app,row.fm.milestone,currentMilestone.file,row.file)&&!['done','cancelled'].includes(status(row.fm.status)));
    const completed=projectTasks.filter(task=>done(task.fm.status)).length;
    const blockers=projectTasks.filter(task=>!done(task.fm.status)&&(status(task.fm.status)==='blocked'||task.fm.blocker)).length;
    const values={progress:progress(projectTasks),health:health(project.fm,projectTasks,today),current_milestone:currentMilestone?linkPath(currentMilestone.file.path):'',current_phase:currentPhase?linkPath(currentPhase.file.path):'',next_action:nextAction(projectTasks,today),open_blocker_count:blockers,open_task_count:projectTasks.length-completed,completed_task_count:completed,milestone_count:projectMilestones.length,phase_count:projectPhases.length,counts:{tasks:projectTasks.length,completed,open:projectTasks.length-completed},updated:today,last_reconciled:new Date().toISOString()};
    if(!project.fm.source_identity)values.project_code=derivedProjectCode(project.fm,currentMilestone?.fm,currentPhase?.fm);
    if(project.fm.source_identity){
      for(const field of ['project_code','starter_ontology'])if(project.fm[field])values[field]=project.fm[field];
    }
    await app.fileManager.processFrontMatter(project.file,fm=>Object.assign(fm,values));
  }

  for(const entity of [...milestones,...phases]){
    const childTasks=tasks.filter(task=>!cancelled(task.fm.status)&&linked(app,entity.fm.type==='phase'?task.fm.phase:task.fm.milestone,entity.file,task.file));
    const completed=childTasks.filter(task=>done(task.fm.status)).length;
    const blockers=childTasks.filter(task=>!done(task.fm.status)&&(status(task.fm.status)==='blocked'||task.fm.blocker)).length;
    await app.fileManager.processFrontMatter(entity.file,fm=>Object.assign(fm,{progress:progress(childTasks),health:health(fm,childTasks,today),next_action:nextAction(childTasks,today),open_task_count:childTasks.length-completed,completed_task_count:completed,open_blocker_count:blockers,counts:{tasks:childTasks.length,completed,open:childTasks.length-completed},updated:today,last_reconciled:new Date().toISOString()}));
  }

  for(const task of tasks){
    if(done(task.fm.status)&&!task.fm.completed_at&&!task.fm.source_identity)await app.fileManager.processFrontMatter(task.file,fm=>{fm.completed_at=today});
    if(!done(task.fm.status)&&task.fm.completed_at)await app.fileManager.processFrontMatter(task.file,fm=>{delete fm.completed_at});
    if(task.fm.source_identity)continue;
    const phase=resolve(app,task.fm.phase,task.file),milestone=resolve(app,task.fm.milestone,task.file),project=resolve(app,task.fm.project,task.file),parent=phase||milestone||project;
    if(!parent)continue;
    const parentFm=app.metadataCache.getFileCache(parent)?.frontmatter||{};
    const projectFile=parentFm.type==='project'?parent:resolve(app,parentFm.project,parent);
    const projectFm=projectFile?app.metadataCache.getFileCache(projectFile)?.frontmatter||{}:{};
    let linkedMilestone=parentFm.type==='milestone'?parent:milestone;
    if(!linkedMilestone&&phase)linkedMilestone=resolve(app,app.metadataCache.getFileCache(phase)?.frontmatter?.milestone,phase);
    const phaseFm=phase?app.metadataCache.getFileCache(phase)?.frontmatter||{}:{};
    const idMatch=String(task.fm.id||'').match(/-T(\d+)$/);
    await app.fileManager.processFrontMatter(task.file,fm=>{
      if(!fm.project&&projectFile)fm.project=linkPath(projectFile.path);
      if(!fm.milestone&&linkedMilestone)fm.milestone=linkPath(linkedMilestone.path);
      if(!fm.phase&&phase)fm.phase=linkPath(phase.path);
      if(!fm.project_code&&projectFm.project_code)fm.project_code=projectFm.project_code;
      if(!fm.ticket_code&&projectFm.project_code&&idMatch)fm.ticket_code=`${projectFm.project_code}-T${String(Number(idMatch[1])).padStart(2,'0')}`;
      fm.updated=today;
    });
  }
  return {projects:projects.length,milestones:milestones.length,phases:phases.length,tasks:tasks.length};
}
module.exports={run,health,progress,nextAction,derivedProjectCode};
