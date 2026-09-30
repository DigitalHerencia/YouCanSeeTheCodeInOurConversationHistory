module.exports = async ({ app, quickAddApi, obsidian }) => {
  const title = (await quickAddApi.inputPrompt("Pattern name"))?.trim();
  if (!title) return;
  const technology = (await quickAddApi.inputPrompt("Technology"))?.trim() || "";
  const path = "2.AREAS/CODE/Patterns/" + title.replace(/[^A-Za-z0-9._-]+/g, "-") + ".md";
  if (app.vault.getAbstractFileByPath(path)) throw new Error("Pattern already exists: " + path);
  const body = "---\ntype: pattern\nid: " + title.toUpperCase().replace(/[^A-Z0-9]+/g, "-") + "\ntechnology: " + technology + "\nstatus: active\ncreated: " + window.moment().format("YYYY-MM-DD") + "\nupdated: " + window.moment().format("YYYY-MM-DD") + "\ntags:\n  - type/pattern\n---\n\n# " + title + "\n\n## Problem\n\n## Pattern\n\n## Why It Works\n\n## Example\n\n## Anti-pattern\n\n## Evidence\n\n## Applied In\n";
  await app.vault.create(path, body);
  await app.workspace.getLeaf(false).openFile(app.vault.getAbstractFileByPath(path));
  new obsidian.Notice("Pattern created.");
};
