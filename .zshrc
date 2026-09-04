# ─── Homebrew ─────────────────────────────────────────────
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi


# ─── Editor ───────────────────────────────────────────────
export EDITOR=vim
export VISUAL="$EDITOR"


# ─── PATH ─────────────────────────────────────────────────
typeset -U path PATH

path=(
  "$HOME/.local/bin"
  "$HOME/.grok/bin"
  "$HOME/go/bin"
  $path
)


# ─── Grok completions ────────────────────────────────────
if [[ -d "$HOME/.grok/completions/zsh" ]]; then
  fpath=("$HOME/.grok/completions/zsh" $fpath)
fi


# ─── History ──────────────────────────────────────────────
HISTSIZE=50000
SAVEHIST=50000
HISTFILE="$HOME/.zsh_history"

setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE


# ─── Completion ───────────────────────────────────────────
zmodload zsh/complist
autoload -Uz compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

if [[ -n "$LS_COLORS" ]]; then
  zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
fi

compinit


# ─── Keys ─────────────────────────────────────────────────
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word


# ─── Colors ───────────────────────────────────────────────
# macOS grep does not support --color.
# If GNU grep is installed through Homebrew, use ggrep.
if command -v ggrep >/dev/null 2>&1; then
  alias grep='ggrep --color=auto'
fi


# ─── Zoxide ───────────────────────────────────────────────
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
  alias cd='z'
fi


# ─── Aliases ──────────────────────────────────────────────
alias bup='brew update && brew upgrade'

if command -v eza >/dev/null 2>&1; then
  alias ll='eza --long --all --git --icons=auto'
  alias la='eza --all --icons=auto'
  alias ls='eza --icons=auto'
fi

if command -v bat >/dev/null 2>&1; then
  alias cat='bat --paging=never'
fi

alias md='mkdir -p'

# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate --all'
alias gd='git diff'

# Miscellaneous helpers
alias serve='python3 -m http.server 8000'
alias ports='lsof -iTCP -sTCP:LISTEN -nP'
alias myip='curl -s ifconfig.me && echo'


# ─── Fast ─────────────────────────────────────────────────
if command -v fast >/dev/null 2>&1; then
  fast() {
    command fast --verbose "$@"
  }
fi


# ─── Go ───────────────────────────────────────────────────
export GOPATH="$HOME/go"


# ─── NVM / Node ───────────────────────────────────────────
export NVM_DIR="$HOME/.nvm"

if [[ -s /opt/homebrew/opt/nvm/nvm.sh ]]; then
  source /opt/homebrew/opt/nvm/nvm.sh
fi

if [[ -s /opt/homebrew/opt/nvm/etc/bash_completion.d/nvm ]]; then
  source /opt/homebrew/opt/nvm/etc/bash_completion.d/nvm
fi


# ─── fzf ──────────────────────────────────────────────────
if [[ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]]; then
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
fi

if [[ -f /opt/homebrew/opt/fzf/shell/completion.zsh ]]; then
  source /opt/homebrew/opt/fzf/shell/completion.zsh
fi


# ─── Git Delta ────────────────────────────────────────────
if command -v delta >/dev/null 2>&1; then
  export GIT_PAGER=delta
fi

# ─── Fast ─────────────────────────────────────────────────
unalias fast 2>/dev/null

if (( $+commands[fast] )); then
  fast() {
    command fast --verbose "$@"
  }
fi

# Use Chrome for tools that rely on Puppeteer (e.g. fast)
export PUPPETEER_EXECUTABLE_PATH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"


# ─── Starship prompt ──────────────────────────────────────
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# Added by Antigravity IDE
export PATH="/Users/mnah/.antigravity-ide/antigravity-ide/bin:$PATH"
export PATH=$PATH:$HOME/go/bin
alias aws-login="aws-vault exec hasan -- zsh"
alias myip='curl https://checkip.amazonaws.com/'


# Rust toolchain installed through Homebrew rustup
export PATH="/opt/homebrew/opt/rustup/bin:$PATH"
