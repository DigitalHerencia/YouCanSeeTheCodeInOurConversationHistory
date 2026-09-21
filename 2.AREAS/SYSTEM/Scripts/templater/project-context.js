module.exports = async (tp) => {
  const file = tp.file.find_tfile(tp.file.path(true));
  if (!file) return "";

  const cache = app.metadataCache.getFileCache(file);
  const frontmatter = cache?.frontmatter ?? {};
  const fields = ["status", "phase", "progress", "priority", "due"];
  const rows = fields
    .filter((key) => frontmatter[key] !== undefined && frontmatter[key] !== null && frontmatter[key] !== "")
    .map((key) => `- ${key}: ${frontmatter[key]}`);

  return rows.length ? `### Current Context\n\n${rows.join("\n")}\n` : "";
};
