---
name: wt
description: Use when the user wants to create, remove, list, or switch git worktrees paired with tmux sessions via the `wt` helper at ~/bin/wt. Triggers on "new worktree", "spin up a worktree", "checkout branch in a worktree", "jump to worktree", "tear down worktree", or any mention of `wt new|rm|ls|open|switch`.
---

# wt — git worktree + tmux session manager

`wt` is a bash script at `~/bin/wt` that pairs each git worktree with a dedicated tmux session. One command creates both; another tears both down. Worktrees live next to the main repo as siblings named `<repo>.<branch>`.

## Layout

For a repo at `~/code/myrepo`, `wt new feature-x` produces:

- worktree dir: `~/code/myrepo.feature-x`
- tmux session: `myrepo_feature-x` (`/` and `.` in branch names become `-`)

## Commands

| Command | Purpose |
|---|---|
| `wt new <branch> [base-ref]` | Create worktree + branch from base (default `origin/master`), start tmux session, attach/switch. |
| `wt rm <branch>` | Kill session, remove worktree, delete local branch. Switches away first if you're attached to the target. |
| `wt ls` | List worktrees and tmux sessions. |
| `wt s` / `wt switch` | fzf-pick an existing tmux session and attach/switch. |
| `wt open [query]` / `wt o` | fzf-pick a worktree (or match by branch/path substring), attach/switch its session, creating it if missing. |

Inside tmux it uses `switch-client`; outside it uses `attach`.

## Common workflows

### Start work on a new feature branch
```bash
wt new feature-x                 # branches from origin/master
wt new feature-x origin/develop  # branches from a different base
```

### Check out an existing remote branch
`cmd_new` always passes `-b` to `git worktree add`, so it creates a fresh local branch. To base that local branch on a remote tip, pass the remote as the base ref:

```bash
wt new feature-x origin/feature-x
```

This fetches `feature-x` from origin (line 28 of the script) and creates a local `feature-x` starting at that commit. If a local `feature-x` already exists, `-b` will fail — pick a different local name or check out manually.

### Jump between existing worktrees
```bash
wt open              # fzf picker
wt open feature-x    # match by branch name, no picker
wt s                 # fzf picker over tmux sessions only
```

### Tear down
```bash
wt rm feature-x
```
Force-removes the worktree, deletes the branch, kills the session. Uncommitted work is lost — confirm before running if unsure.

## Post-create hook

If `<main-repo>/.wt-hooks/post-create` exists and is executable, `cmd_new` runs it inside the new worktree after creation (e.g. for `npm install`, copying `.env`, etc.). Nothing else in the script touches hooks.

## Gotchas

- **Default base is `origin/master`.** On repos where the default branch is `main` or `develop`, pass the base explicitly: `wt new foo origin/main`.
- **`fetch` failures are swallowed** (`|| true` on line 28) — if you're offline, worktree creation still proceeds using whatever ref is cached locally.
- **`rm` is force-remove.** `git worktree remove --force` plus `branch -D` — no safety net for dirty trees or unmerged branches.
- **Branch-name sanitization is display-only.** `feature/x` becomes session `<repo>_feature-x`, but the git branch stays `feature/x` and the worktree dir is `<repo>.feature/x` (which creates a `feature/` subdirectory as a sibling of the repo). If that's undesirable, use flat branch names.
- **Script assumes you're inside the repo** when invoked — `main_repo` uses `git rev-parse`, so `cd` into any worktree of the repo first.

## When to extend vs. work around

The script is ~100 lines and intentionally terse. Small tweaks (different default base, a `--track` path for existing remote branches, a dry-run mode) belong in the script itself. Ask the user before editing — they may prefer the current behavior.
