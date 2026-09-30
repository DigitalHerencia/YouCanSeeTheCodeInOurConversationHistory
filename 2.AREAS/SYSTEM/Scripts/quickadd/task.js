module.exports = async ({ app, quickAddApi, obsidian }) => {
  const project = await quickAddApi.inputPrompt("Project");
  const milestone = await quickAddApi.inputPrompt("Milestone");
  const phase = await quickAddApi.inputPrompt("Phase");
  const roadmap = await quickAddApi.inputPrompt("RoadMap");
  const title = await quickAddApi.inputPrompt("Task title");
  if (![project, milestone, phase, roadmap, title].every(Boolean)) return;

  const projectId = String(project).toUpperCase().replace(/[^A-Z0-9]+/g, "-").replace(/^-+|-+$/g, "");
  const existing = app.vault.getMarkdownFiles().filter(f => f.path.startsWith("2.AREAS/SYSTEM/_Tasks/")).length;
  const taskId = projectId + "-" + milestone + "-" + phase + "-" + roadmap + "-T" + String(existing + 1).padStart(2, "0");
  const folder = "2.AREAS/SYSTEM/_Tasks";
  if (!app.vault.getAbstractFileByPath(folder)) await app.vault.createFolder(folder);

  const body = "---\ntype: task\ntask_id: " + taskId + "\nproject_id: " + projectId + "\nproject: " + project +
    "\nmilestone: " + milestone + "\nphase: " + phase + "\nroadmap: " + roadmap +
    "\nstatus: ready\ndependency:\ndeliverable:\ncreated: " + window.moment().format("YYYY-MM-DD") +
    "\nupdated: " + window.moment().format("YYYY-MM-DD") + "\ntags:\n  - type/task\n---\n\n# " + title +
    "\n\n## Human controls\nStatus: \`INPUT[select(option(backlog), option(ready), option(in-progress), option(blocked), option(review), option(done), option(cancelled)):status]\`\n\n## Acceptance Criteria\n- [ ]\n\n## Project Context\n- Project: " + project +
    "\n- Milestone: " + milestone + "\n- Phase: " + phase + "\n- RoadMap: " + roadmap + "\n\n## Expected Output\n\n## Evidence Plan\n";
  const file = await app.vault.create(folder + "/" + taskId + " — " + title + ".md", body);
  await app.workspace.getLeaf(false).openFile(file);
  new obsidian.Notice("Task created: " + taskId);
};
