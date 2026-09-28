const {PATHS}=require('../core/config');
module.exports=async p=>{
 const app=p.app,api=app.plugins.plugins.quickadd?.api,kind=p.variables?.kind||'capture';
 if(!api)throw new Error('QuickAdd API unavailable.');
 const routes={capture:['Inbox','Zettel Workbench.template.md','zettel-workbench'],fleeting:['Fleeting','Fleeting Note.template.md','fleeting-note'],clipping:['Clippings','Web Clipping.template.md','web-clipping'],ai:['AI Threads','AI Thread.template.md','ai-thread'],literature:['Literature','Literature.template.md','literature']};
 const route=routes[kind];if(!route)throw new Error(`Unknown capture kind: ${kind}`);
 const title=await api.inputPrompt('Capture title','A short source-grounded title');if(!title)return 'Capture cancelled.';
 const folder=`${PATHS.zettelkasten}/${route[0]}`;await app.vault.adapter.mkdir(folder);
 const path=`${folder}/${title.replace(/[\\/:*?"<>|]/g,'-')}.md`;const existing=app.vault.getAbstractFileByPath(path);if(existing){await app.workspace.getLeaf(true).openFile(existing);return `Opened existing capture ${title}.`;}
 const tpl=app.vault.getAbstractFileByPath(`${PATHS.templates}/${route[1]}`);if(!tpl)throw new Error(`Missing canonical template ${route[1]}`);
 let content=await app.vault.read(tpl);content=content.replaceAll('{{TITLE}}',title).replaceAll('{{VALUE}}',title);
 const date=new Date().toISOString().slice(0,10);content=content.replace(/<%\s*tp\.date\.now\(["']YYYY-MM-DD["']\)\s*%>/g,date).replace(/<%\s*tp\.file\.title\s*%>/g,title);
 const file=await app.vault.create(path,content);await app.fileManager.processFrontMatter(file,fm=>{fm.type='zettel-workbench';fm.id=`ZET-${date.replace(/-/g,'')}-${String(app.vault.getMarkdownFiles().filter(x=>x.path.startsWith(`${PATHS.zettelkasten}/`)).length).padStart(4,'0')}`;fm.state='inbox';fm.capture_kind=kind;fm.created=date;fm.updated=date;fm.tags=[...new Set([...(fm.tags||[]),'type/resource'])]});await app.workspace.getLeaf(true).openFile(file);
 return `Captured ${title} in the Zettelkasten ${route[0]} workbench.`;
};

