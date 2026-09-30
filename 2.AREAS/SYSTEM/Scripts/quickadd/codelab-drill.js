module.exports = async ({ app, obsidian }) => {
  const file=app.workspace.getActiveFile(); if(!(file instanceof obsidian.TFile))throw new Error("Open a task note first.");
  const cache=app.metadataCache.getFileCache(file); const title=file.basename+" — Applied Drill";
  const folder="2.AREAS/CODE/Drills"; if(!app.vault.getAbstractFileByPath(folder))await app.vault.createFolder(folder);
  const path=folder+"/"+title.replace(/[^A-Za-z0-9._-]+/g,"-")+".md";
  const body="---\ntype: applied-drill\nsource_task: ""+file.path+""\nstatus: not-started\ncreated: "+window.moment().format("YYYY-MM-DD")+"\nupdated: "+window.moment().format("YYYY-MM-DD")+"\ntags:\n  - type/applied-drill\n---\n\n# "+title+"\n\n## Skill\n\n## Exercise\n\n## Constraints\n\n## Result\n\n## Evidence\n";
  const f=await app.vault.create(path,body); await app.workspace.getLeaf(false).openFile(f); new obsidian.Notice("Applied Drill created.");
};
