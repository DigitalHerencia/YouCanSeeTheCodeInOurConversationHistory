module.exports = async ({ app, obsidian }) => {
  const files=app.vault.getMarkdownFiles(); const broken=[];
  for(const f of files){const links=app.metadataCache.getFileCache(f)?.links||[];for(const l of links){if(!app.metadataCache.getFirstLinkpathDest(l.link,f.path))broken.push(f.path+" -> "+l.link);}}
  new obsidian.Notice(broken.length ? broken.length+" unresolved links found." : "Hearth reconcile: no unresolved links found.");
};
