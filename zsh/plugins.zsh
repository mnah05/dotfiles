#!/usr/bin/env zsh
# ============================================
# PLUGINS (Manually managed)
# ============================================

# --- Fast Syntax Highlighting ---
FAST_SYNTAX_DIR="$XDG_DATA_HOME/fast-syntax-highlighting"
if [[ ! -d "$FAST_SYNTAX_DIR" ]]; then
    git clone --depth 1 https://github.com/zdharma-continuum/fast-syntax-highlighting "$FAST_SYNTAX_DIR" 2>/dev/null
fi
[[ -f "$FAST_SYNTAX_DIR/fast-syntax-highlighting.plugin.zsh" ]] && source "$FAST_SYNTAX_DIR/fast-syntax-highlighting.plugin.zsh"

# --- Zsh Autosuggestions ---
AUTOSUGGEST_DIR="$XDG_DATA_HOME/zsh-autosuggestions"
if [[ ! -d "$AUTOSUGGEST_DIR" ]]; then
    git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions "$AUTOSUGGEST_DIR" 2>/dev/null
fi
[[ -f "$AUTOSUGGEST_DIR/zsh-autosuggestions.zsh" ]] && source "$AUTOSUGGEST_DIR/zsh-autosuggestions.zsh"

# --- Zsh History Substring Search ---
ZSH_HISTORY_SUBSTRING_DIR="$XDG_DATA_HOME/zsh-history-substring-search"
if [[ ! -d "$ZSH_HISTORY_SUBSTRING_DIR" ]]; then
    git clone --depth 1 https://github.com/zsh-users/zsh-history-substring-search "$ZSH_HISTORY_SUBSTRING_DIR" 2>/dev/null
fi
[[ -f "$ZSH_HISTORY_SUBSTRING_DIR/zsh-history-substring-search.zsh" ]] && source "$ZSH_HISTORY_SUBSTRING_DIR/zsh-history-substring-search.zsh"

# --- Zsh Vi Mode ---
ZSH_VI_MODE_DIR="$XDG_DATA_HOME/zsh-vi-mode"
if [[ ! -d "$ZSH_VI_MODE_DIR" ]]; then
    git clone --depth 1 https://github.com/jeffreytse/zsh-vi-mode "$ZSH_VI_MODE_DIR" 2>/dev/null
fi
[[ -f "$ZSH_VI_MODE_DIR/zsh-vi-mode.plugin.zsh" ]] && source "$ZSH_VI_MODE_DIR/zsh-vi-mode.plugin.zsh"

# --- Starship ---
if command -v starship &>/dev/null; then
    eval "$(starship init zsh)"
fi
