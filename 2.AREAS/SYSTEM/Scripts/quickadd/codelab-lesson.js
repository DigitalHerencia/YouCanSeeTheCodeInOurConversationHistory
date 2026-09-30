module.exports = async ({ app, quickAddApi, obsidian }) => {
  const title=(await quickAddApi.inputPrompt("Lesson title"))?.trim(); if(!title)return;
  const folder="2.AREAS/CODE/Lessons"; if(!app.vault.getAbstractFileByPath(folder))await app.vault.createFolder(folder);
  const path=folder+"/"+title.replace(/[^A-Za-z0-9._-]+/g,"-")+".md";
  const body="---\ntype: lesson\ntitle: "+title+"\nstatus: not-started\ncreated: "+window.moment().format("YYYY-MM-DD")+"\nupdated: "+window.moment().format("YYYY-MM-DD")+"\ntags:\n  - type/lesson\n---\n\n# "+title+"\n\n## Objective\n\n## Doctrine\n\n## Example\n\n## Applied Drill\n\n## Test\n\n## Evidence\n";
  const f=await app.vault.create(path,body); await app.workspace.getLeaf(false).openFile(f); new obsidian.Notice("Lesson created.");
};
