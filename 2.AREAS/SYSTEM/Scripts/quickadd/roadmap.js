module.exports = async ({ app, quickAddApi, obsidian }) => {
  const project = (await quickAddApi.inputPrompt("Project"))?.trim();
  const milestone = (await quickAddApi.inputPrompt("Milestone"))?.trim();
  const phase = (await quickAddApi.inputPrompt("Phase"))?.trim();
  const id = (await quickAddApi.inputPrompt("RoadMap ID"))?.trim();
  const title = (await quickAddApi.inputPrompt("RoadMap title"))?.trim();
  if (!project || !milestone || !phase || !id || !title) return;
  const folder = "1.PROJECTS/" + project + "/RoadMaps";
  if (!app.vault.getAbstractFileByPath(folder)) await app.vault.createFolder(folder);
  const path = folder + "/" + id + " — " + title + ".md";
  if (app.vault.getAbstractFileByPath(path)) throw new Error("RoadMap already exists.");
  const body = "---\ntype: roadmap\nroadmap_id: " + id + "\nproject: " + project + "\nmilestone: " + milestone + "\nphase: " + phase + "\ntitle: " + title + "\nstatus: ready\n---\n\n# " + id + " — " + title + "\n\n## Purpose\n\n## Key Activities\n\n## Primary Outputs\n\n## Tasks\n";
  const file = await app.vault.create(path, body);
  await app.workspace.getLeaf(false).openFile(file);
  new obsidian.Notice("RoadMap created.");
};
