module.exports = async ({ app, quickAddApi, obsidian }) => {
  const file = app.workspace.getActiveFile();
  if (!(file instanceof obsidian.TFile)) throw new Error("Open a task note first.");
  const reason = (await quickAddApi.inputPrompt("Blocker"))?.trim() || "";
  await app.fileManager.processFrontMatter(file, fm => { fm.status = "blocked"; fm.blocker = reason; fm.updated = window.moment().format("YYYY-MM-DD"); });
  new obsidian.Notice("Task marked blocked.");
};
