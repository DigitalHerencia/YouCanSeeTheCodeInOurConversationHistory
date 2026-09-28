const {PATHS}=require('../Scripts/templater/core/config');
const {nextSequential}=require('../Scripts/templater/core/ids');
const {wiki}=require('../Scripts/templater/core/paths');
module.exports=async(params,stream='Inbox')=>{
 const app=params.app,api=params.quickAddApi||app.plugins.plugins.quickadd?.api,folders={Inbox:'Inbox',AI:'AI Threads',Clipping:'Web Clippings',Fleeting:'Fleeting',Literature:'Literature'},folder=folders[stream];
 if(!folder)throw new Error(`Unknown Zettelkasten stream: ${stream}`);
 const title=await api.inputPrompt(`Capture ${stream}`,'Enter a concise source or working title.');if(!title)return 'Capture cancelled.';
 const folderPath=`${PATHS.zettelkasten}/${folder}`;if(!app.vault.getAbstractFileByPath(folderPath))await app.vault.createFolder(folderPath);
 const date=new Date().toISOString().slice(0,10),files=app.vault.getMarkdownFiles().map(file=>({file,frontmatter:app.metadataCache.getFileCache(file)?.frontmatter||{}})),id=nextSequential(files,'ZET-',6),path=`${folderPath}/${title.replace(/[\\/:*?"<>|]/g,'-')}.md`;
 if(app.vault.getAbstractFileByPath(path))throw new Error(`Capture already exists: ${path}`);
 await app.vault.create(path,`---\ntype: zettel-workbench\nid: ${id}\nstate: inbox\nstream: ${folder}\ncapture_source: ${stream.toLowerCase()}\ncreated: ${date}\nupdated: ${date}\ntags: [type/zettel, state/inbox]\n---\n# ${title}\n\n## Source and provenance\n- URL or source note:\n- Creator:\n- Published:\n- Captured: ${date}\n\n## Why capture this\nRecord the question, project, lesson, or decision that prompted capture.\n\n## Claims and observations\nSeparate source claims from interpretation. Keep citations and quotations attributed.\n\n## Processing decision\n- [ ] Keep as a durable reference\n- [ ] Extract a reusable concept or pattern\n- [ ] Link to a project or Code Lab lesson\n- [ ] Discard with a reason\n\n## Durable outputs\nProcess this workbench note into a provenance-linked Resource under 3.RESOURCES.\n`);
 return `Captured ${wiki(path)} in Zettelkasten/${folder}.`;
};
