module.exports = function hearthId(tp, value = "") {
  const base = String(value || tp?.file?.title || "note")
    .replace(/[{}]/g, "")
    .trim()
    .replace(/[^A-Za-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "")
    .toUpperCase()
    .slice(0, 48);
  const date = tp?.date?.now ? tp.date.now("YYYYMMDDHHmmss") : new Date().toISOString().replace(/[-:TZ.]/g, "").slice(0, 14);
  return base ? `${base}-${date}` : `NOTE-${date}`;
};
