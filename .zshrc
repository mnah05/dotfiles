# zoxide init
eval "$(zoxide init zsh)"

# aliases
alias ls="eza"
alias ll="eza -lh"          # long format, human-readable sizes
alias la="eza -a"           # show hidden files
alias lla="eza -lha"        # long + hidden
alias lt="eza --tree"       # tree view

# starship prompt
export STARSHIP_CONFIG=~/.config/starship.toml
eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="/Users/hasandot/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH="$(go env GOPATH)/bin:$PATH"
alias t="~/.local/bin/ttrack.zsh"
