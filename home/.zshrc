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

# Productivity
alias c='clear && $SHELL'
alias v='$EDITOR'
alias vim='$EDITOR'
alias ts='~/scripts/snapshot.sh'
alias cleanup='~/scripts/cleanup.sh'
alias ascii='~/scripts/figlet.sh'
alias wifi='nmtui'
alias monitor='~/scripts/monitor.sh'
alias zsh='nvim ~/.zshrc'
alias keybinds='nvim ~/.config/hypr/conf/keybindings/default.conf'
alias aliases='.zshrc'

# Git
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias pull="git pull"
alias gst="git stash"
alias stash="git stash"
alias gsp="git stash; git pull"
alias gcheck="git checkout"
alias gall="git add -A"
alias gl="git log"
alias gll="git log --oneline"
alias push='git push origin main --force'
alias git_config='~/scripts/git_config.sh'



# System Commands
alias shutdown='systemctl poweroff'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias dusage='du -sh * 2>/dev/null'
alias ping='ping -c 5'
alias fastping='ping -c 100 -i .2'

# Miscellaneous
alias nf='fastfetch'
alias pf='pfetch'
alias tm='tmux -2'
alias rg='ranger'
alias ps='pacseek'

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
    nf && fortune | lsd-print
else
    echo "Custom terminal settings loaded."
fi

# BAT Theme
export BAT_THEME="gruvbox-dark"

# Bun Completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# -----------------------------------------------------
# END OF .zshrc
# -----------------------------------------------------


