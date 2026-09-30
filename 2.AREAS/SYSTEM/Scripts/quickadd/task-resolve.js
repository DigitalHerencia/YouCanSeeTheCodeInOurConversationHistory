module.exports = async ({ app, obsidian }) => {
  const file = app.workspace.getActiveFile();
  if (!(file instanceof obsidian.TFile)) throw new Error("Open a task note first.");
  await app.fileManager.processFrontMatter(file, fm => { fm.status = "ready"; fm.blocker = ""; fm.updated = window.moment().format("YYYY-MM-DD"); });
  new obsidian.Notice("Task blocker resolved.");
};
