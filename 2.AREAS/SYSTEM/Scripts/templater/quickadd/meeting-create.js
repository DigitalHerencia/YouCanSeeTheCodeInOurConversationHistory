const {PATHS}=require('../core/config');
module.exports=async p=>{
 const app=p.app,api=app.plugins.plugins.quickadd?.api,defs=JSON.parse(await app.vault.read(app.vault.getAbstractFileByPath(`${PATHS.config}/meeting-definitions.json`)));
 const kind=p.variables?.meetingType||'';const m=defs.meetings.find(x=>x.type.toLowerCase().replace(/[^a-z]+/g,'-')===kind)||await api.suggester(defs.meetings.map(x=>`${x.name} — ${x.cadence}`),defs.meetings);if(!m)return 'Meeting creation cancelled.';
 const date=await api.inputPrompt('Meeting date','YYYY-MM-DD',new Date().toISOString().slice(0,10));if(!date)return 'Meeting creation cancelled.';if(!/^\d{4}-\d{2}-\d{2}$/.test(date))throw new Error('Use YYYY-MM-DD.');
 const folder=m.folder;await app.vault.adapter.mkdir(folder);const path=`${folder}/${date} ${m.name}.md`;let file=app.vault.getAbstractFileByPath(path);if(file){await app.workspace.getLeaf(true).openFile(file);return `Opened existing ${m.name} for ${date}.`;}
 const template=app.vault.getAbstractFileByPath(`${PATHS.templates}/${m.template}`);if(!template)throw new Error(`Missing meeting template ${m.template}`);let content=await app.vault.read(template);content=content.replace(/<%\s*tp\.date\.now\(["']YYYY-MM-DD["']\)\s*%>/g,date).replace(/<%\s*tp\.date\.now\(["']dddd, MMMM D, YYYY["']\)\s*%>/g,date);
 file=await app.vault.create(path,content);await app.fileManager.processFrontMatter(file,fm=>{fm.type='meeting';fm.date=date;fm.meeting_type=m.type.toLowerCase().replace(/\s+/g,'-');fm.cadence=m.cadence;fm.source_identity=m.sourceIdentity;fm.source_path=m.sourcePath;fm.created=date;fm.updated=date});await app.workspace.getLeaf(true).openFile(file);return `Generated on-demand ${m.name} for ${date}.`;
};
