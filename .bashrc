## Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
# =====================================================
# PATH
# =====================================================
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"

# Homebrew
export PATH="$(brew --prefix)/bin:/opt/homebrew/sbin:$PATH"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Java
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"

# Go
export PATH="$PATH:$(go env GOPATH)/bin"

# =====================================================
# ENVIRONMENT
# =====================================================
export LANG="en_US.UTF-8"
export EDITOR="nvim"
export TERM="xterm-256color"

# =====================================================
# TOOLS / RUNTIMES
# =====================================================
# Cargo
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"


# =====================================================
# ALIASES
# =====================================================
alias v="nvim"
alias dc="docker"
alias t="tmux"
alias ls="eza --icons --group-directories-first"
alias ll="eza -lh --icons --group-directories-first"
alias la="eza -lha --icons --group-directories-first"
alias lt="eza -T --icons"

alias rgf='nvim "$(rg --files | fzf --preview "rg --pretty --context 5 {q} {}")"'

# =====================================================
# FUNCTIONS
# =====================================================
unalias searchbrave 2>/dev/null
searchbrave() {
  if [[ -n "$1" ]]; then
    open "https://search.brave.com/search?q=${*// /+}"
  else
    open "https://search.brave.com/"
  fi
}

# =====================================================
# TERMINAL BEHAVIOR
# =====================================================
# Disable Ctrl-S freeze
stty -ixon

# =====================================================
# BASH COMPLETION (MUST BE BEFORE ble.sh)
# =====================================================
if [ -f /opt/homebrew/etc/bash_completion ]; then
  source /opt/homebrew/etc/bash_completion
fi

# =====================================================
# PROMPT (BEFORE ble.sh)
# =====================================================
command -v starship >/dev/null && eval "$(starship init bash)"

# =====================================================
# BLE.SH (ABSOLUTELY LAST — NOTHING AFTER THIS)
# =====================================================
source "$HOME/ble.sh/out/ble.sh"
# ========================
# ZOXIDE (AFTER ble.sh)
# ========================
command -v zoxide >/dev/null && eval "$(zoxide init bash)"
alias cd="z"
