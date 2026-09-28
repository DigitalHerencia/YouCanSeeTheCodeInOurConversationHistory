const { PATHS } = require('./core/config');
const { slug } = require('./core/ids');
const { linkPath } = require('./core/links');
const { run } = require('./core/reconcile');
module.exports = async tp => {
  const app=tp.app, active=app.workspace.getActiveFile();
  if(!active || !active.path.startsWith(`${PATHS.projects}/`)) throw new Error('Create or open Project.md inside a 1.PROJECTS project folder.');
  const folder=active.parent, all=app.vault.getMarkdownFiles(), fm=app.metadataCache.getFileCache(active)?.frontmatter||{};
  const code=fm.project_code||folder.name.split(' ')[0];
  const codeMatch=code.match(/^([A-Z]+)-M(\d+)-P([0-9.]+)-([A-Z0-9&]+)$/);
  if(!codeMatch) throw new Error(`Project work code must come from the source manifest or an approved project workflow: ${code}`);
  const domain=codeMatch[1], milestoneNumber=`M${codeMatch[2]}`, phaseNumber=`P${codeMatch[3]}`;
  const id=`${domain}-M${codeMatch[2]}-${String(all.filter(f=>{const x=app.metadataCache.getFileCache(f)?.frontmatter||{};return x.type==='project'&&x.project_type===domain;}).length+1).padStart(3,'0')}`;
  const projectValues={id,project_code:code,type:'project',project_type:domain,status:fm.status||'backlog',priority:fm.priority||'normal',codelab_enabled:fm.codelab_enabled??false,created:fm.created||new Date().toISOString().slice(0,10),updated:new Date().toISOString().slice(0,10),schema_version:1,tags:['type/project']};
  await app.fileManager.processFrontMatter(active,current=>Object.assign(current,projectValues));
  const pathFor=name=>`${folder.path}/${name}`;
  const write=async(name,content)=>{const path=pathFor(name),existing=app.vault.getAbstractFileByPath(path);if(existing)return existing;return app.vault.create(path,content);};
  const projectLink=linkPath(active.path), milestonePath=pathFor(`Milestone ${milestoneNumber}.md`), phasePath=pathFor(`Phase ${phaseNumber}.md`);
  const milestoneLink=linkPath(milestonePath),phaseLink=linkPath(phasePath);
  const date=new Date().toISOString().slice(0,10);
  await write(`Milestone ${milestoneNumber}.md`,`---\ntype: milestone\nid: ${id}-${milestoneNumber}\nproject: "${projectLink}"\nnumber: ${milestoneNumber}\nstatus: backlog\nobjective: ""\nstart: null\nend: null\nrisk: unknown\nprogress: 0\ncreated: ${date}\nupdated: ${date}\ntags: [type/milestone]\n---\n# ${milestoneNumber} — Project milestone\n\n## Human controls\nStatus: \`INPUT[select(option(backlog), option(ready), option(in-progress), option(review), option(done), option(cancelled)):status]\` · Objective: \`INPUT[text:objective]\` · Start: \`INPUT[date:start]\` · End: \`INPUT[date:end]\` · Risk: \`INPUT[select(option(unknown), option(low), option(medium), option(high)):risk]\`\n\n## Outcome and acceptance\nState only the approved outcome. Link its source document or requirement.\n\n## Phases\n${phaseLink}\n\n## Gate\nExit when phase work has evidence and the milestone review is recorded.\n`);
  await write(`Phase ${phaseNumber}.md`,`---\ntype: phase\nid: ${id}-${phaseNumber}\nproject: "${projectLink}"\nmilestone: "${milestoneLink}"\nnumber: ${phaseNumber}\nstatus: backlog\nsprint: ""\nrisk: unknown\nprogress: 0\ncreated: ${date}\nupdated: ${date}\ntags: [type/phase]\n---\n# ${phaseNumber} — Execution phase\n\n## Goal\nUse the linked approved project requirements to define this bounded phase outcome.\n\n## Human controls\nStatus: \`INPUT[select(option(backlog), option(ready), option(in-progress), option(review), option(done), option(blocked), option(cancelled)):status]\` · Sprint: \`INPUT[text:sprint]\` · Risk: \`INPUT[select(option(unknown), option(low), option(medium), option(high)):risk]\` · Target: \`INPUT[date:target_end]\`\n\n## Task execution\n\`\`\`base\nfilters:\n  and:\n    - file.inFolder("${PATHS.taskFolder}")\n    - phase.contains("${phaseLink}")\n\`\`\`\n\n## Exit review\nRecord validation and evidence before advancing to the next phase.\n`);
  const docs={
    'Project Charter.md':`# ${folder.name} — Project Charter\n\n## Approved outcome\nDescribe the owner-approved outcome and cite the source that authorizes it. Do not infer business requirements.\n\n## Acceptance\n- [ ] Outcome has a measurable acceptance condition.\n- [ ] Constraints, assumptions, and decision owner are linked to their source.\n\n## Scope and context\nCapture verified inputs, exclusions, dependencies, outputs, and downstream consumers.\n`,
    'Roadmap.md':`# ${folder.name} — Roadmap\n\nThis view follows the project’s ordered milestones and phases. Keep requirements in source documents and execution in TaskNotes.\n\n- ${milestoneLink}\n  - ${phaseLink}\n`,
    'Project Index.md':`# ${folder.name} — Project Index\n\n- Project: ${projectLink}\n- Charter: [[Project Charter]]\n- Roadmap: [[Roadmap]]\n- Board: [[Board]]\n- Milestone: ${milestoneLink}\n- Phase: ${phaseLink}\n\n## Deliverables\nUse project Bases to find current documents, requirements, resources, and evidence.\n`,
    'Board.md':`---\ntype: kanban\nproject: "${projectLink}"\ncreated: ${date}\nupdated: ${date}\ntags: [type/kanban]\n---\n# ${folder.name} — Milestone Board\n\nMove milestone links between columns to plan. Run **Hearth: Reconcile Project Board** to write a moved milestone’s user-owned status; the board itself never stores task execution.\n\n## Backlog\n- ${milestoneLink}\n\n## Ready\n\n## In Progress\n\n## Review\n\n## Done\n\n## Cancelled\n\n## Card semantics\nEach milestone card links its phases and shows progress from TaskNotes. Phases and tasks remain in their own authoritative notes.\n`
  };
  for(const [name,body] of Object.entries(docs)) await write(name,`---\ntype: ${name==='Project Charter.md'?'project-charter':name==='Roadmap.md'?'roadmap':name==='Project Index.md'?'project-index':'document'}\nproject: "${projectLink}"\ncreated: ${date}\nupdated: ${date}\ntags: [type/document]\n---\n${body}`);
  await run(app);
  return `Project pack reconciled for ${folder.name} (${id}; work code ${code}).`;
};
