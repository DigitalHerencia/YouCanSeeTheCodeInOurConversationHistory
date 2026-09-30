module.exports = async ({ app, quickAddApi, obsidian }) => {
  const file=app.workspace.getActiveFile(); if(!(file instanceof obsidian.TFile))throw new Error("Open an archived resource first.");
  const target=(await quickAddApi.suggester(["Articles","Books","Documentation","General","Knowledge","Media","Repositories"],["Articles","Books","Documentation","General","Knowledge","Media","Repositories"],"Restore destination"))||"Knowledge";
  const folder="3.RESOURCES/"+target; if(!app.vault.getAbstractFileByPath(folder))await app.vault.createFolder(folder);
  await app.fileManager.renameFile(file,folder+"/"+file.name);
  await app.fileManager.processFrontMatter(file,fm=>{fm.status="active";fm.updated=window.moment().format("YYYY-MM-DD");});
  new obsidian.Notice("Resource restored.");
};
