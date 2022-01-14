# Enable aliases to be sudo’ed
alias sudo='sudo '

#  Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub && echo 'Copied to clipboard.'"
alias reloadshell="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'
alias c="clear"

# Directories
alias library="cd $HOME/Library"
alias dev="cd $HOME/Developer"
alias teleo="cd $HOME/Developer/teleo"
alias tresel="teleo && tresel"
alias treseldocs="teleo && cd tresel-docs"
alias burke="cd $HOME/Developer/burke"
alias ohmyzsh="cd $HOME/.oh-my-zsh"

# Configurations
alias zshconfig="code $DOTFILES/.zshrc"
alias sshconfig="code $HOME/.ssh/config"
alias gitconfig="code $DOTFILES/.gitconfig"
alias aliasconfig="code $DOTFILES/aliases.zsh"
alias hostsconfig="sudo code /etc/hosts"
alias dotfiles="code $DOTFILES"
alias mysqladm='mysql -u root'

# Laravel
alias a="php artisan"
alias ar="php artisan remote"
alias mfs="php artisan migrate:fresh --seed"
alias seed="php artisan db:seed"

# PHP
alias c="composer"
alias cu="composer update"
alias cr="composer require"
alias ci="composer install"
alias cda="composer dump-autoload -o"
alias cfresh="rm -rf vendor/ composer.lock && composer i"
alias sail='./vendor/bin/sail'
alias switch-php81="brew unlink php@8.0 && brew link --overwrite --force php"
alias switch-php80="brew unlink php && brew link --overwrite --force php@8.0"

# Redis
alias flush-redis="redis-cli FLUSHALL"

# Docker
alias docker-composer="docker-compose"

# NPM
alias nfresh='rm -rf node_modules/ package-lock.json && npm install'
alias watch='npm run watch'
alias hot='npm run hot'

# Python
alias python=python3
alias pip=pip3

# Global git aliases
alias gst="git status"
alias gb="git branch"
alias gc="git checkout"
alias gl="git log --oneline --decorate --color"
alias amend="git add . && git commit --amend --no-edit"
alias commit="git add . && git commit -m"
alias diff="git diff"
alias force="git push --force"
alias nuke="git clean -df && git reset --hard"
alias pop="git stash pop"
alias pull="git pull"
alias push="git push"
alias resolve="git add . && git commit --no-edit"
alias stash="git stash -u"
alias unstage="git restore --staged ."
alias wip="commit wip"

# Changed your .gitignore _after_ you have added / commited some files?
# run `gri` to untrack anything in your updated .gitignore
alias gri='git rm -r --cached . && git add . && git commit -am "Remove ignored files"'

# Fast open
alias o="open ."

# List all files colorized in long format
alias l="ls -laF"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# IP addresses
alias ip="curl https://diagnostic.opendns.com/myip ; echo"
alias localip="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Flush Directory Service cache
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

# Lock the screen
alias afk="osascript -e 'tell application \"System Events\" to keystroke \"q\" using {command down,control down}'"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Restart touch bar
alias touchbar="killall ControlStrip"
