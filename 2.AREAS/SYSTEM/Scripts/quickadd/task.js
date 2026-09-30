module.exports = async ({ app, quickAddApi, obsidian }) => {
  const project = (await quickAddApi.inputPrompt("Project folder name"))?.trim();
  const milestone = (await quickAddApi.inputPrompt("Milestone ID (M1/M2/M3)"))?.trim();
  const phase = (await quickAddApi.inputPrompt("Phase ID (P1.1/P2.1/etc.)"))?.trim();
  const roadmap = (await quickAddApi.inputPrompt("RoadMap code"))?.trim();
  const title = (await quickAddApi.inputPrompt("Task title"))?.trim();
  if (![project, milestone, phase, roadmap, title].every(Boolean)) return;

  const projectFile = app.vault.getAbstractFileByPath("1.PROJECTS/" + project + "/" + project + ".md");
  if (!(projectFile instanceof obsidian.TFile)) throw new Error("Project note not found.");
  const cache = app.metadataCache.getFileCache(projectFile);
  const projectId = cache?.frontmatter?.project_id;
  if (!projectId) throw new Error("Project note is missing project_id.");

  const folder = "2.AREAS/SYSTEM/_Tasks";
  if (!app.vault.getAbstractFileByPath(folder)) await app.vault.createFolder(folder);

  const prefix = projectId + "-" + milestone + "-" + phase + "-" + roadmap;
  const existing = app.vault.getMarkdownFiles()
    .filter(f => f.path.startsWith(folder + "/") && f.basename.startsWith(prefix + "-T"));
  const taskId = prefix + "-T" + String(existing.length + 1).padStart(2, "0");

  const today = window.moment().format("YYYY-MM-DD");
  const body =
    "---\n" +
    "type: task\n" +
    "task_id: " + taskId + "\n" +
    "project_id: " + projectId + "\n" +
    "project: " + project + "\n" +
    "milestone: " + milestone + "\n" +
    "phase: " + phase + "\n" +
    "roadmap: " + roadmap + "\n" +
    "status: ready\n" +
    "priority: normal\n" +
    "dependency:\n" +
    "deliverable:\n" +
    "created: " + today + "\n" +
    "updated: " + today + "\n" +
    "tags:\n  - type/task\n" +
    "---\n\n" +
    "# " + title + "\n\n" +
    "## Controls\n" +
    "Status: \`INPUT[select(option(backlog), option(ready), option(in-progress), option(blocked), option(review), option(done), option(cancelled)):status]\`  \n" +
    "Priority: \`INPUT[select(option(low), option(normal), option(high)):priority]\`\n\n" +
    "## Acceptance Criteria\n- [ ]\n\n" +
    "## Project Context\n- Project: " + project + "\n- Milestone: " + milestone + "\n- Phase: " + phase + "\n- RoadMap: " + roadmap + "\n\n" +
    "## Expected Output\n\n## Evidence Plan\n";

  const file = await app.vault.create(folder + "/" + taskId + " — " + title + ".md", body);
  await app.workspace.getLeaf(false).openFile(file);
  new obsidian.Notice("Task created: " + taskId);
};
