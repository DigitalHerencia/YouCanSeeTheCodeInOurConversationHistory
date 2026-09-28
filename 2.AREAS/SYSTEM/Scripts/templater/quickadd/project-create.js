const {PATHS}=require('../core/config');
const {nextProjectId,slug}=require('../core/ids');
const {wiki}=require('../core/paths');

module.exports=async p=>{
 const app=p.app,api=app.plugins.plugins.quickadd?.api;
 if(!api)throw new Error('QuickAdd API unavailable.');
 const types=JSON.parse(await app.vault.read(app.vault.getAbstractFileByPath(PATHS.config+'/project-types.json')));
 const blueprints=JSON.parse(await app.vault.read(app.vault.getAbstractFileByPath(PATHS.config+'/ontology-blueprints.json')));
 let preset={};try{preset=JSON.parse(p.variables?.preset||'{}')}catch{throw new Error('Invalid project preset JSON.');}
 const projectType=preset.projectType||await api.suggester(Object.entries(types).map(([k,v])=>k+' — '+v.label),Object.keys(types));
 if(!projectType||!types[projectType])return 'Project creation cancelled.';
 const ontology=preset.ontologyId?blueprints.modules.find(x=>x.id===preset.ontologyId):null;
 if(preset.ontologyId&&!ontology)throw new Error('Unknown ontology: '+preset.ontologyId);
 const title=await api.inputPrompt('Project name','Use the approved project name. Do not invent requirements.');
 if(!title)return 'Project creation cancelled.';
 const rows=app.vault.getMarkdownFiles().map(file=>({file,frontmatter:app.metadataCache.getFileCache(file)?.frontmatter||{}}));
 const id=nextProjectId(rows,projectType,'M1'),folder=PATHS.projects+'/'+id+' '+slug(title).toLowerCase();
 if(app.vault.getAbstractFileByPath(folder))throw new Error('Project folder already exists: '+folder);
 await app.vault.createFolder(folder);
 const date=new Date().toISOString().slice(0,10),projectPath=folder+'/Project.md',milestonePath=folder+'/Milestone M1.md',phasePath=folder+'/Phase P1.1.md',projectLink=wiki(projectPath),milestoneLink=wiki(milestonePath),phaseLink=wiki(phasePath);
 const projectBody=['---','type: project','id: '+id,'project_type: '+projectType,'project_code: '+id+'-P1.1-'+slug(title),'status: backlog','priority: normal','target_end: null','current_focus: ""','blocker: ""','codelab_enabled: '+(ontology?'true':'false'),ontology?'codelab_module: "[[2.AREAS/SYSTEM/Code Lab/Modules/'+ontology.id+' '+ontology.name.replace(/[^A-Za-z0-9]+/g,'-')+'/Module]]"':null,'created: '+date,'updated: '+date,'tags: [type/project]','---','# '+title,'','## Human controls','Status: `INPUT[select(option(backlog), option(ready), option(in-progress), option(review), option(done), option(cancelled)):status]` · Priority: `INPUT[select(option(low), option(normal), option(high)):priority]` · Target: `INPUT[date:target_end]`','Focus: `INPUT[text:current_focus]` · Blocker: `INPUT[text:blocker]` · Code Lab: `INPUT[toggle:codelab_enabled]`','','## Purpose and approved outcome','Record the owner-approved outcome and its source. No requirements are inferred during creation.','','## Current state','<!-- HEARTH:BEGIN PROJECT-STATE -->','Reconciled automatically from linked execution records.','<!-- HEARTH:END PROJECT-STATE -->','','## Execution','- Board: [[Board]]','- Milestone: [[Milestone M1]]','- Phase: [[Phase P1.1]]','![[2.AREAS/SYSTEM/Bases/Active Project Tasks.base]]','','## Project pack','- [[Project Charter]]','- [[Roadmap]]','- [[Project Index]]'].filter(Boolean).join('\n');
 await app.vault.create(projectPath,projectBody);
 await app.vault.create(milestonePath,['---','type: milestone','id: '+id+'-M01','project: "'+projectLink+'"','number: M01','status: backlog','target_end: null','risk: unknown','created: '+date,'updated: '+date,'tags: [type/milestone]','---','# M01 — Foundation','','## Human controls','Status: `INPUT[select(option(backlog), option(ready), option(in-progress), option(review), option(done), option(cancelled)):status]` · Target: `INPUT[date:target_end]` · Risk: `INPUT[select(option(unknown), option(low), option(medium), option(high)):risk]`','','## Phases','- [[Phase P1.1]]'].join('\n'));
 await app.vault.create(phasePath,['---','type: phase','id: '+id+'-P01.1','project: "'+projectLink+'"','milestone: "'+milestoneLink+'"','number: P01.1','status: backlog','target_end: null','risk: unknown','created: '+date,'updated: '+date,'tags: [type/phase]','---','# P01.1 — Definition & Setup','','## Human controls','Status: `INPUT[select(option(backlog), option(ready), option(in-progress), option(blocked), option(review), option(done), option(cancelled)):status]` · Target: `INPUT[date:target_end]` · Risk: `INPUT[select(option(unknown), option(low), option(medium), option(high)):risk]`','','## Tasks','![[2.AREAS/SYSTEM/Bases/Active Project Tasks.base]]'].join('\n'));
 const docs={'Project Charter.md':'Record approved context, scope, constraints, assumptions, dependencies, and ownership.','Roadmap.md':'- [[Milestone M1]]\n  - [[Phase P1.1]]','Project Index.md':'- [[Project]]\n- [[Project Charter]]\n- [[Roadmap]]\n- [[Board]]\n- [[Milestone M1]]\n- [[Phase P1.1]]','Board.md':['---','type: project-board','id: BOARD-'+id,'project: "'+projectLink+'"','created: '+date,'updated: '+date,'tags: [type/kanban]','---','# '+title+' — Milestone Board','','## Backlog','- [[Milestone M1]]','','## Ready','','## In Progress','','## Review','','## Done','','## Cancelled','','TaskNotes remains execution truth.'].join('\n')};
 for(const [name,body]of Object.entries(docs)){if(name==='Board.md')await app.vault.create(folder+'/'+name,body);else await app.vault.create(folder+'/'+name,['---','type: project-artifact','project: "'+projectLink+'"','created: '+date,'updated: '+date,'tags: [type/document]','---','# '+title+' — '+name.replace('.md',''),'',body].join('\n'));}
 const ctx=app.vault.getAbstractFileByPath(PATHS.state+'/Project Context.md');if(ctx)await app.fileManager.processFrontMatter(ctx,fm=>{fm.project=projectLink;fm.updated=date});
 await require('../core/reconcile').run(app);
 await app.workspace.getLeaf(true).openFile(app.vault.getAbstractFileByPath(projectPath));
 return 'Created '+id+' from approved '+projectType+(ontology?' / '+ontology.id:'')+' blueprint.';
};