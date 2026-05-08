module.exports = async function promoteSelectionToNote(params) {
  const { app } = params;
  const editor = app.workspace.activeEditor?.editor;

  if (!editor) {
    new Notice("No active editor.");
    return;
  }

  const selection = editor.getSelection();

  if (!selection || !selection.trim()) {
    new Notice("No selected text.");
    return;
  }

  const pathMatch =
    selection.match(/Vault path:\s*`([^`]+)`/i) ||
    selection.match(/Vault path:\s*(.+)$/im);

  if (!pathMatch) {
    new Notice("No Vault path found in selection.");
    return;
  }

  const targetPath = pathMatch[1].trim().replace(/^["']|["']$/g, "");

  if (!targetPath.endsWith(".md")) {
    new Notice("Vault path must end with .md");
    return;
  }

  const frontmatterIndex = selection.indexOf("---");

  if (frontmatterIndex === -1) {
    new Notice("No YAML frontmatter delimiter found.");
    return;
  }

  const content = selection.slice(frontmatterIndex).trimStart();

  if (!content.startsWith("---")) {
    new Notice("Canonical note content must start with YAML frontmatter.");
    return;
  }

  const folderPath = targetPath.split("/").slice(0, -1).join("/");
  const fileName = targetPath.split("/").pop();
  const noteName = fileName.replace(/\.md$/i, "");

  if (folderPath && !(await app.vault.adapter.exists(folderPath))) {
    await app.vault.createFolder(folderPath);
  }

  if (await app.vault.adapter.exists(targetPath)) {
    new Notice(`Target already exists: ${targetPath}`);
    return;
  }

  await app.vault.create(targetPath, content + "\n");

  editor.replaceSelection(`Promoted to [[${noteName}]]`);

  new Notice(`Promoted to ${noteName}`);
};