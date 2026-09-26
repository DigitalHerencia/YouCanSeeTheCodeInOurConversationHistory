module.exports = async (tp) => {
  const { app } = tp;
  const files = app.vault.getMarkdownFiles();
  const read = async f => app.metadataCache.getFileCache(f)?.frontmatter || {};
  const links = v => (Array.isArray(v) ? v : v ? [v] : []).map(String);
  const norm = s => String(s || '').replace(/^\[\[|\]\]$/g, '').split('|')[0].split('#')[0].trim();
  const relatesTo = (value, source, targets) => links(value).some(raw => {
    const resolved = app.metadataCache.getFirstLinkpathDest(norm(raw), source.path);
    return !!resolved && targets.has(resolved.path);
  });
  const tasks = [];
  for (const f of files.filter(x => x.path.startsWith('2.AREAS/SYSTEM/_Tasks/'))) tasks.push({f, fm: await read(f)});
  const unresolvedRelations = tasks.some(t => t.fm.migration_relation_state && t.fm.migration_relation_state !== 'verified-ticketing-source' && t.fm.migration_relation_state !== 'resolved');
  const isDone = t => ['done','completed','cancelled'].includes(String(t.status || '').toLowerCase());
  const write = async (f, fm) => app.fileManager.processFrontMatter(f, current => Object.assign(current, fm));
  for (const f of files.filter(x => x.path.startsWith('1.PROJECTS/'))) {
    const fm = await read(f);
    if (!['project','milestone','phase'].includes(fm.type)) continue;
    const descendants = files.filter(x => x.path.startsWith('1.PROJECTS/') && ['milestone','phase'].includes((app.metadataCache.getFileCache(x)?.frontmatter || {}).type));
    const childMilestones = descendants.filter(x => { const child=app.metadataCache.getFileCache(x)?.frontmatter||{}; return child.type==='milestone' && relatesTo(child.project, x, new Set([f.path])); });
    const milestonePaths = new Set(childMilestones.map(x=>x.path));
    const childPhases = descendants.filter(x => { const child=app.metadataCache.getFileCache(x)?.frontmatter||{}; return child.type==='phase' && (relatesTo(child.project, x, new Set([f.path])) || relatesTo(child.milestone, x, milestonePaths)); });
    const phasePaths = new Set(childPhases.map(x=>x.path));
    const milestoneTargets = new Set([f.path, ...milestonePaths]);
    const phaseTargets = new Set([f.path, ...phasePaths]);
    const children = tasks.filter(t => relatesTo(t.fm.project, t.f, new Set([f.path])) || relatesTo(t.fm.milestone, t.f, milestoneTargets) || relatesTo(t.fm.phase, t.f, phaseTargets));
    if (fm.type === 'phase' || fm.type === 'milestone' || fm.type === 'project') {
      const done = children.filter(t => isDone(t.fm)).length;
      const progress = children.length ? Math.round(100 * done / children.length) : 0;
      const active = children.filter(t => String(t.fm.status).toLowerCase() === 'in-progress');
      const blocked = children.filter(t => String(t.fm.status).toLowerCase() === 'blocked' || t.fm.blocker);
      const open = children.filter(t => !isDone(t.fm) && !t.fm.blocker).sort((a,b) => String(a.fm.due||'9999').localeCompare(String(b.fm.due||'9999')));
      await write(f, {progress, health: children.length === 0 || unresolvedRelations ? 'unknown' : (blocked.length ? 'at-risk' : (active.length || open.length ? 'on-track' : 'complete')), next_action: open[0]?.f.basename || '', counts: {tasks: children.length, completed: done, open: children.length - done}});
    }
  }
  return `Reconciled ${tasks.length} TaskNotes records against explicit relations. No relations inferred.`;
};
