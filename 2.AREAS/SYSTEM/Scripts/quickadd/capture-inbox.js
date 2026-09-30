module.exports = async ({ app, quickAddApi, obsidian }) => {
  const title=(await quickAddApi.inputPrompt("Resource capture title"))?.trim(); if(!title)return;
  const folder="2.AREAS/ZETTLECASTEN/Inbox"; if(!app.vault.getAbstractFileByPath(folder))await app.vault.createFolder(folder);
  const path=folder+"/"+title.replace(/[^A-Za-z0-9._-]+/g,"-")+".md";
  const body="---\ntype: resource-capture\nstatus: inbox\ntitle: "+title+"\ncreated: "+window.moment().format("YYYY-MM-DD")+"\nupdated: "+window.moment().format("YYYY-MM-DD")+"\ntags:\n  - type/inbox\n---\n\n# "+title+"\n\n## Capture\n\n## Processing\n";
  const f=await app.vault.create(path,body);await app.workspace.getLeaf(false).openFile(f);new obsidian.Notice("Captured to Inbox.");
};
