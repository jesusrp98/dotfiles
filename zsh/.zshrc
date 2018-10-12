# ===============
#   ZSH DOTFILE
# MADE BY CHECHU!
# ===============

# MAIN SETTINGS
ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="cypher"
source $ZSH/oh-my-zsh.sh

# DOTFILES ALIAS
alias zshconfig="vim ~/.dotfiles/zsh/.zshrc"
alias i3config="vim ~/.dotfiles/i3/config"
alias polybarconfig="vim ~/.dotfiles/polybar/config"
alias roficonfig="vim ~/.dotfiles/rofi/config"
alias vimconfig="vim ~/.dotfiles/vim/vimrc"
alias rangerconfig="vim ~/.dotfiles/ranger/rc.conf"
alias comptonconfig="vim ~/.dotfiles/compton/compton.conf"
alias dunstconfig="vim ~/.dotfiles/dunst/dunstrc"
alias termiteconfig="vim ~/.dotfiles/termite/config"
alias rangerconfig="vim ~/.dotfiles/ranger/rc.conf"

# GIT ALIAS
alias gi="git init"
alias gcl="git clone"
alias gc="git commit -m"
alias gps="git push"
alias gpl="git pull"
alias gst="git status"
alias gl="git log"
alias gaa="git add ."
alias gth="git stash"

# FOLDERS ALIAS
alias hdd="sudo ntfs-3g /dev/sdb1 /mnt/hdd"

# RANDOM ALIAS
alias upd="sudo pacman -Syu --noconfirm"
alias search="sudo pacman -S"
alias remove="sudo pacman -R"
alias v="vim"
alias rq="ranger -r ~/.dotfiles/ranger"
alias la="ls -la"
alias zshrs="source ~/.dotfiles/zsh/.zshrc"
alias fr="flutter run"
alias frr="flutter run --release"
alias fb="flutter build apk"
alias fbr="flutter build apk --release"
alias fupd="flutter upgrade"
alias fd="flutter doctor -v"

# CUSTON ENV VARIABLES
export PATH=$HOME/.flutter-sdk/bin:$PATH
