#!/bin/sh

set -e  # Exit on error (but we use || true for optional steps)

# Colors
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

step() { echo ""; echo -e "${BLUE}➜${NC} $1"; }
success() { echo -e "${GREEN}✓${NC} $1"; }
warn() { echo -e "${YELLOW}⚠${NC} $1"; }
error() { echo -e "${RED}✗${NC} $1"; exit 1; }

echo "Setting up your Mac..."

sudo -v

# Check for Oh My Zsh and install if we don't have it
touch ~/.hushlogin
step "Installing Oh My Zsh"
if [ ! -d ~/.oh-my-zsh ]; then
    rm -rf ~/.oh-my-zsh
    curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh -s -- --unattended || warn "Oh My Zsh installation failed"
fi
success "Oh My Zsh installed"

# Git Configuration
step "Configuring Git"
ln -sf ~/.dotfiles/home/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/home/.global-gitignore ~/.global-gitignore
success "Git configured"

# Symlinks
step "Creating symlinks"
rm -f ~/.zshrc ~/.vimrc ~/.vim ~/.mackup.cfg
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.vim ~/.vim
ln -sf ~/.dotfiles/.mackup.cfg ~/.mackup.cfg
success "Symlinks created"

# Homebrew
step "Installing Homebrew"
if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
success "Homebrew installed"

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
step "Installing packages from Brewfile"
brew tap homebrew/bundle
brew bundle
success "Brewfile processed"

# Install PHP extensions with PECL
pecl install imagick 2>/dev/null || warn "imagick already installed or failed"
pecl install memcached 2>/dev/null || warn "memcached already installed or failed"
pecl install xdebug 2>/dev/null || warn "xdebug already installed or failed"
pecl install redis 2>/dev/null || warn "redis already installed or failed"

# Global Composer packages
step "Installing global Composer packages"
composer global require laravel/pint || warn "pint already installed or failed"
composer global require laravel/valet || warn "valet already installed or failed"
valet install || warn "valet already installed or failed"
success "Composer packages processed"

# Install Agent Browser
agent-browser install 2>/dev/null || warn "agent-browser setup skipped"

# Claude Code setup
echo ""
read -p "Install Claude Code? (y/n) " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    bash ~/.dotfiles/bin/install-claude-code || warn "Claude Code setup had issues"
else
    warn "Skipping Claude Code installation"
fi

# Set macOS preferences - we will run this last because this will reload the shell
source .macos
