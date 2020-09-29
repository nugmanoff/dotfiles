#!/bin/bash

export ZSH=~/.oh-my-zsh

# install oh-my-zsh
if [ ! -d $ZSH ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# install pure-prompt
if test "$(command -v npm)"; then
  npm install --global pure-prompt
else
  mkdir -p "$HOME/.zsh"
  git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
fi

# install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-syntax-highlighting

# install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-autosuggestions

# install notify
git clone https://github.com/marzocchi/zsh-notify.git ${ZSH_CUSTOM:-$ZSH/custom}/plugins/notify

# install alias-tips
git clone https://github.com/djui/alias-tips.git ${ZSH_CUSTOM:-$ZSH/custom}/plugins/alias-tips