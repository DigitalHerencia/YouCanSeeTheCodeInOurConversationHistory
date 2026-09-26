module.exports = async (tp) => {
  const { app } = tp;
  const file = app.workspace.getActiveFile();
  if (!file || !file.path.startsWith('1.PROJECTS/')) throw new Error('Create Project.md under 1.PROJECTS first.');
  const folder = file.parent;
  const title = folder.name;
  const code = 'HEARTH-' + title.normalize('NFKD').replace(/[^A-Za-z0-9]+/g, '-').replace(/^-|-$/g, '').toUpperCase();
  await app.fileManager.processFrontMatter(file, fm => {
    if (!fm.id) fm.id = code;
    if (!fm.project_code) fm.project_code = code;
    if (!fm.type) fm.type = 'project';
    if (!fm.status) fm.status = 'backlog';
    if (fm.progress == null) fm.progress = 0;
    if (fm.health == null) fm.health = 'unknown';
    if (!fm.created) fm.created = tp.date.now('YYYY-MM-DD');
    fm.updated = tp.date.now('YYYY-MM-DD');
  });
  const notes = {
    'Project Charter.md': '# ' + title + ' — Charter\n\n## Objective\nRecord the owner-approved outcome. Do not infer business requirements.\n\n## Acceptance criteria\n- [ ] Outcome is explicit and reviewable.\n\n## Context\nAdd verified inputs, constraints, outputs, and downstream consumers.\n',
    'Roadmap.md': '# ' + title + ' — Roadmap\n\n- [[Milestone M1]]\n  - [[Phase P1.1]]\n',
    'Project Index.md': '# ' + title + '\n\n- [[Project]] · [[Board]] · [[Milestone M1]] · [[Phase P1.1]]\n',
    'Board.md': '---\ntype: board\nproject: "[[Project]]"\n---\n# ' + title + ' — Milestone Kanban\n\n## Backlog\n- [[Milestone M1]]\n\n## In Progress\n\n## Done\n',
    'Milestone M1.md': '---\ntype: milestone\nid: ' + code + '-M1\nproject: "[[Project]]"\nstatus: backlog\nobjective: ""\nstart: ""\nend: ""\nrisk: unknown\nprogress: 0\n---\n# M1 — Foundation & Pre-Production\n\n## Owner controls\nStatus: `INPUT[select(option(backlog), option(active), option(done), option(archived)):status]`\nObjective: `INPUT[text:objective]` · Risk: `INPUT[select(option(low), option(medium), option(high)):risk]`\n\n## Acceptance criteria\n- [ ] Owner records objective and acceptance.\n\n## Phases\n- [[Phase P1.1]]\n',
    'Phase P1.1.md': '---\ntype: phase\nid: ' + code + '-P1.1\nproject: "[[Project]]"\nmilestone: "[[Milestone M1]]"\nstatus: backlog\nsprint: ""\nrisk: unknown\nprogress: 0\n---\n# P1.1 — Initialization & Scaffolding\n\n## Owner controls\nStatus: `INPUT[select(option(backlog), option(ready), option(in-progress), option(done), option(blocked)):status]` · Sprint: `INPUT[text:sprint]`\n\n## Generated task rollup\n<!-- hearth:generated:start -->\n<!-- hearth:generated:end -->\n'
  };
  for (const [name, content] of Object.entries(notes)) {
    const path = folder.path + '/' + name;
    if (!app.vault.getAbstractFileByPath(path)) await app.vault.create(path, content);
  }
  return 'Project pack ready: ' + title + ' (' + code + ').';
};
