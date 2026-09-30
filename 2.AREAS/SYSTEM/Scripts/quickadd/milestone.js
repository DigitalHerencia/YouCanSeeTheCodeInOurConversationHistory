module.exports = async ({ app, quickAddApi, obsidian }) => {
  const project = (await quickAddApi.inputPrompt("Project"))?.trim();
  const id = (await quickAddApi.inputPrompt("Milestone ID (for example M1)"))?.trim();
  const title = (await quickAddApi.inputPrompt("Milestone title"))?.trim();
  if (!project || !id || !title) return;
  const folder = "1.PROJECTS/" + project + "/Milestones";
  if (!app.vault.getAbstractFileByPath(folder)) await app.vault.createFolder(folder);
  const path = folder + "/" + id + " — " + title + ".md";
  if (app.vault.getAbstractFileByPath(path)) throw new Error("Milestone already exists.");
  const body = "---\ntype: milestone\nid: " + id + "\nproject: " + project + "\nnumber: " + id + "\ntitle: " + title + "\nstatus: backlog\n---\n\n# " + id + " — " + title + "\n\n## Objective\n\n## Phases\n";
  const file = await app.vault.create(path, body);
  await app.workspace.getLeaf(false).openFile(file);
  new obsidian.Notice("Milestone created.");
};
