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
alias treseldocs="teleo && docs"
alias ohmyzsh="cd $HOME/.oh-my-zsh"

# Configurations
alias zshconfig="$EDITOR ~/.zshrc"
alias sshconfig="$EDITOR ~/.ssh/config"
alias gitconfig="$EDITOR ~/.gitconfig"
alias aliasconfig="$EDITOR ~/.zsh_aliases"
alias hostsconfig="sudo $EDITOR /etc/hosts"

# Laravel
alias artisan="php artisan"
alias fresh="php artisan migrate:fresh --seed"
alias seed="php artisan db:seed"

#PHP
alias cfresh="rm -rf vendor/ composer.lock && composer i"

# Docker
if [ -f ./vendor/bin/sail ]; then
  alias sail='bash vendor/bin/sail'
elif [ -f ./ci/sail ]; then
  alias sail='bash ci/sail'
fi
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
alias gri='git ls-files --ignored --exclude-standard | xargs git rm'

# Highcharts
alias highcharts='highcharts-export-server --nologo true --logLevel 3 --workers 4 --workLimit 4'
