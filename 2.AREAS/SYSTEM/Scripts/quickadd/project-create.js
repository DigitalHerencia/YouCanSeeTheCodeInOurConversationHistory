module.exports = async ({ app, quickAddApi, obsidian }) => {
  const name = (await quickAddApi.inputPrompt("Project name"))?.trim();
  if (!name) return;

  const preset = variables?.preset ? JSON.parse(variables.preset) : {};
  const type = preset.projectType || await quickAddApi.suggester(
    ["Operations", "Product", "Design", "Engineering", "Marketing"],
    ["OPS", "PROD", "DES", "ENG", "MKT"],
    "Project type"
  );
  if (!type) return;

  const root = "1.PROJECTS/" + name;
  if (app.vault.getAbstractFileByPath(root)) throw new Error("Project already exists: " + root);

  for (const folder of [
    root,
    root + "/Milestones",
    root + "/Phases",
    root + "/RoadMaps",
    root + "/Kanban",
    root + "/Artifacts"
  ]) await app.vault.createFolder(folder);

  const projectId = type + "-" + name.toUpperCase().replace(/[^A-Z0-9]+/g, "-").replace(/^-+|-+$/g, "");
  const today = window.moment().format("YYYY-MM-DD");

  await app.vault.create(root + "/" + name + ".md",
    "---\n" +
    "type: project\nproject_id: " + projectId + "\nproject: " + name + "\nproject_type: " + type + "\n" +
    "status: backlog\npriority: normal\ncreated: " + today + "\nupdated: " + today + "\n" +
    "tags:\n  - type/project\n---\n\n# " + name + "\n\n## Purpose and approved outcome\n\n## Execution\n\n### Milestones\n\n### Phase Boards\n\n### RoadMaps\n\n### Tasks\n\n" +
    "## Resources\n- [[Resources]]\n\n## Codebase\n- [[Codebase]]\n\n## Posts\n- [[Posts]]\n\n## Artifacts\n- [[Artifacts]]\n"
  );

  await app.vault.create(root + "/Resources.md", "# Resources — " + name + "\n");
  await app.vault.create(root + "/Codebase.md", "# Codebase — " + name + "\n");
  await app.vault.create(root + "/Posts.md", "# Posts — " + name + "\n");

  const templater = app.plugins.plugins["templater-obsidian"]?.templater;
  if (!templater) throw new Error("Templater is required.");

  const createFromTemplate = async (templatePath, folder, filename) => {
    const template = app.vault.getAbstractFileByPath(templatePath);
    if (!(template instanceof obsidian.TFile)) throw new Error("Missing template: " + templatePath);
    return templater.create_new_note_from_template(template, folder, filename, false);
  };

  const milestones = [
    ["M1", "Foundation & Architecture", [
      ["P1.1", "Product Discovery & Business Definition", "Validate problem and define scope."],
      ["P1.2", "Platform & Operations Scaffolding", "Establish technical and operational foundations."],
      ["P1.3", "Internal Alpha Validation", "Validate system integration end-to-end."]
    ]],
    ["M2", "MVP Build & Launch", [
      ["P2.1", "Core Feature Implementation", "Build MVP feature set."],
      ["P2.2", "QA & Launch Readiness", "Reduce launch risk."],
      ["P2.3", "Soft Launch & Feedback Loop", "Validate real-world usage."]
    ]],
    ["M3", "Expansion & Hardening", [
      ["P3.1", "Feature Expansion", "Deliver high-value enhancements."],
      ["P3.2", "Platform Hardening & Security", "Improve reliability and security."],
      ["P3.3", "Growth Enablement", "Support scale and repeatability."]
    ]]
  ];

  for (const [mid, mtitle, phases] of milestones) {
    const mf = await createFromTemplate("2.AREAS/SYSTEM/Templates/Milestone.template.md", root + "/Milestones", mid + " — " + mtitle);
    await app.fileManager.processFrontMatter(mf, fm => { fm.id = mid; fm.number = mid; fm.title = mtitle; fm.project = name; });

    const board = ["---", "kanban-plugin: board", "archive: false", "tags:", "  - type/kanban", "---", "", "# " + mid + " — " + mtitle, "", "## Backlog"];
    for (const [pid, ptitle, purpose] of phases) {
      const pf = await createFromTemplate("2.AREAS/SYSTEM/Templates/Phase.template.md", root + "/Phases", pid + " — " + ptitle);
      await app.fileManager.processFrontMatter(pf, fm => { fm.id = pid; fm.number = pid; fm.title = ptitle; fm.project = name; fm.milestone = mid; });
      let pc = await app.vault.read(pf);
      pc = pc.replace("## Goal\nWhat bounded outcome should this phase produce?", "## Purpose\n" + purpose + "\n\n## RoadMap\n");
      await app.vault.modify(pf, pc);

      const rid = projectId + "-" + mid + "-" + pid;
      const rf = await createFromTemplate("2.AREAS/SYSTEM/Templates/RoadMap.template.md", root + "/RoadMaps", rid + " — " + ptitle);
      await app.fileManager.processFrontMatter(rf, fm => { fm.roadmap_id = rid; fm.project_id = projectId; fm.project = name; fm.milestone = mid; fm.phase = pid; fm.title = ptitle; });
      board.push("- [[" + pid + " — " + ptitle + "]]");
    }

    board.push("", "## Ready", "", "## In Progress", "", "## Review", "", "## Done", "", "## Cancelled", "");
    await app.vault.create(root + "/Kanban/" + mid + " — " + mtitle + ".md", board.join("\n"));
  }

  const prd = await createFromTemplate("2.AREAS/SYSTEM/Templates/PRD.template.md", root + "/Artifacts", "PRD — " + name);
  await app.fileManager.processFrontMatter(prd, fm => { fm.project = name; fm.project_id = projectId; });
  const trd = await createFromTemplate("2.AREAS/SYSTEM/Templates/Technical Requirements.template.md", root + "/Artifacts", "Technical Requirements — " + name);
  await app.fileManager.processFrontMatter(trd, fm => { fm.project = name; fm.project_id = projectId; });

  await app.workspace.getLeaf(false).openFile(app.vault.getAbstractFileByPath(root + "/" + name + ".md"));
  new obsidian.Notice("Project created: " + name);
};
