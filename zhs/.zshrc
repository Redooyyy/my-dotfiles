# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnosterzak"

plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux

# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
#pokemon-colorscripts --no-title -s -r #without fastfetch
#pokemon-colorscripts --no-title -s -r | fastfetch -c $HOME/.config/fastfetch/config-pokemon.jsonc --logo-type file-raw --logo-height 10 --logo-width 5 --logo -

# fastfetch. Will be disabled if above colorscript was chosen to install
fastfetch -c $HOME/.config/fastfetch/config-compact.jsonc

# Set-up icons for files/directories in terminal using lsd
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

export PATH="$PATH:/home/Reo/flutter/bin"

#custom shortcut
alias tn='tmux new -s'
alias tl='tmux ls'
alias td='tmux detach'
alias ta='tmux attach'
alias tkill='tmux kill-server'
alias reoup='sudo pacman -Syu'
alias reoi='sudo pacman -S'
alias reou='sudo pacman -Rns'
alias reoiy='yay -S'
alias reouy='yay -Rns'
alias off='shutdown now'

git-create() {
  if [ -z "$1" ]; then
    echo "❗ Please provide a repository name."
    return 1
  fi

  if [ ! -d .git ]; then
    echo "📦 Initializing Git repository..."
    git init
  fi

  gh repo create "$1" --public --source=. --remote=origin
}

alias git-push-init='git add . && git commit -m "Initial commit" && git push -u origin master'

git-update() {
  if [ -z "$1" ]; then
    echo "❗ Please provide a commit message."
    return 1
  fi
  git add .
  git commit -m "$1"
  git push
}

# Switch branch
alias git-switch='git checkout'

# Create new branch and switch
alias git-cswitch='git checkout -b'

# Merge master into current branch
alias git-merge='git merge master'

# Pull latest master and return to current branch
alias git-pull='git checkout master && git pull origin master && git checkout -'

# Delete a branch locally and remotely
alias git-delete-branch='f() { git branch -d $1 && git push origin --delete $1; }; f'



# Disable touchpad
alias touchpad-off='echo "i2c-ASUP1301:00" | sudo tee /sys/bus/i2c/drivers/i2c_hid_acpi/unbind && notify-send "🌙 Touchpad Disabled" "Your gestures are now at rest."'

# Enable touchpad
alias touchpad-on='echo "i2c-ASUP1301:00" | sudo tee /sys/bus/i2c/drivers/i2c_hid_acpi/bind && notify-send "🌞 Touchpad Enabled" "Your gestures have returned."'

# Download best quality video
alias ytbest='yt-dlp -f "bestvideo+bestaudio/best" -o "~/Videos/%(title)s.%(ext)s"'

# Download 1080p mp4 only
alias yt1080='yt-dlp -f "bestvideo[ext=mp4][height<=1080]+bestaudio[ext=m4a]/mp4" -o "~/Videos/%(title)s.%(ext)s"'

# Download audio only (mp3)
alias ytmp3='yt-dlp -x --audio-format mp3 -o "~/Music/%(title)s.%(ext)s"'

# Download playlist into a folder
alias ytplaylist='yt-dlp -o "~/Videos/%(playlist_title)s/%(title)s.%(ext)s"'

# Instagram / generic site downloader (same command works)
alias igdl='yt-dlp -o "~/Videos/Instagram/%(title)s.%(ext)s"'

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export PATH=$JAVA_HOME/bin:$PATH

//setting up path
export ANDROID_HOME=/home/Reo/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin/
