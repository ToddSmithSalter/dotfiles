# Path to dotfiles
export DOTFILES=$HOME/.dotfiles

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Enable completions
autoload -Uz compinit && compinit

# Set name of the theme to load
ZSH_THEME="agnoster"

# Hide username in prompt
DEFAULT_USER=`whoami`

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Custom themes/plugins live in their own subfolder, not the whole dotfiles repo
ZSH_CUSTOM=$DOTFILES/oh-my-zsh-custom

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages colorize pip python brew macos)

source $ZSH/oh-my-zsh.sh

# Load env vars, aliases, and functions
for file in $DOTFILES/home/.{exports,aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done

# Load machine-local overrides not tracked in this repo (e.g. work-specific config)
for file in ~/.dotfiles-custom/shell/.{exports,aliases,functions,zshrc}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Load Node Version Manager
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Import ssh keys from Keychain
command -v ssh-add &> /dev/null && ssh-add --apple-use-keychain 2>/dev/null


# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/todd/Library/Application Support/Herd/config/php/84/"


# Herd injected PHP binary.
export PATH="/Users/todd/Library/Application Support/Herd/bin/":$PATH


# Herd injected PHP 8.5 configuration.
export HERD_PHP_85_INI_SCAN_DIR="/Users/todd/Library/Application Support/Herd/config/php/85/"
