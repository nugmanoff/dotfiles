#!/bin/bash

export ZSH=~/.oh-my-zsh

# install zsh
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
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# install notify
git clone git@github.com:marzocchi/zsh-notify.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/notify

# configure fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# add support for ctrl+o to open selected file in the default text editor
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(e {})+abort'"

# make completions work for asdf
. $(brew --prefix asdf)/asdf.sh

# fasd init
eval "$(fasd --init auto)"
