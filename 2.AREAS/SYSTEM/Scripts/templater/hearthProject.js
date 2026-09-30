module.exports = function hearthProject(tp) {
  const target = tp?.config?.target_file;
  const path = target?.path || tp?.file?.path(true) || "";
  const match = path.match(/^1\.PROJECTS\/([^/]+)/);
  return match ? match[1] : "";
};
