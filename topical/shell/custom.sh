#!/bin/bash

########################################
# aliases
########################################
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'" # copy public key to clipboard
alias zf="nvim ~/.zshrc"
alias vf="nvim ~/.config/nvim/init.vim" 
alias rl="source ~/.zshrc"
alias j="fasd_cd -d"
alias ow="find *.xcworkspace | head -n 1 | xargs open"
alias edit="$EDITOR"
alias e="$EDITOR"
alias run="./Taskfile"
alias lt="exa -las type"
alias ddc="rm -rf ~/Library/Developer/Xcode/DerivedData"
alias ag="ag —path-to-ignore ~/.ignore"
# git aliases, apart from git-extras and ohmyzsh git plugin
alias gg="git log --oneline --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gds="git diff --staged"
alias grs="git restore --staged"
# alias gclp="cd $(pbpaste | xargs -I repo bash -c 'git clone repo  && basename repo .git')"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias preview="fzf --preview 'bat --color \"always\" {}'"
# add support for ctrl+o to open selected file in the default text editor
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(e {})+abort'"

# make completions work for asdf
. $(brew --prefix asdf)/asdf.sh

# fasd init
eval "$(fasd --init auto)"
