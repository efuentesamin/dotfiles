#!/bin/sh

curl https://sh.rustup.rs -sSf | sh -s -- -y
export NONINTERACTIVE=1
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install jandedobbeleer/oh-my-posh/oh-my-posh
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install fzf
brew install fd
brew install bat
brew install ripgrep
brew install zoxide
brew install git-delta
brew install eza
brew install thefuck
brew install jesseduffield/lazygit/lazygit
brew install jesseduffield/lazydocker/lazydocker
brew install posting
brew install nvim
brew install stow
. $HOME/.cargo/env && cargo install rainfrog && cargo install --locked tree-sitter-cli
