const {PATHS}=require('../Scripts/templater/core/config');
const {nextSequential}=require('../Scripts/templater/core/ids');
const {wiki}=require('../Scripts/templater/core/paths');
module.exports=async(params,meetingName)=>{
 const app=params.app,api=params.quickAddApi||app.plugins.plugins.quickadd?.api,definitions=JSON.parse(await app.vault.read(app.vault.getAbstractFileByPath(`${PATHS.config}/meeting-definitions.json`)));
 const definition=definitions.meetings.find(item=>item.name===meetingName);if(!definition)throw new Error(`Unknown meeting definition: ${meetingName}`);
 const date=await api.inputPrompt(`${meetingName} date`,'YYYY-MM-DD',new Date().toISOString().slice(0,10));if(!date)return 'Meeting generation cancelled.';
 if(!/^\d{4}-\d{2}-\d{2}$/.test(date))throw new Error('Meeting date must use YYYY-MM-DD.');
 const folder=definition.folder; if(!app.vault.getAbstractFileByPath(folder))await app.vault.createFolder(folder);
 const title=`${date} ${meetingName}`,path=`${folder}/${title}.md`;if(app.vault.getAbstractFileByPath(path))return `Meeting already exists: ${wiki(path)}`;
 const source=definition.sourcePath.replace(/\.md$/,'');const sourceLink=wiki(source),all=app.vault.getMarkdownFiles().map(file=>({file,frontmatter:app.metadataCache.getFileCache(file)?.frontmatter||{}}));
 const id=nextSequential(all,'MEET-',4),dateNow=new Date().toISOString().slice(0,10);
 const sourceFile=app.vault.getAbstractFileByPath(definition.sourcePath),sourceBody=sourceFile?await app.vault.read(sourceFile):'';
 const content=sourceBody?sourceBody.replace(/^---[\s\S]*?---\s*/,'').replace(/^#.*$/m,'').trim():`Use the migrated ${meetingName} agenda source linked below. Preserve discussion notes and decisions from the actual meeting.`;
 await app.vault.create(path,`---\ntype: meeting\nid: ${id}\nmeeting_type: ${JSON.stringify(meetingName)}\ncadence: ${definition.cadence}\ndate: ${date}\nsource_identity: ${definition.sourceIdentity}\nsource_path: ${JSON.stringify(definition.sourcePath)}\nsource_template: ${JSON.stringify(sourceLink)}\nstatus: scheduled\ncreated: ${dateNow}\nupdated: ${dateNow}\ntags: [type/meeting]\n---\n# ${meetingName} — ${date}\n\n## Migrated cadence and agenda\n${content}\n\n## Project and phase context\nLink only the project, milestone, or phase explicitly scheduled for this meeting.\n\n## Discussion and decisions\n\n## Actions\nCreate executable actions as TaskNotes and link them here.\n\n## Provenance\nThis on-demand meeting uses the canonical Notion definition ${sourceLink}. Only this requested occurrence was generated; no historical cadence was expanded.\n`);
 return `Generated on-demand ${meetingName} for ${date}.`;
};
