module.exports = function inferWorkspace(folderPath = "") {
  const parts = String(folderPath).replace(/\\/g, "/").split("/").filter(Boolean);
  const i = parts.indexOf("Workspaces");
  if (i < 0 || !parts[i + 1]) return "";
  return parts[i + 1].normalize("NFKD").replace(/[^\w\s-]/g, "").trim().toLowerCase().replace(/[\s_]+/g, "-");
};
