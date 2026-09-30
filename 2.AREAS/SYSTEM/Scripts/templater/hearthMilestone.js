module.exports = function hearthMilestone(tp) {
  const target = tp?.config?.target_file;
  const path = target?.path || tp?.file?.path(true) || "";
  const parts = path.split("/");
  const i = parts.indexOf("Milestones");
  return i >= 0 && parts[i + 1] ? parts[i + 1].replace(/\.md$/, "") : "";
};
