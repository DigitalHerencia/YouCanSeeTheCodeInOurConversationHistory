module.exports = async ({ app, quickAddApi, obsidian }) => {
  const title=(await quickAddApi.inputPrompt("Evidence title"))?.trim(); if(!title)return;
  const folder="2.AREAS/CODE/Evidence"; if(!app.vault.getAbstractFileByPath(folder))await app.vault.createFolder(folder);
  const path=folder+"/"+title.replace(/[^A-Za-z0-9._-]+/g,"-")+".md";
  const body="---\ntype: evidence\ntitle: "+title+"\nstatus: recorded\ncreated: "+window.moment().format("YYYY-MM-DD")+"\nupdated: "+window.moment().format("YYYY-MM-DD")+"\ntags:\n  - type/evidence\n---\n\n# "+title+"\n\n## Claim\n\n## Artifact\n\n## Verification\n\n## Related Task\n\n## Related Pattern\n";
  const f=await app.vault.create(path,body); await app.workspace.getLeaf(false).openFile(f); new obsidian.Notice("Evidence created.");
};
