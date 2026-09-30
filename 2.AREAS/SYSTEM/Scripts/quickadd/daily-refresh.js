module.exports = async ({ app, obsidian }) => {
  const command=app.commands.findCommand("daily-notes");
  const file=app.vault.getAbstractFileByPath("2.AREAS/DAILY");
  if(command)await app.commands.executeCommandById(command.id);
  else if(file instanceof obsidian.TFolder)await app.workspace.getLeaf(false).openFile(file);
  new obsidian.Notice("Daily workspace opened.");
};
