# ═══════════════════════════════════════════════════════════════
# 🌿 ZEN ZSH CONFIG - Minimal yet Powerful
# ═══════════════════════════════════════════════════════════════

# ── Core Settings ──────────────────────────────────────────────
export LANG=en_US.UTF-8
export EDITOR="nvim"
export TERM=xterm-256color

# Disable annoying features
setopt NO_BEEP
setopt NO_FLOW_CONTROL
stty -ixon 2>/dev/null

# ── Oh-My-Zsh ──────────────────────────────────────────────────
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
HIST_STAMPS="yyyy-mm-dd"

# Essential plugins only
plugins=(
  git
  colored-man-pages
  command-not-found
)

source $ZSH/oh-my-zsh.sh

# ── PATH (Clean & Deduplicated) ────────────────────────────────
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"
export PATH="$(go env GOPATH 2>/dev/null)/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
export PATH="/Users/mnah05/.codeium/windsurf/bin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)" 2>/dev/null

# ── History ────────────────────────────────────────────────────
HISTFILE=$HOME/.zhistory
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt extended_history

# ── Modern Tools ───────────────────────────────────────────────

# Eza (modern ls)
if command -v eza &>/dev/null; then
  alias ls="eza --icons --group-directories-first"
  alias ll="eza -lh --icons --group-directories-first"
  alias la="eza -lha --icons --group-directories-first"
  alias lt="eza -T --icons -L 3"
  alias l="eza -lh --icons --git"
fi

# Zoxide (smart cd)
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
  alias cd="z"
  alias zz="z -"
fi

# FZF (fuzzy finder)
if command -v fzf &>/dev/null; then
  source <(fzf --zsh 2>/dev/null)
  export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --preview-window=hidden"
  
  # FZF-powered functions
  f() { nvim "$(fzf --preview 'bat --color=always {}')"; }
  frg() { nvim "$(rg --files | fzf --preview 'rg --pretty --context 3 {q} {}')"; }
  fcd() { cd "$(zoxide query -l | fzf)"; }
fi

# ── Aliases ────────────────────────────────────────────────────

# Config shortcuts
alias zc="nvim ~/.zshrc"
alias zr="source ~/.zshrc"
alias vc="nvim ~/.config/nvim"

# Editor
alias v="nvim"
alias vi="nvim"

# Git
alias g="git"
alias gs="git status -sb"
alias ga="git add"
alias gap="git add -p"
alias gc="git commit -v"
alias gcm="git commit -m"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gl="git log --oneline --graph --decorate -20"
alias gla="git log --oneline --graph --decorate --all"
alias gf="git fetch"
alias gpl="git pull"
alias gb="git branch -vv"
alias gd="git diff"
alias gds="git diff --staged"
alias gco="git checkout"
alias grs="git restore"
alias grst="git restore --staged"

# Docker
alias d="docker"
alias dc="docker compose"
alias dps="docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'"

# Brew
alias bu="brew update && brew upgrade && brew cleanup"
alias bd="brew doctor"

# Utilities
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias mkdir="mkdir -pv"
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"
alias clr="clear"
alias myip="curl -s ifconfig.me && echo"
alias serve="python3 -m http.server"

# Search web
search() { open "https://search.brave.com/search?q=${*// /+}"; }

# ── Tool Integrations ──────────────────────────────────────────

# NVM
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"

# Bun
export BUN_INSTALL="$HOME/.bun"
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# Zsh extras (Homebrew)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# ═══════════════════════════════════════════════════════════════
