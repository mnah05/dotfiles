# ========================
# PATH SETUP
# ========================
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"

# ========================
# OH-MY-ZSH CONFIG
# ========================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# ========================
# ALIASES
# ========================
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

# Modern ls replacement (EZA)
alias ls="eza --icons --group-directories-first"
alias ll="eza -lh --icons --group-directories-first"
alias la="eza -lha --icons --group-directories-first"
alias lt='eza -T --icons'

# Ripgrep + fzf
alias rgf='nvim "$(rg --files | fzf --preview "rg --pretty --context 5 {q} {}")"'

# ========================
# ZOXIDE (smart cd)
# ========================
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
  alias cd="z"
fi

# ========================
# HISTORY SETTINGS
# ========================
HISTFILE=$HOME/.zhistory
HISTSIZE=1000
SAVEHIST=1000
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# ========================
# NVM (Node Version Manager)
# ========================
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

# ========================
# SEARCH FUNCTION
# ========================
unalias searchbrave 2>/dev/null  # remove alias if exists

searchbrave() {
  if [[ -n "$1" ]]; then
    open "https://search.brave.com/search?q=${*// /+}"
  else
    open "https://search.brave.com/"
  fi
}

# ========================
# OPTIONAL SETTINGS
# ========================
# Uncomment as needed:
ENABLE_CORRECTION="true"
DISABLE_AUTO_TITLE="true"
HIST_STAMPS="yyyy-mm-dd"
export LANG=en_US.UTF-8
export EDITOR="nvim"

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="/Users/nahasan/.bun/bin:$PATH"

export TERM=xterm-256color

export PATH="$(brew --prefix)/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

# brew related
alias bu="brew update && brew upgrade"
alias bd="brew doctor"
alias bi="brew install"
alias bui="brew uninstall"
alias bc="brew cleanup"

alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gf="git fetch"
alias gl="git log --oneline --graph --decorate"
alias gb="git branch"

# bun completions
[ -s "/Users/mnah05/.bun/_bun" ] && source "/Users/mnah05/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"


alias v="nvim"
alias dc="docker"
source "$HOME/.cargo/env" 
DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
export PATH=$PATH:$(go env GOPATH)/bin
