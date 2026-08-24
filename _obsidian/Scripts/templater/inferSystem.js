module.exports = function inferSystem(folderPath = "") {
  const parts = String(folderPath).replace(/\\/g, "/").split("/").filter(Boolean);
  const i = parts.indexOf("Workspaces");
  const workspace = i >= 0 && parts[i + 1]
    ? parts[i + 1].normalize("NFKD").replace(/[^\w\s-]/g, "").trim().toLowerCase().replace(/[\s_]+/g, "-")
    : "";
  const knownSystems = {
    "codependent-coding": "codependent-coding",
    "devnotes": "devnotes",
    "devnotes-unified-migration": "devnotes",
  };
  return knownSystems[workspace] || (parts[0] === "DevNotes" ? "devnotes" : "");
};
