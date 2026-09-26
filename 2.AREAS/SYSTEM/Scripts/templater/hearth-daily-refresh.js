module.exports = async (tp) => {
  const { app } = tp;
  const f = app.workspace.getActiveFile();
  if (!f || !f.path.startsWith('2.AREAS/DAILY/')) throw new Error('Open a Daily note to refresh it.');
  const files = app.vault.getMarkdownFiles();
  const taskFiles = files.filter(x => x.path.startsWith('2.AREAS/SYSTEM/_Tasks/'));
  const records = taskFiles.map(x => ({f:x, fm:app.metadataCache.getFileCache(x)?.frontmatter||{}}));
  const iso = new Date().toISOString().slice(0,10), yesterday = new Date(Date.now()-86400000).toISOString().slice(0,10);
  const section = (name, body) => `## ${name}\n<!-- hearth:${name.toLowerCase().replace(/[^a-z]+/g,'-')}:start -->\n${body}\n<!-- hearth:${name.toLowerCase().replace(/[^a-z]+/g,'-')}:end -->`;
  const esc = s => String(s||'').replace(/[\r\n]/g,' ').trim();
  const links = xs => xs.map(x=>`- [[${x.f.basename}]]`).join('\n') || '- None';
  const today = records.filter(x=>x.fm.status!=='done' && (x.fm.due===iso || x.fm.scheduled===iso || x.fm.status==='in-progress')).sort((a,b)=>String(a.fm.priority||'normal').localeCompare(String(b.fm.priority||'normal'))).slice(0,5);
  const done = records.filter(x=>x.fm.status==='done' && x.fm.completed_at===yesterday);
  const blocked = records.filter(x=>x.fm.status==='blocked' || x.fm.blocker);
  const unresolvedRelations = records.filter(x=>x.fm.migration_relation_state && x.fm.migration_relation_state!=='verified-ticketing-source' && x.fm.migration_relation_state!=='resolved');
  const deadlines=records.filter(x=>x.fm.due && x.fm.status!=='done' && x.fm.due>=iso && x.fm.due<=new Date(Date.now()+7*86400000).toISOString().slice(0,10));
  const inbox=files.filter(x=>x.path.startsWith('2.AREAS/ZETTLECASTEN/Inbox/') && x.basename!=='Inbox');
  const processing=files.filter(x=>x.path.startsWith('2.AREAS/ZETTLECASTEN/Processing/'));
  let text=await app.vault.read(f);
  const replacements={
    'Yesterday':links(done), 'Today':`${links(today)}\n\nFull queue: [[2.AREAS/SYSTEM/Bases/Task Queue]]`,
    'Blockers':links(blocked)+(unresolvedRelations.length?`\n\nMigration relation repairs (${unresolvedRelations.length}):\n${links(unresolvedRelations)}\n[[2.AREAS/SYSTEM/Reports/Migration Repair Queue]]`:''), 'Deadlines and reviews':links(deadlines),
    'Cadence':`Canonical meeting definitions: [[2.AREAS/DAILY/Cadence]]. Generate a session on demand.`,
    'Work context':`Active tasks: ${records.filter(x=>x.fm.status==='in-progress').length}; open queue: [[2.AREAS/SYSTEM/Bases/Task Queue]].`,
    'Zettelkasten and resources':`Inbox notes: ${inbox.length} · Processing notes: ${processing.length}.\n\nCapture: [[2.AREAS/ZETTLECASTEN/Inbox/Inbox]] · Library: [[3.RESOURCES/Library/Library]].`,
    'Code Lab':'Curriculum: [[2.AREAS/SYSTEM/Code Lab/Code Lab]] · Code Space: [[2.AREAS/SYSTEM/Code Space/Code Space]].',
    'Git and vault health':'Vault Git status and history: [[Hearth/Git and Vault]]. Code Space repository: [[2.AREAS/SYSTEM/Code Space/Code Space]].'
  };
  for (const [name,body] of Object.entries(replacements)) {
    const re=new RegExp(`(## ${name}\\s*\\n)<!-- hearth:generated:start -->[\\s\\S]*?<!-- hearth:generated:end -->`);
    if(re.test(text)) text=text.replace(re, `$1<!-- hearth:generated:start -->\n${body}\n<!-- hearth:generated:end -->`);
    else { const old=new RegExp(`(## ${name}\\s*\\n)<!-- hearth:${name.toLowerCase().replace(/[^a-z]+/g,'-')}:start -->[\\s\\S]*?<!-- hearth:${name.toLowerCase().replace(/[^a-z]+/g,'-')}:end -->`); if(old.test(text)) text=text.replace(old,section(name,body)); }
  }
  await app.vault.modify(f,text);
  return `Refreshed generated Daily state for ${iso}; human notes preserved.`;
};
