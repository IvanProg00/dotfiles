# Dotfiles configuration

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/). The repository covers shell configuration, tool configuration (`~/.config`, `~/.omp`, and others), Homebrew packages, and AI agent skills.

## Prerequisites

- macOS with [Homebrew](https://brew.sh/)
- `git`, with an SSH key registered on GitHub if you use the private repository
- `chezmoi`:

  ```sh
  brew install chezmoi
  ```

- Node.js, which provides `npx`, for installing agent skills

## 1. Install the repository

```sh
# public repository
chezmoi init --apply https://github.com/IvanProg00/dotfiles.git
# private repository
chezmoi init --apply git@github.com:IvanProg00/dotfiles.git
```

`chezmoi init --apply` clones the repository into `~/.local/share/chezmoi` and writes the managed files into your home directory.

To pull and apply later changes:

```sh
chezmoi update
```

## 2. Install Homebrew packages

`dot_Brewfile` is applied as `~/.Brewfile`, so the global Brewfile is installed with:

```sh
brew bundle --global
```

## 3. Configure the shell

fish is configured by chezmoi (`dot_config/private_fish/config.fish`), so only the fish binary and the login shell need setting up. fish is not part of `dot_Brewfile`, so install it first:

```sh
brew install fish
echo "$(which fish)" | sudo tee -a /etc/shells
chsh -s "$(which fish)"
```

`sudo echo "..." >> /etc/shells` does not work, because the redirection runs as your user, not as root. Piping through `sudo tee -a` is required.

## 4. Install agent skills

Agent skills are recorded in `dot_agents/dot_skill-lock.json`, which chezmoi applies to `~/.agents/.skill-lock.json`. The lock file is written by the [`skills`](https://github.com/vercel-labs/skills) CLI and records, for each installed skill, its source repository, path inside that repository, and content hash.

Skills are installed at the user level (`--global`). Each entry in the lock file maps to a single skill, so restoring a machine means re-adding every recorded skill from its source.

`npx skills experimental_install` restores only project-level `skills-lock.json` files, so it does not apply to this global lock file.

### Restore all recorded skills

Run from any directory:

```sh
jq -r '.skills | to_entries[] | "\(.value.sourceUrl | sub("\\.git$"; ""))\t\(.key)"' ~/.agents/.skill-lock.json |
while IFS=$'\t' read -r source skill; do
  npx skills add "$source" --global --skill "$skill" --yes
done
```

Notes:

- `jq` is required; install it with `brew install jq`. It is not in `dot_Brewfile`.
- The loop clones each source repository once per skill, so a full restore takes a few minutes.
- Skills from private sources (for example `hiyainc-labs/hiya-claude-plugins`) require GitHub access with the same account used for `git`.
- Skills are linked into the agent directories detected on the machine. Use `--agent <name>` to target specific agents, for example `--agent claude-code`.

### Install a single skill

```sh
npx skills add <owner>/<repo> --global --skill <skill-name>
```

To browse what a repository provides without installing anything:

```sh
npx skills add <owner>/<repo> --list
```

### Verify installed skills

```sh
npx skills list --global
```

### Update skills

```sh
npx skills update --global
```

After updating, `~/.agents/.skill-lock.json` changes. Copy the new lock file back into the repository and commit it:

```sh
chezmoi re-add ~/.agents/.skill-lock.json
git -C "$(chezmoi source-path)" diff
```

### Add a new skill

Install it as shown above. The CLI then updates `~/.agents/.skill-lock.json`, so run the `chezmoi re-add` step to keep the repository in sync.

## Troubleshooting

- `chezmoi diff` shows what `chezmoi apply` would change in your home directory before you apply it.
- If a skill fails to restore with an authentication error, check that `gh auth status` (or your SSH key) can reach the source repository.
