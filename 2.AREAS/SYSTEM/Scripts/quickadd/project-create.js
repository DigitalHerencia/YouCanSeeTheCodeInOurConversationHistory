module.exports = async ({ app, quickAddApi, obsidian }) => {
  const name = await quickAddApi.inputPrompt("Project name");
  if (!name) return;
  const root = "1.PROJECTS/" + name.trim();
  if (app.vault.getAbstractFileByPath(root)) throw new Error("Project already exists: " + root);
  await app.vault.createFolder(root);
  await app.vault.create(root + "/" + name.trim() + ".md", "# " + name.trim() + "\n");
  new obsidian.Notice("Project created: " + name.trim());
};
