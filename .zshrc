export XDG_CONFIG_HOME=$HOME/.config



export PATH=$HOME/.local/bin:$PATH

export EDITOR='nvim'
export VISUAL='nvim'

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/marcduiker.toml)"
#eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/marcduiker.json)"

eval "$(zoxide init zsh)"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source "$HOME/.fzf"
source "$HOME/.aliases"

plugins=(
    git
    history
    web-search
    dirhistory
    z
    poetry
)

# User configuration

zstyle ':completion:*' menu select

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
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

#eval "$(uv generate-shell-completion zsh)"
#eval "$(uvx --generate-shell-completion zsh)"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GOROOT="/usr/local/go"
export GOPATH="$HOME/go"
export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"

# Load Angular CLI autocompletion.
#source <(ng completion script)

# The next line updates PATH for the Google Cloud SDK.
#if [ -f '/Users/efuentesamin/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/efuentesamin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
#if [ -f '/Users/efuentesamin/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/efuentesamin/google-cloud-sdk/completion.zsh.inc'; fi


