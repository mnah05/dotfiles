
# ========================
# PATH Setup
# ========================
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"

# ========================
# Oh My Zsh Setup
# ========================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh


# ========================
# Cargo (Rust) environment
# ========================
. "$HOME/.cargo/env"

# ========================
# Aliases
# ========================
# EZA aliases (modern ls)
alias ls="eza --icons --group-directories-first"
alias ll="eza -lh --icons --group-directories-first"
alias la="eza -lha --icons --group-directories-first"

# Git shortcuts
alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gf="git fetch"
alias gl="git log --oneline --graph --decorate"
alias gb="git branch"

# Ripgrep + fzf
alias rgf="rg --files | fzf --preview 'rg --pretty --context 5 {q} {}'"

# ========================
# FZF + fd configuration
# ========================
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --ansi"
bindkey '^R' fzf-history-widget  # ctrl+r to search history

# ========================
# zoxide (smarter cd)
# ========================
eval "$(zoxide init zsh)"
alias cd="z"   # optional: replace cd with z


# ========================
# History setup
# ========================
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# ========================
# Zsh plugins (syntax highlighting + autosuggestions)
# ========================
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="/Users/nahasan/.bun/bin:$PATH"
