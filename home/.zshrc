# -----------------------------------------------------
# INIT
# -----------------------------------------------------
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"
export PATH="$HOME/scripts:$PATH"
export ZSH="$HOME/.oh-my-zsh"

# Starship -------------------------------------------
eval "$(starship init zsh)"

# -----------------------------------------------------
# ALIASES
# -----------------------------------------------------
# File Management
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias ln='ln -i'
alias mkdir='mkdir -pv'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../../..'
alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'
alias doom='~/scripts/doom.sh'

# Productivity
alias c='clear && $SHELL'
alias v='$EDITOR'
# alias vim='$EDITOR'
alias ts='~/scripts/snapshot.sh'
alias cleanup='~/scripts/cleanup.sh'
alias fig='~/scripts/figlet.sh'
alias wifi='nmtui'
alias monitor='~/scripts/monitor.sh'
alias zsh='nvim ~/.zshrc'
alias keybinds='nvim ~/.config/hypr/conf/keybindings/default.conf'
alias jel1="sudo mount.cifs //192.168.0.105/jel1 /mnt/jel1 -o username=kirk,password=123456"
alias jel2="sudo mount.cifs //192.168.0.105/jel2 /mnt/jel2 -o username=kirk,password=123456"
alias jel3="sudo mount.cifs //192.168.0.105/jel3 /mnt/jel3 -o username=kirk,password=123456"
alias jel="~/scripts/mount_jel.sh"

# Git
alias gs="git status"
alias ga="git add"
alias add="cd ~/.dotfiles && git add ."
alias gc="git commit -m"
alias commit="cd ~/.dotfiles && git commit -m"
alias gp="git push"
alias gpl="git pull"
alias pull="git pull"
alias thinpull="git stash --include-untracked && git pull && git stash pop"
alias gst="git stash"
alias stash="git stash"
alias gsp="git stash; git pull"
alias gcheck="git checkout"
alias gall="git add -A"
alias gl="git log"
alias gll="git log --oneline"
alias push='git push origin main --force'

# System Commands
alias shutdown='systemctl poweroff'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias dusage='du -sh * 2>/dev/null'
alias ping='ping -c 5'
alias fastping='ping -c 100 -i .2'

# Miscellaneous
alias ff='fastfetch'
alias pf='pfetch'
alias tm='tmux -2'
alias ps='pacseek'
alias lp='lsd-print'

# -----------------------------------------------------
# Plugins and Features
# -----------------------------------------------------
plugins=(
    aliases
    bun
    git
    sudo
    web-search
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
    zoxide
    colored-man-pages
    emoji
    fzf
)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# FZF Integration
source <(fzf --zsh)

# ZSH History Configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# -----------------------------------------------------
# Terminal Customization
# -----------------------------------------------------
if [[ $TERM == "xterm-kitty" ]]; then
    ff && fortune | lsd-print
else
fi

# BAT Theme
export BAT_THEME="gruvbox-dark"

# Bun Completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Git Update 
gitupdate() {
  cd ~/.dotfiles && git add . && git commit -m "$1" && git push
}

# -----------------------------------------------------
# END OF .zshrc
# -----------------------------------------------------




### ZNT's installer added snippet ###
fpath=( "$fpath[@]" "$HOME/.config/znt/zsh-navigation-tools" )
autoload n-aliases n-cd n-env n-functions n-history n-kill n-list n-list-draw n-list-input n-options n-panelize n-help
autoload znt-usetty-wrapper znt-history-widget znt-cd-widget znt-kill-widget
alias naliases=n-aliases ncd=n-cd nenv=n-env nfunctions=n-functions nhistory=n-history
alias nkill=n-kill noptions=n-options npanelize=n-panelize nhelp=n-help
zle -N znt-history-widget
bindkey '^R' znt-history-widget
setopt AUTO_PUSHD HIST_IGNORE_DUPS PUSHD_IGNORE_DUPS
zstyle ':completion::complete:n-kill::bits' matcher 'r:|=** l:|=*'
### END ###

