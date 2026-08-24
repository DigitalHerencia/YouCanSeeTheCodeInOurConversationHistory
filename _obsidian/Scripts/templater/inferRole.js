module.exports = function inferRole(folderPath = "") {
  const first = String(folderPath).replace(/\\/g, "/").split("/").filter(Boolean)[0] || "";
  const map = {
    "Chief of Staff": "chief-of-staff",
    "Trust Issues": "trust-issues",
    "Execution": "execution",
    "Vibes": "vibes",
    "DevNotes": "devnotes",
    "Schemes": "schemes",
    "Prömpter": "prompter",
    "Prompter": "prompter",
    "Fuck You Pay Me": "fuck-you-pay-me",
  };
  return map[first] || "devnotes";
};
