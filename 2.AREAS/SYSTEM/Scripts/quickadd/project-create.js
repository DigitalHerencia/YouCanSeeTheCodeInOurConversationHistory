module.exports = async ({ app, quickAddApi, obsidian, variables }) => {
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

  for (const folder of [root, root + "/Milestones", root + "/Phases", root + "/RoadMaps", root + "/Kanban", root + "/Artifacts"]) {
    await app.vault.createFolder(folder);
  }

  const projectId = type + "-" + name.toUpperCase().replace(/[^A-Z0-9]+/g, "-").replace(/^-+|-+$/g, "");
  const today = window.moment().format("YYYY-MM-DD");

  await app.vault.create(
    root + "/" + name + ".md",
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
      ["P1.1", "Product Discovery & Business Definition", "Validate problem and define scope.", "Market/customer problem synthesis; ICP/persona definition; pricing/packaging hypotheses; risk/compliance identification; success criteria.", "PRD; initial roadmap; feature-gating assumptions; business constraints."],
      ["P1.2", "Platform & Operations Scaffolding", "Establish technical and operational foundations.", "Repo and CI/CD setup; auth and tenant scaffolding; DB schema baseline; design system alignment; operational tooling.", "Running dev environment; core system integrations; design primitives; operational readiness baseline."],
      ["P1.3", "Internal Alpha Validation", "Validate system integration end-to-end.", "Internal-only deployment; integration testing; security posture validation; UX flow validation; observability baseline.", "Internal alpha environment; known-risk register; Go/No-Go recommendation."]
    ]],
    ["M2", "MVP Build & Launch", [
      ["P2.1", "Core Feature Implementation", "Build MVP feature set.", "Core workflows; RBAC/billing; MVP UI; feature flagging; critical-path tests.", "Feature-complete MVP; deployment-ready builds; release notes."],
      ["P2.2", "QA & Launch Readiness", "Reduce launch risk.", "Regression; performance/load; billing edge cases; accessibility; incident readiness.", "Launch approval; rollback plan; monitoring dashboards."],
      ["P2.3", "Soft Launch & Feedback Loop", "Validate real-world usage.", "Controlled public release; onboarding; CRM feedback; usage analytics; rapid iteration.", "Feedback reports; conversion metrics; MVP validation assessment."]
    ]],
    ["M3", "Expansion & Hardening", [
      ["P3.1", "Feature Expansion", "Deliver high-value enhancements.", "Advanced features; enterprise readiness; config/admin tooling; export/reporting.", "Expanded feature set; updated docs; upsell-ready capabilities."],
      ["P3.2", "Platform Hardening & Security", "Improve reliability and security.", "Performance optimization; security patching; permission audits; observability; cost optimization.", "Hardened platform; security/performance reports; reduced operational risk."],
      ["P3.3", "Growth Enablement", "Support scale and repeatability.", "Marketing automation; sales enablement; customer lifecycle optimization; retention/expansion.", "Growth campaigns; refined positioning; scalable operating model."]
    ]]
  ];

  for (const milestone of milestones) {
    for (const phase of milestone[2]) {
      const roadmapCode = (await quickAddApi.inputPrompt("RoadMap code for " + milestone[0] + " / " + phase[0]))?.trim();
      if (!roadmapCode) return;
      phase.push(roadmapCode);
    }
  }

  for (const [mid, mtitle, phases] of milestones) {
    const milestonePath = root + "/Milestones/" + mid + " — " + mtitle + ".md";
    await app.vault.create(milestonePath,
      "---\ntype: milestone\nid: " + mid + "\nproject: " + name + "\nnumber: " + mid + "\ntitle: " + mtitle + "\nstatus: backlog\ntags:\n  - type/milestone\n---\n\n# " + mid + " — " + mtitle + "\n\n## Objective\n\n## Phases\n"
    );

    const board = ["---", "kanban-plugin: board", "archive: false", "tags:", "  - type/kanban", "---", "", "# " + mid + " — " + mtitle, "", "## Backlog"];

    for (const [pid, ptitle, purpose, activities, outputs, roadmapCode] of phases) {
      const phasePath = root + "/Phases/" + pid + " — " + ptitle + ".md";
      await app.vault.create(phasePath,
        "---\ntype: phase\nid: " + pid + "\nproject: " + name + "\nmilestone: " + mid + "\nroadmap_code: " + roadmapCode + "\ntitle: " + ptitle + "\nstatus: backlog\ntags:\n  - type/phase\n---\n\n# " + pid + " — " + ptitle + "\n\n## Purpose\n" + purpose + "\n\n## Key Activities\n" + activities + "\n\n## Primary Outputs\n" + outputs + "\n\n## RoadMap\n\n## Tasks\n"
      );

      const rid = projectId + "-" + mid + "-" + pid + "-" + roadmapCode;
      const roadmapPath = root + "/RoadMaps/" + rid + " — " + ptitle + ".md";
      await app.vault.create(roadmapPath,
        "---\ntype: roadmap\nroadmap_id: " + rid + "\nproject_id: " + projectId + "\nproject: " + name + "\nmilestone: " + mid + "\nphase: " + pid + "\nroadmap_code: " + roadmapCode + "\ntitle: " + ptitle + "\nstatus: ready\ntags:\n  - type/roadmap\n---\n\n# " + rid + " — " + ptitle + "\n\n## Purpose\n" + purpose + "\n\n## Key Activities\n" + activities + "\n\n## Primary Outputs\n" + outputs + "\n\n## Tasks\n\n## Inputs\n\n## Dependencies\n\n## Downstream Consumers\n"
      );
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
