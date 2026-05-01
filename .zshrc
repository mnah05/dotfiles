#!/usr/bin/env zsh
# ============================================
# ZSH Configuration File
# ============================================

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

HOMEBREW_PREFIX="/opt/homebrew"
BUN_INSTALL="$HOME/.bun"
LOCAL_BIN="$HOME/.local/bin"

mkdir -p "$XDG_CONFIG_HOME/zsh"
mkdir -p "$LOCAL_BIN"

# ============================================
# HISTORY
# ============================================

HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTFILE="$XDG_CONFIG_HOME/zsh/.zsh_history"

setopt APPEND_HISTORY SHARE_HISTORY HIST_IGNORE_SPACE HIST_IGNORE_ALL_DUPS HIST_SAVE_NO_DUPS

# ============================================
# PLUGINS (Manually managed)
# ============================================

AUTOSUGGEST_DIR="$XDG_DATA_HOME/zsh-autosuggestions"
if [[ ! -d "$AUTOSUGGEST_DIR" ]]; then
    git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions "$AUTOSUGGEST_DIR" 2>/dev/null
fi
[[ -f "$AUTOSUGGEST_DIR/zsh-autosuggestions.zsh" ]] && source "$AUTOSUGGEST_DIR/zsh-autosuggestions.zsh"

ZSH_SYNTAX_DIR="$XDG_DATA_HOME/zsh-syntax-highlighting"
if [[ ! -d "$ZSH_SYNTAX_DIR" ]]; then
    git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_SYNTAX_DIR" 2>/dev/null
fi
[[ -f "$ZSH_SYNTAX_DIR/zsh-syntax-highlighting.zsh" ]] && source "$ZSH_SYNTAX_DIR/zsh-syntax-highlighting.zsh"

# ============================================
# PATH
# ============================================

add_to_path() {
    [[ -d "$1" && ":$PATH:" != *":$1:"* ]] && export PATH="$1:$PATH"
}

add_to_path "$LOCAL_BIN"
add_to_path "$BUN_INSTALL/bin"
add_to_path "$HOMEBREW_PREFIX/opt/node@22/bin"

# ============================================
# BUN
# ============================================

[[ -s "$BUN_INSTALL/_bun" ]] && source "$BUN_INSTALL/_bun"

# ============================================
# NVM (Lazy Loading via Homebrew)
# ============================================

export NVM_DIR="$HOME/.nvm"
if [[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ]]; then
    lazy_load_nvm() {
        unset -f nvm node npm npx
        source "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
        [[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ]] && source "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"
    }
    nvm() { lazy_load_nvm; nvm "$@"; }
    node() { lazy_load_nvm; node "$@"; }
    npm() { lazy_load_nvm; npm "$@"; }
    npx() { lazy_load_nvm; npx "$@"; }
fi

# ============================================
# STARSHIP
# ============================================

if command -v starship &>/dev/null; then
    eval "$(starship init zsh)"
else
    PS1='%F{blue}%~%f %# '
fi

# ============================================
# FZF
# ============================================

if command -v fzf &>/dev/null; then
    eval "$(fzf --zsh)"
    [[ -n $(command -v fd) ]] && export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
fi

# ============================================
# ZOXIDE
# ============================================

if command -v zoxide &>/dev/null; then
    eval "$(zoxide init --cmd cd zsh)"
fi

# ============================================
# COMPLETION
# ============================================

autoload -Uz compinit
compinit -C

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select

# ============================================
# ALIASES
# ============================================

alias clr='clear'
alias reload='source ~/.zshrc'

if command -v eza &>/dev/null; then
    alias ls='eza --icons'
    alias ll='eza -la --icons --git'
    alias lt='eza --tree --icons --level=2'
    alias lta='eza --tree --icons --level=3 --all'
else
    alias ll='ls -lah'
fi

if command -v bun &>/dev/null; then
    alias bro='bun run dev'
    alias bi='bun install'
    alias ba='bun add'
    alias br='bun remove'
fi

alias gs='git status'
alias gco='git checkout'
alias gp='git push'
alias gl='git pull'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# ============================================
# OPTIONS
# ============================================

bindkey -e
setopt AUTO_CD AUTO_PUSHD PUSHD_IGNORE_DUPS INTERACTIVE_COMMENTS
unsetopt BEEP

# ============================================
# LOCAL CONFIG
# ============================================

[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
