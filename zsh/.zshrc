# ===============
#   ZSH DOTFILE
# MADE BY CHECHU!
# ===============

# MAIN SETTINGS
ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="cypher"
source $ZSH/oh-my-zsh.sh

# PLUGINS
plugins=(colored-man-pages copydir copyfile)

# DOTFILES ALIAS
alias comptonconfig="vim ~/.dotfiles/compton/compton.conf"
alias dunstconfig="vim ~/.dotfiles/dunst/dunstrc"
alias i3config="vim ~/.dotfiles/i3/config"
alias polybarconfig="vim ~/.dotfiles/polybar/config"
alias rangerconfig="vim ~/.dotfiles/ranger/rc.conf"
alias roficonfig="vim ~/.dotfiles/rofi/config"
alias zshconfig="vim ~/.dotfiles/zsh/.zshrc"
alias termiteconfig="vim ~/.dotfiles/termite/config"
alias vimconfig="vim ~/.dotfiles/vim/vimrc"

# GIT ALIAS
alias gcl="git clone"
alias gc="git commit -m"
alias gps="git push"
alias gpl="git pull"
alias gst="git status"
alias gl="git log"
alias gaa="git add ."
alias ga="git add"
alias gth="git stash"
alias gck="git checkout"

# PACKAGE ALIAS
alias upd="sudo pacman -Syu --noconfirm"
alias search="sudo pacman -Ss"
alias remove="sudo pacman -R"

# SHORTCUT ALIAS
alias v="vim"
alias rq="ranger -r ~/.dotfiles/ranger"
alias la="ls -la"
alias zshrs="source ~/.dotfiles/zsh/.zshrc"

# DEV ALIAS
alias fr="flutter run"
alias frr="flutter run --release"
alias fb="flutter build apk"
alias fbr="flutter build apk --release"
alias fpg="flutter packages get"
alias fpu="flutter packages upgrade"

# ENV VARIABLES
export PATH=$HOME/.flutter-sdk/bin:$PATH
export PATH=$HOME/.gem/ruby/2.6.0/bin:$PATH
export GTK_CSD=0
export LD_PRELOAD=/usr/lib/libgtk3-nocsd.so.0
