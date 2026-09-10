module.exports = async (tp) => {
  const files = app.vault.getMarkdownFiles().filter((file) => file.path.startsWith("1.PROJECTS/") && file.name === "Project.md");
  if (!files.length) return "";
  const selected = await tp.system.suggester(files.map((file) => file.parent?.name ?? file.basename), files);
  return selected ? `[[${selected.path}|${selected.parent?.name ?? selected.basename}]]` : "";
};
