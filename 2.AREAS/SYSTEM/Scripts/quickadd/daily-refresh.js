module.exports = async ({ app, obsidian }) => {
  const command=Object.values(app.commands.commands).find(c=>/daily notes.*open|open.*daily note/i.test(c.name));
  if(command)await app.commands.executeCommandById(command.id);
  else {
    const folder=app.vault.getAbstractFileByPath("2.AREAS/DAILY");
    if(folder instanceof obsidian.TFolder)await app.workspace.getLeaf(false).openFile(folder);
  }
  new obsidian.Notice("Daily workspace opened.");
};
