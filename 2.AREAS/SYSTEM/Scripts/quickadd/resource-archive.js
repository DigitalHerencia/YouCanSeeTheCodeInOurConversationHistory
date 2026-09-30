module.exports = async ({ app, obsidian }) => {
  const file=app.workspace.getActiveFile(); if(!(file instanceof obsidian.TFile))throw new Error("Open a resource first.");
  const folder="4.ARCHIVE/Resources"; if(!app.vault.getAbstractFileByPath(folder))await app.vault.createFolder(folder);
  await app.fileManager.renameFile(file,folder+"/"+file.name);
  await app.fileManager.processFrontMatter(file,fm=>{fm.status="archived";fm.updated=window.moment().format("YYYY-MM-DD");});
  new obsidian.Notice("Resource archived.");
};
