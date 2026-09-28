module.exports=async p=>{
 const app=p.app,active=app.workspace.getActiveFile(),taskCommand='tasknotes:create-new-task';
 if(!app.commands.commands[taskCommand])throw new Error('Installed TaskNotes command tasknotes:create-new-task is unavailable.');
 await app.commands.executeCommandById(taskCommand);
 const current=app.workspace.getActiveFile();if(!current||!current.path.startsWith('2.AREAS/SYSTEM/_Tasks/'))return 'TaskNotes task composer opened. Finish the TaskNotes form; relation reconciliation is available from the saved task note.';
 const fm=app.metadataCache.getFileCache(current)?.frontmatter||{};if(fm.type!=='task')return 'TaskNotes created/opened the task, but its saved note does not yet expose task type; no inferred links were written.';
 const context=active&&app.metadataCache.getFileCache(active)?.frontmatter||{};const explicit={};
 if(context.type==='project')explicit.project=active;
 else if(context.type==='phase'){explicit.phase=active;if(context.project)explicit.project=app.metadataCache.getFirstLinkpathDest(String(context.project).replace(/^\[\[|\]\]$/g,'').split('|')[0],active.path);if(context.milestone)explicit.milestone=app.metadataCache.getFirstLinkpathDest(String(context.milestone).replace(/^\[\[|\]\]$/g,'').split('|')[0],active.path);}
 else if(context.type==='milestone'){explicit.milestone=active;if(context.project)explicit.project=app.metadataCache.getFirstLinkpathDest(String(context.project).replace(/^\[\[|\]\]$/g,'').split('|')[0],active.path);}
 else if(context.type==='project-board'&&context.project)explicit.project=app.metadataCache.getFirstLinkpathDest(String(context.project).replace(/^\[\[|\]\]$/g,'').split('|')[0],active.path);
 const {wiki}=require(app.vault.adapter.getBasePath()+'/2.AREAS/SYSTEM/Scripts/templater/core/paths.js');
 if(Object.keys(explicit).length){await app.fileManager.processFrontMatter(current,x=>{for(const [key,file]of Object.entries(explicit))if(file)x[key]=wiki(file.path);if(explicit.project){const pf=app.metadataCache.getFileCache(explicit.project)?.frontmatter||{};if(pf.project_code)x.project_code=pf.project_code}x.updated=new Date().toISOString().slice(0,10)});}
 await require(app.vault.adapter.getBasePath()+'/2.AREAS/SYSTEM/Scripts/templater/core/reconcile.js').run(app);
 return Object.keys(explicit).length?'TaskNotes record saved and explicit active-note context attached.':'TaskNotes record saved without relations because no explicit project/phase/milestone context was open.';
};
