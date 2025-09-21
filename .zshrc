# ========================
# EZA aliases (modern ls)
# ========================
alias ls="eza --icons --group-directories-first"
alias ll="eza -lh --icons --group-directories-first"
alias la="eza -lha --icons --group-directories-first"

# ========================
# fd (better find)
# ========================
# Use fd as the default source for fzf
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# ========================
# fzf (fuzzy finder)
# ========================
# Make fzf use ripgrep for history searching
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --ansi"

# ctrl+r to search history with syntax highlight
bindkey '^R' fzf-history-widget

# ========================
# rg (ripgrep) shortcut
# ========================
alias rgf="rg --files | fzf --preview 'rg --pretty --context 5 {q} {}'"

# ========================
# Git shortcuts
# ========================
alias g="git"
alias gs="git status "
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gf="git fetch"
alias gl="git log --oneline --graph --decorate"
alias gb="git branch"

# ========================
# zoxide (smarter cd)
# ========================
eval "$(zoxide init zsh)"
alias cd="z"   # optional: replace cd with z
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"

eval "$(starship init zsh)"
. "$HOME/.cargo/env"

# bun completions
[ -s "/Users/nahasan/.bun/_bun" ] && source "/Users/nahasan/.bun/_bun"

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
