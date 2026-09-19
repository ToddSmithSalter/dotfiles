# .dotfiles for macOS

## What is this?

This repository serves as a way to help setup and maintain my Mac. Consider this repository a fork of [Dries Vints](https://github.com/driesvints/dotfiles) dotfiles. For full instructions on a fresh macOS setup, follow the directions on Dries' repo.

## What's included

### Home dotfiles (`home/`)

Files here are symlinked directly into `$HOME` by `bin/install`.

- `.zshrc` - Zsh configuration, including PATH setup, and sources `.aliases` and `.functions`
- `.aliases` - Common shell aliases
- `.functions` - Custom shell functions
- `.gitconfig` - Git configuration
- `.global-gitignore` - Global gitignore rules

### macOS (`macos/`)

- `.mackup.cfg` - Mackup configuration, symlinked to `$HOME/.mackup.cfg` by `bin/install`
- `set-defaults.sh` - Configures macOS system defaults, run manually as the last setup step

### Shell configuration (repo root)

- `minimal.zsh-theme` - A minimal Zsh prompt theme

### Package management (`config/`)

- `Brewfile` - All Homebrew packages, casks, and Mac App Store apps installed via `brew bundle`

### Scripts

- `bin/install` - Full Mac setup script run on a new machine, symlinks everything in `home/` into `$HOME`
- `bin/install-claude-code` - Standalone script to install and configure Claude Code independently
- `bin/link-agent-skills` - Links each skill into `~/.codex/skills`, so Codex has the same skills as Claude Code
- `bin/install-agent-skill-sync` - Installs a launchd job that runs `bin/link-agent-skills` at login, on a change, and every 60 seconds
- `bin/update` - Updates dotfiles and installed packages
- `bin/db-dump` - Dumps Herd-managed MySQL and PostgreSQL databases before wiping a machine

### VS Code

- `vscode/` - VS Code settings and keybindings

### Claude Code (`config/claude/`)

Configuration, agents, and skills for [Claude Code](https://claude.ai/claude-code).

- `AGENTS.md` - Global instructions and coding standards, linked to `~/.claude/CLAUDE.md` for Claude Code and to `~/.codex/AGENTS.md` for Codex
- `settings.json` - Claude Code settings including permissions, MCP plugins, and status line configuration
- `statusline.sh` - Custom status line script displayed in the Claude Code terminal

**Shared with Codex** - One source, two tools:

- `AGENTS.md` carries the name that Codex expects. Claude Code reads `CLAUDE.md`, so it gets a symlink under that name.
- `bin/link-agent-skills` makes one symlink per skill in `~/.codex/skills`, so the skills that Codex already has stay in place. A folder without a `SKILL.md` is not a skill. `find-skills` and `codiff` are skipped, because Codex cannot act on them.
- `bin/install-agent-skill-sync` keeps those links current with a launchd job. `bin/install-claude-code` runs it.
- `config/claude/skills/synced/` holds skills that Claude Code syncs from the Anthropic skills directory. Git ignores that folder, because the app regenerates it.

**Agents** (`config/claude/agents/`) - Specialized sub-agents for focused tasks:

- `laravel-debugger` - Diagnoses and fixes Laravel application issues
- `laravel-feature-builder` - Implements new Laravel features end-to-end
- `laravel-simplifier` - Refactors and cleans up Laravel/PHP code

**Skills** (`config/claude/skills/`) - Reusable slash commands available in any session:

| Skill | Purpose |
|---|---|
| `code-review` | Review changes since a commit, against standards and against the spec |
| `codebase-design` | Vocabulary and method for designing deep modules |
| `create-gitlab-issue` | Write a structured GitLab issue with `glab` |
| `diagnosing-bugs` | Diagnosis loop for hard bugs and performance regressions |
| `docker-expert` | Docker containerization guidance |
| `domain-modeling` | Build a domain model, a CONTEXT.md, and ADRs |
| `find-skills` | Discover and install new skills |
| `fix-gitlab-issue` | Fix a GitLab issue and open an MR |
| `gitlab-ci-patterns` | GitLab CI/CD pipeline patterns |
| `gitlab-cli-skills` | GitLab CLI (`glab`) command reference |
| `grill-me` | A relentless interview to sharpen a plan or design |
| `grill-with-docs` | The same interview, which also writes ADRs and a glossary |
| `grilling` | Stress-test a plan, decision, or idea |
| `handoff` | Compact the conversation into a handoff document |
| `implement` | Implement work from a GitLab spec issue or a set of tickets |
| `improve-codebase-architecture` | Report deepening opportunities, then grill through them |
| `laravel-inertia-vuejs-structure` | Frontend structure conventions for Laravel Inertia and Vue |
| `laravel-specialist` | Laravel 10+ application building |
| `mailcoach` | Manage email marketing with the Mailcoach CLI |
| `modern-web-guidance` | Current best practice for HTML, CSS, and client-side JS |
| `pdf` | Read, create, and manipulate PDF files |
| `php-guidelines-from-spatie` | Spatie PHP and Laravel coding guidelines |
| `prototype` | Build a throwaway prototype to answer a design question |
| `ray` | Interact with the Ray debugging application |
| `skill-creator` | Create, improve, and measure skills |
| `tdd` | Test-driven development, red to green to refactor |
| `teach` | Teach a new skill or concept inside this workspace |
| `to-questionnaire` | Turn an open decision into a questionnaire for someone else |
| `to-spec` | Turn the conversation into a spec, published as a GitLab issue |
| `to-tickets` | Break a plan into tracer-bullet tickets with declared blockers |
| `triage` | Move GitLab issues and merge requests through triage roles |
| `unslop` | Cut AI tells from any writing |
| `use-spark` | Read Spark email, calendar, and contacts from the CLI |
| `vue-best-practices` | Vue 3 Composition API best practices |
| `vueuse-functions` | Apply VueUse composables in Vue projects |
| `wait-what` | Re-pitch a message that did not land |
| `wizard` | Generate a bash wizard for steps only a human can perform |
| `writing-for-agents` | Write skills, AGENTS.md, and CLAUDE.md for agents |

## Steps to Setup your Mac

These instructions are for when you've already set up your dotfiles.

### Before you re-install

First, go through the checklist below to make sure you didn't forget anything before you wipe your hard drive.

- Did you commit and push any changes/branches to your git repositories?
- Did you remember to save all important documents from non-iCloud directories?
- Did you save all of your work from apps which aren't synced through iCloud?
- Did you remember to export important data from your local database? Run `bin/db-dump`
- Did you update [mackup](https://github.com/lra/mackup) to the latest version and ran `mackup backup`?

### Installing macOS cleanly

After going to our checklist above and making sure you backed everything up, we're going to cleanly install macOS with the latest release. Follow [this article](https://www.imore.com/how-do-clean-install-macos) to cleanly install the latest macOS version.

### Setting up your Mac

1. Update macOS to the latest version with the App Store
2. Install [1Password](https://1password.com/downloads/mac) and sign in, then enable its SSH agent so your existing GitHub SSH key is available on this machine:

   - Open 1Password → Settings → Developer → turn on "Use the SSH Agent"
   - Your SSH key syncs with your 1Password account, so there's no need to generate a new one per machine

3. Clone this repo to `~/.dotfiles` with:

   ```zsh
   git clone git@github.com:ToddSmithSalter/dotfiles.git ~/.dotfiles
   ```

4. Run the installation with:

   ```zsh
   ~/.dotfiles/bin/install
   ```

5. After mackup is synced with your cloud storage, restore preferences by running `mackup restore`
6. Run `macos/set-defaults.sh` last, once everything else is installed and restored
7. Restart your computer to finalize the process

Your Mac is now ready to use!
