module.exports = async ({ app, obsidian }) => {
  const file=app.workspace.getActiveFile(); if(!(file instanceof obsidian.TFile))throw new Error("Open a project note first.");
  await app.fileManager.processFrontMatter(file,fm=>{fm.codelab_enabled=true;fm.updated=window.moment().format("YYYY-MM-DD");});
  new obsidian.Notice("Code Lab enabled on project.");
};
