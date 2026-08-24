function slug(value) {
  return String(value || "").normalize("NFKD").replace(/[^\w\s-]/g, "").trim().toLowerCase().replace(/[\s_]+/g, "-").replace(/-+/g, "-");
}
module.exports = function makeNamespace(system, role, title, kind) {
  return [system, role, title, kind].map(slug).filter(Boolean).join(".");
};
