module.exports = async ({ app, obsidian }) => {
  const command=Object.values(app.commands.commands).find(c=>/code space.*dashboard/i.test(c.name));
  if(!command)throw new Error("CodeSpace dashboard command not found.");
  await app.commands.executeCommandById(command.id); new obsidian.Notice("CodeSpace opened.");
};
