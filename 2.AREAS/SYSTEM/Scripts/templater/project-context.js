const {PATHS}=require('./core/config');
const {wiki}=require('./core/paths');
const {run}=require('./core/reconcile');

module.exports=async context=>{
  const app=context.app||context,api=context.quickAddApi||app.plugins.plugins.quickadd?.api;
  if(!api)throw new Error('QuickAdd API unavailable.');
  const projects=app.vault.getMarkdownFiles().filter(file=>file.path.startsWith(`${PATHS.projects}/`)&&app.metadataCache.getFileCache(file)?.frontmatter?.type==='project');
  const selected=await api.suggester(projects.map(file=>file.basename),projects);
  if(!selected)return 'Selection cancelled.';
  await run(app);
  const fm=app.metadataCache.getFileCache(selected)?.frontmatter||{};
  const state=app.vault.getAbstractFileByPath(`${PATHS.state}/Project Context.md`);
  if(!state)throw new Error('Selected project state note is missing.');
  await app.fileManager.processFrontMatter(state,frontmatter=>{frontmatter.project=wiki(selected.path);frontmatter.active_project=wiki(selected.path);frontmatter.active_project_id=fm.id||'';frontmatter.active_milestone=fm.current_milestone||'';frontmatter.active_phase=fm.current_phase||'';frontmatter.updated=new Date().toISOString().slice(0,10)});
  const body=`Selected project: ${wiki(selected.path)}\n\n- Status: ${fm.status||'not set'} · Progress: ${fm.progress??0}% · Health: ${fm.health||'unreconciled'}\n- Milestone: ${fm.current_milestone||'none'} · Phase: ${fm.current_phase||'none'}\n- Next action: ${fm.next_action||'none'}\n- Project Board: ${wiki(`${selected.parent.path}/Board.md`)}`;
  const text=await app.vault.read(state),next=text.replace(/<!-- HEARTH:BEGIN PROJECT-CONTEXT -->[\s\S]*?<!-- HEARTH:END PROJECT-CONTEXT -->/,`<!-- HEARTH:BEGIN PROJECT-CONTEXT -->\n${body}\n<!-- HEARTH:END PROJECT-CONTEXT -->`);
  await app.vault.modify(state,next);
  const projectLink=wiki(selected.path);
  for(const name of ['Active Project Tasks','Active Project Calendar','Active Project Documents','Active Project Evidence','Active Project Resources','Active Project Notes']){
    const base=app.vault.getAbstractFileByPath(`${PATHS.bases}/${name}.base`);
    if(!base)continue;
    const text=await app.vault.read(base);
    const filter=`    - project == "${projectLink}"`;
    const updated=text.includes('project == "')?text.replace(/^    - project == .*$/m,filter):text.replace(/^(    - '(?:project != null|file\.hasLink\(this\.project\))'?)\s*$/m,filter);
    if(updated!==text)await app.vault.modify(base,updated);
  }
  return `Project context set to ${selected.basename}; linked project Bases refreshed.`;
};
