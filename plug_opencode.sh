#!/bin/sh

rsync -avh --progress $HOME/.config/opencode/ ./.config/opencode
rm -rf $HOME/.config/opencode
stow .
