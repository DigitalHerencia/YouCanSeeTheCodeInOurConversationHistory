const {PATHS}=require('./core/config');
const {resolve,linkPath}=require('./core/links');
const {run}=require('./core/reconcile');

const status=value=>String(value||'').toLowerCase();
const renderLink=file=>linkPath(file.path);
function updateRegion(text,key,value){
  const expression=new RegExp(`<!-- HEARTH:BEGIN ${key} -->[\\s\\S]*?<!-- HEARTH:END ${key} -->`);
  const replacement=`<!-- HEARTH:BEGIN ${key} -->\n${value}\n<!-- HEARTH:END ${key} -->`;
  if(!expression.test(text))throw new Error(`Daily template is missing generated region ${key}.`);
  return text.replace(expression,replacement);
}
function previousWorkday(value){
  const date=new Date(`${value}T12:00:00Z`);
  do{date.setUTCDate(date.getUTCDate()-1)}while(date.getUTCDay()===0||date.getUTCDay()===6);
  return date.toISOString().slice(0,10);
}
function sectionList(rows,empty){return rows.length?rows.join('\n'):empty}

async function render(app,date,note){
  await run(app);
  const files=app.vault.getMarkdownFiles(),tasks=files.filter(file=>file.path.startsWith(`${PATHS.taskFolder}/`)).map(file=>({file,fm:app.metadataCache.getFileCache(file)?.frontmatter||{}}));
  const active=tasks.filter(task=>!['done','cancelled'].includes(status(task.fm.status)));
  const priorDay=previousWorkday(date);
  const completed=tasks.filter(task=>task.fm.completed_at===priorDay);
  const selected=String(app.metadataCache.getFileCache(note)?.frontmatter?.focus_project||'');
  const state=app.vault.getAbstractFileByPath(`${PATHS.state}/Project Context.md`),stateFm=state?app.metadataCache.getFileCache(state)?.frontmatter||{}:{};
  const project=resolve(app,selected||stateFm.active_project||stateFm.project,note);
  const projectFm=project?app.metadataCache.getFileCache(project)?.frontmatter||{}:{};
  const focusTasks=project?active.filter(task=>resolve(app,task.fm.project,task.file)?.path===project.path):active;
  const ranked=[...focusTasks].sort((a,b)=>{
    const rank=task=>({ready:0,'in-progress':1,backlog:2,blocked:3}[status(task.fm.status)]??4);
    const priority=task=>({urgent:0,high:1,normal:2,medium:2,low:3,none:4}[status(task.fm.priority)]??4);
    const due=task=>task.fm.due===date?0:task.fm.due&&task.fm.due<date?1:task.fm.due?2:3;
    return rank(a)-rank(b)||due(a)-due(b)||priority(a)-priority(b)||String(a.fm.created||'').localeCompare(String(b.fm.created||''));
  });
  const todayTasks=ranked.filter(task=>task.fm.scheduled===date||task.fm.due===date||status(task.fm.status)==='in-progress'||status(task.fm.status)==='ready').slice(0,3);
  const dueSoon=active.filter(task=>task.fm.due&&task.fm.due>=date&&task.fm.due<=new Date(new Date(`${date}T12:00:00Z`).getTime()+7*86400000).toISOString().slice(0,10));
  const overdue=active.filter(task=>task.fm.due&&task.fm.due<date);
  const blockers=active.filter(task=>status(task.fm.status)==='blocked'||task.fm.blocker);
  const meetings=files.filter(file=>file.path.startsWith(`${PATHS.daily}/`)&&app.metadataCache.getFileCache(file)?.frontmatter?.type==='meeting'&&app.metadataCache.getFileCache(file)?.frontmatter?.date===date);
  const resources=files.filter(file=>{const fm=app.metadataCache.getFileCache(file)?.frontmatter||{};return fm.type==='resource'&&fm.review_due&&fm.review_due<=date&&fm.resource_state!=='archived'});
  const captures=files.filter(file=>file.path.startsWith(`${PATHS.zettelkasten}/`)&&['Inbox','AI Threads','Web Clippings','Fleeting','Literature'].some(folder=>file.path.startsWith(`${PATHS.zettelkasten}/${folder}/`))&&['inbox','triage'].includes(status(app.metadataCache.getFileCache(file)?.frontmatter?.state)));
  const outputs=files.filter(file=>{
    const fm=app.metadataCache.getFileCache(file)?.frontmatter||{};
    return fm.type==='document'||fm.type==='evidence';
  });
  const outputByTask=new Map();
  for(const output of outputs){const fm=app.metadataCache.getFileCache(output)?.frontmatter||{};const source=resolve(app,fm.source_task||fm.task,output);if(source)outputByTask.set(source.path,output)}
  const carried=files.filter(file=>file.path.startsWith(`${PATHS.daily}/`)&&file.path.endsWith('.md')&&file.basename<date&&file.path!==`${PATHS.daily}/Today.md`).flatMap(file=>{
    const body=app.vault.cachedRead(file)||'';return [...body.matchAll(/^- \[ \] (.+)$/gm)].map(match=>({file,text:match[1]}));
  }).filter(item=>!item.text.includes('Hearth:'));
  const lessons=files.filter(file=>file.path.startsWith(`${PATHS.codelab}/Modules/`)&&app.metadataCache.getFileCache(file)?.frontmatter?.codelab_kind==='lesson');
  const projectLesson=lessons.find(file=>{const fm=app.metadataCache.getFileCache(file)?.frontmatter||{};return project&&resolve(app,fm.project,file)?.path===project.path&&status(fm.mastery_state)!=='mastered'});
  const orphanCount=tasks.filter(task=>task.fm.migration_relation_state==='manifest-confirmed-orphan').length;
  const taskToday=todayTasks.map(task=>`- ${renderLink(task.file)} · ${task.fm.status||'unset'} · ${task.fm.priority||'normal'}${task.fm.due?` · due ${task.fm.due}`:''}`);
  const yesterdayRows=completed.map(task=>`- [x] ${renderLink(task.file)}${task.fm.project?` · ${task.fm.project}`:''}${outputByTask.has(task.file.path)?` → ${renderLink(outputByTask.get(task.file.path))}`:''}${task.fm.evidence?` · evidence ${[].concat(task.fm.evidence).join(', ')}`:''}`);
  const warnings=[`- ${orphanCount} imported TaskNotes relation repairs remain explicitly unassigned.`,...blockers.filter(task=>!task.fm.blocker).map(task=>`- Blocked task without a stated blocker: ${renderLink(task.file)}.`)];
  const context=project?`${renderLink(project)} · ${projectFm.current_milestone||'no active milestone'} · ${projectFm.current_phase||'no active phase'}\nFocus: ${app.metadataCache.getFileCache(note)?.frontmatter?.focus_domain||'not set'} / ${projectFm.current_focus||'no project focus'}\nProgress ${projectFm.progress??0}% · health ${projectFm.health||'unreconciled'}\nNext action: ${projectFm.next_action||'none'}`:`No project selected. Choose a focus project or select one in Project Command Center.`;
  const dueRows=[...overdue.map(task=>`- OVERDUE ${renderLink(task.file)} · ${task.fm.due}`),...dueSoon.map(task=>`- ${renderLink(task.file)} · ${task.fm.due}`),...resources.map(file=>`- Resource review: ${renderLink(file)}`)];
  const codelab=projectLesson?`${renderLink(projectLesson)} · ${app.metadataCache.getFileCache(projectLesson)?.frontmatter?.devcycle||'DevCycle'}\nApplied drill: linked TaskNotes only; no task or evidence is generated automatically.\nCode Space: [[2.AREAS/SYSTEM/Code Space/Code Space]]`:`No project-linked active Code Lab lesson. ${lessons.length} DevCycle lessons are available.`;
  const keys={
    CONTEXT:context,
    YESTERDAY:sectionList(yesterdayRows,'- No source-backed TaskNotes completions for the previous working day.'),
    TODAY:sectionList(taskToday,'- No executable tasks are scheduled or ready in the selected project context.')+`\n\nFull execution store: ${linkPath(`${PATHS.bases}/Tasks.base`)}`,
    DEADLINES:sectionList(dueRows,'- No overdue task, seven-day deadline, or due Resource review found.'),
    BLOCKERS:sectionList(blockers.map(task=>`- ${renderLink(task.file)} · ${task.fm.blocker||'status is blocked; no reason recorded'}`),'- No unresolved TaskNotes blockers.'),
    CADENCE:sectionList(meetings.map(file=>`- ${renderLink(file)}`),'- No meeting record exists for this date. Cadence definitions do not create meetings.'),
    OUTPUTS:sectionList([...outputByTask.entries()].filter(([taskPath])=>completed.some(task=>task.file.path===taskPath)).map(([,file])=>`- ${renderLink(file)}`),'- No output is linked to yesterday’s completed tasks.'),
    KNOWLEDGE:`Unprocessed Zettelkasten captures: ${captures.length}\n${sectionList(captures.map(file=>`- ${renderLink(file)} · ${file.parent.name}`),'- No captures await processing.')}\n\nDue Resource reviews: ${resources.length}`,
    CODELAB:codelab,
    HEALTH:sectionList(warnings,'- No unresolved relation or blocker warnings in the TaskNotes store.')+`\nAudit: ${linkPath(`${PATHS.reports}/Hearth Audit.md`)} · Git/vault activity: see [[Hearth/Git and Vault]].`,
    CARRY:sectionList(carried.slice(0,10).map(item=>`- ${renderLink(item.file)} · ${item.text}`),'- No open checklist items found in prior daily notes.')
  };
  return keys;
}

module.exports=async context=>{
  const app=context.app||context,file=app.workspace.getActiveFile();
  if(!file?.path.startsWith(`${PATHS.daily}/`))throw new Error('Open a Daily Note first.');
  const date=app.metadataCache.getFileCache(file)?.frontmatter?.date||file.basename.match(/\d{4}-\d{2}-\d{2}/)?.[0];
  if(!date)throw new Error('Daily note must have an explicit YYYY-MM-DD date.');
  const generated=await render(app,date,file),before=await app.vault.read(file);let after=before;
  for(const [key,value] of Object.entries(generated))after=updateRegion(after,key,value);
  if(after!==before)await app.vault.modify(file,after);
  await app.fileManager.processFrontMatter(file,fm=>{fm.type='daily';fm.id=`DLY-${date}`;fm.date=date;fm.status=fm.status||'open';fm.created=fm.created||date;fm.updated=new Date().toISOString().slice(0,10);fm.last_reconciled=new Date().toISOString()});
  return `Refreshed ${date} generated regions; human-authored content outside those regions was preserved.`;
};
