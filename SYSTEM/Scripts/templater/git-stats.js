module.exports = async () => {
  try {
    const { exec } = require("child_process");
    const run = (command) => new Promise((resolve, reject) => exec(command, { cwd: app.vault.adapter.basePath }, (error, stdout, stderr) => error ? reject(error) : resolve(stdout.trim())));
    const [branch, status, today, week, month, latest] = await Promise.all([
      run("git branch --show-current"),
      run("git status --short"),
      run("git rev-list --count --since=midnight HEAD"),
      run("git rev-list --count --since='7 days ago' HEAD"),
      run("git rev-list --count --since='30 days ago' HEAD"),
      run("git log -1 --pretty=format:'%h %ad %s' --date=short")
    ]);
    const changed = status ? status.split(/\r?\n/).length : 0;
    return [
      `- Branch: ${branch || "detached"}`,
      `- Changed files: ${changed}`,
      `- Commits today: ${today}`,
      `- Commits / 7 days: ${week}`,
      `- Commits / 30 days: ${month}`,
      `- Latest: ${latest}`
    ].join("\n");
  } catch (error) {
    return `> [!caution] Git stats unavailable\n> ${String(error.message || error)}`;
  }
};
