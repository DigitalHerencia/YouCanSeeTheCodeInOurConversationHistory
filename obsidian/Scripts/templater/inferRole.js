module.exports = function inferRole(folderPath = "") {
  const first = String(folderPath)
    .replace(/\\/g, "/")
    .split("/")
    .filter(Boolean)[0] || "";

  if (first === "Prompter") return "Prömpter";

  const roles = new Set([
    "Chief of Staff",
    "Trust Issues",
    "Execution",
    "Vibes",
    "DevNotes",
    "Schemes",
    "Prömpter",
    "Fuck You Pay Me",
  ]);

  return roles.has(first) ? first : "";
};
