export XDG_CONFIG_HOME=$HOME/.config
export PATH=$HOME/.local/bin:/usr/local/sbin:$PATH

export EDITOR='nvim'
export VISUAL='nvim'

# Oh My Posh
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/marcduiker.toml)"
#eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/marcduiker.json)"

# Zsh Autosuggestions and Syntax Highlighting
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Zsh Completion
zstyle ':completion:*' menu select

# Zoxide
eval "$(zoxide init zsh)"

plugins=(
    git
    history
    web-search
    dirhistory
    z
)

# Fzf
source "$HOME/.fzf"

# Aliases
source "$HOME/.aliases"

# ----- Bat (better cat) -----
export BAT_THEME=tokyonight_night

# history setup
export HISTFILE=$HOME/.zhistory
export SAVEHIST=1000
export HISTSIZE=999999999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PATH:$PNPM_HOME" ;;
esac
# pnpm end

# nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# go
export GOROOT="/usr/local/go"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

# uv
# eval "$(uv generate-shell-completion zsh)"
# eval "$(uvx --generate-shell-completion zsh)"
