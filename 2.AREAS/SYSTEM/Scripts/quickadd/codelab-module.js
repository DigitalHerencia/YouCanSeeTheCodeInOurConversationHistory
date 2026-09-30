module.exports = async ({ app, quickAddApi, obsidian }) => {
  const title = (await quickAddApi.inputPrompt("Code Lab module"))?.trim();
  if (!title) return;
  const path = "2.AREAS/CODE/Modules/" + title.replace(/[^A-Za-z0-9._-]+/g, "-") + ".md";
  if (app.vault.getAbstractFileByPath(path)) throw new Error("Module already exists: " + path);
  const body = "---\ntype: codelab\ncodelab_kind: module\ntitle: " + title + "\nstatus: not-started\nmastery: 0\nconfidence: 0\ncreated: " + window.moment().format("YYYY-MM-DD") + "\nupdated: " + window.moment().format("YYYY-MM-DD") + "\ntags:\n  - type/codelab\n---\n\n# " + title + "\n\n## Domain\n\n## Dev Cycle\n\n## Standards\n\n## Patterns\n\n## Lessons\n\n## Assessment\n\n## Evidence\n";
  const folder = "2.AREAS/CODE/Modules";
  if (!app.vault.getAbstractFileByPath(folder)) await app.vault.createFolder(folder);
  const file = await app.vault.create(path, body);
  await app.workspace.getLeaf(false).openFile(file);
  new obsidian.Notice("Code Lab module created.");
};
