module.exports = async ({ app, quickAddApi, obsidian }) => {
  const file=app.workspace.getActiveFile(); if(!(file instanceof obsidian.TFile))throw new Error("Open a Code Lab note first.");
  const mastery=await quickAddApi.inputPrompt("Mastery (0-100)"); const n=Number(mastery); if(!Number.isFinite(n))throw new Error("Mastery must be numeric.");
  await app.fileManager.processFrontMatter(file,fm=>{fm.mastery=Math.max(0,Math.min(100,n));fm.mastery_state=n>=100?"mastered":n>=70?"proficient":"learning";fm.updated=window.moment().format("YYYY-MM-DD");});
  new obsidian.Notice("Mastery updated.");
};
