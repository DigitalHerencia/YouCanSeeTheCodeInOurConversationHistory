module.exports = async ({ app, quickAddApi, obsidian }) => {
  const title=(await quickAddApi.inputPrompt("Pattern to review"))?.trim(); if(!title)return;
  const folder="2.AREAS/CODE/Patterns"; const target=app.vault.getAbstractFileByPath(folder+"/"+title+".md");
  if(!(target instanceof obsidian.TFile))throw new Error("Pattern note not found.");
  await app.workspace.getLeaf(false).openFile(target); new obsidian.Notice("Reviewing pattern: "+title);
};
