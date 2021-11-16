# Load dotfiles binaries
export PATH="$DOTFILES/bin:$PATH"

# Load Composer tools
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Load Node global installed binaries
export PATH="$HOME/.node/bin:$PATH"

# Use project specific binaries before global ones
export PATH="node_modules/.bin:vendor/bin:$PATH"

# Load Homebrew sbin to PATH
export PATH="/usr/local/sbin:$PATH"

# Load Docker bin to PATH
export PATH="/Applications/Docker.app/Contents/Resources/bin":$PATH

# Gradle
export GRADLE_HOME="/usr/local/opt/gradle"
export PATH="$GRADLE_HOME/bin:$PATH"

# Android Dev Paths
# https://gist.github.com/ThePredators/064c46403290a6823e03be833a2a3c21
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$PATH"

# Make sure coreutils are loaded before system commands
# I've disabled this for now because I only use "ls" which is
# referenced in my aliases.zsh file directly.
#export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
