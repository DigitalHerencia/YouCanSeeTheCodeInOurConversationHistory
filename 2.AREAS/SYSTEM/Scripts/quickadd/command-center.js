module.exports = async ({ app, obsidian }) => {
  const command=Object.values(app.commands.commands).find(c=>/command center/i.test(c.name));
  if(command){await app.commands.executeCommandById(command.id);return;}
  const f=app.vault.getAbstractFileByPath("2.AREAS/SYSTEM/Dashboards/Command Center.md");
  if(f instanceof obsidian.TFile)await app.workspace.getLeaf(false).openFile(f);else throw new Error("Command Center destination not found.");
};
