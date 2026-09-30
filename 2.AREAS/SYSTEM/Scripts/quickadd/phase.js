module.exports = async ({ app, quickAddApi, obsidian }) => {
  const project = (await quickAddApi.inputPrompt("Project"))?.trim();
  const milestone = (await quickAddApi.inputPrompt("Milestone"))?.trim();
  const id = (await quickAddApi.inputPrompt("Phase ID (for example P1.1)"))?.trim();
  const title = (await quickAddApi.inputPrompt("Phase title"))?.trim();
  if (!project || !milestone || !id || !title) return;
  const folder = "1.PROJECTS/" + project + "/Phases";
  if (!app.vault.getAbstractFileByPath(folder)) await app.vault.createFolder(folder);
  const path = folder + "/" + id + " — " + title + ".md";
  if (app.vault.getAbstractFileByPath(path)) throw new Error("Phase already exists.");
  const body = "---\ntype: phase\nid: " + id + "\nproject: " + project + "\nmilestone: " + milestone + "\nnumber: " + id + "\ntitle: " + title + "\nstatus: backlog\n---\n\n# " + id + " — " + title + "\n\n## Purpose\n\n## RoadMap\n\n## Tasks\n";
  const file = await app.vault.create(path, body);
  await app.workspace.getLeaf(false).openFile(file);
  new obsidian.Notice("Phase created.");
};
