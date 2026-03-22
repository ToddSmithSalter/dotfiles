# .dotfiles for macOS

## What is this?

This repository serves as a way to help setup and maintain my Mac. Consider this repository a fork of [Dries Vints](https://github.com/driesvints/dotfiles) dotfiles. For full instructions on a fresh macOS setup, follow the directions on Dries' repo.

## What's included

### Shell configuration

- `aliases.zsh` - Common shell aliases
- `functions.zsh` - Custom shell functions
- `path.zsh` - PATH configuration
- `minimal.zsh-theme` - A minimal Zsh prompt theme

### Package management

- `Brewfile` - All Homebrew packages, casks, and Mac App Store apps installed via `brew bundle`

### Scripts

- `fresh.sh` - Full Mac setup script run on a new machine
- `clone.sh` - Clones repositories after a fresh install
- `ssh.sh` - Generates a new SSH key pair
- `bin/install-claude-code` - Standalone script to install and configure Claude Code independently
- `bin/update` - Updates dotfiles and installed packages

### VS Code

- `vscode/` - VS Code settings and keybindings

### Claude Code (`config/claude/`)

Configuration, agents, and skills for [Claude Code](https://claude.ai/claude-code).

- `CLAUDE.md` - Global instructions and coding standards applied to every Claude Code session
- `settings.json` - Claude Code settings including permissions, MCP plugins, and status line configuration
- `laravel-php-guidelines.md` - PHP and Laravel coding guidelines referenced by agents
- `statusline.sh` - Custom status line script displayed in the Claude Code terminal

**Agents** (`config/claude/agents/`) - Specialized sub-agents for focused tasks:

- `laravel-debugger` - Diagnoses and fixes Laravel application issues
- `laravel-feature-builder` - Implements new Laravel features end-to-end
- `laravel-simplifier` - Refactors and cleans up Laravel/PHP code

**Skills** (`config/claude/skills/`) - Reusable slash commands available in any session:

| Skill | Purpose |
|---|---|
| `agent-browser` | Browser automation via AI agent |
| `docker-expert` | Docker containerization guidance |
| `find-skills` | Discover and install new skills |
| `fix-gitlab-issue` | Fix a GitLab issue and open an MR |
| `frontend-design` | Build polished frontend UI components |
| `gitlab-ci-patterns` | GitLab CI/CD pipeline patterns |
| `gitlab-cli-skills` | GitLab CLI (`glab`) command reference |
| `grill-me` | Stress-test a plan through relentless questioning |
| `laravel-inertia-vuejs-structure` | Frontend structure conventions for Laravel Inertia + Vue |
| `laravel-specialist` | Laravel 10+ application building |
| `pdf` | Read, create, and manipulate PDF files |
| `php-guidelines-from-spatie` | Spatie PHP and Laravel coding guidelines |
| `prd-to-issues` | Break a PRD into GitLab issues |
| `ray` | Interact with the Ray debugging application |
| `skill-creator` | Create and improve skills |
| `ubiquitous-language` | Build a DDD glossary from a conversation |
| `vue-best-practices` | Vue 3 Composition API best practices |
| `vueuse-functions` | Apply VueUse composables in Vue projects |
| `web-design-guidelines` | Audit UI for accessibility and design best practices |
| `write-a-prd` | Write a PRD via interview and submit as a GitLab issue |

## Steps to Setup your Mac

These instructions are for when you've already set up your dotfiles.

### Before you re-install

First, go through the checklist below to make sure you didn't forget anything before you wipe your hard drive.

- Did you commit and push any changes/branches to your git repositories?
- Did you remember to save all important documents from non-iCloud directories?
- Did you save all of your work from apps which aren't synced through iCloud?
- Did you remember to export important data from your local database?
- Did you update [mackup](https://github.com/lra/mackup) to the latest version and ran `mackup backup`?

### Installing macOS cleanly

After going to our checklist above and making sure you backed everything up, we're going to cleanly install macOS with the latest release. Follow [this article](https://www.imore.com/how-do-clean-install-macos) to cleanly install the latest macOS version.

### Setting up your Mac

1. Update macOS to the latest version with the App Store
2. [Generate a new public and private SSH key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) by running:

   ```zsh
   curl https://raw.githubusercontent.com/ToddSmithSalter/dotfiles/HEAD/ssh.sh | sh -s "<your-email-address>"
   ```

3. Clone this repo to `~/.dotfiles` with:

   ```zsh
   git clone git@github.com:ToddSmithSalter/dotfiles.git ~/.dotfiles
   ```

4. Run the installation with:

   ```zsh
   ~/.dotfiles/fresh.sh
   ```

5. After mackup is synced with your cloud storage, restore preferences by running `mackup restore`
6. Restart your computer to finalize the process

Your Mac is now ready to use!
