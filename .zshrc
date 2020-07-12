
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/Users/Aidar/Scripts:$PATH
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH="$HOME/.fastlane/bin:$PATH"
export EDITOR=/usr/local/bin/nvim
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Path to your oh-my-zsh installation.
export ZSH=/Users/Aidar/.oh-my-zsh

ZSH_THEME=""

plugins=(
  git
  web-search
  notify
  alias-tips
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh

DEFAULT_USER='nugmanoff'

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.oh-my-zsh/custom/plugins/notify/notify.plugin.zsh

zstyle ':notify:*' success-title "Success!"
zstyle ':notify:*' error-title "Error!"
zstyle ':notify:*' error-icon "https://media3.giphy.com/media/10ECejNtM1GyRy/200_s.gif"
zstyle ':notify:*' success-icon "https://s-media-cache-ak0.pinimg.com/564x/b5/5a/18/b55a1805f5650495a74202279036ecd2.jpg"

alias zf="nvim ~/.zshrc"
alias vf="nvim ~/.config/nvim/init.vim" 
alias rl="source ~/.zshrc"
alias ip="curl ipinfo.io/ip"
alias j="fasd_cd -d"
alias ow="find *.xcworkspace | head -n 1 | xargs open"
alias edit="$EDITOR"
alias e="$EDITOR"
alias run="./Taskfile"
alias lt="exa -las type"
alias ddc="rm -rf ~/Library/Developer/Xcode/DerivedData"

# git aliases, apart from git-extras and ohmyzsh git plugin
alias gg="git log --oneline --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gds="git diff --staged"
alias grs="git restore --staged"
# alias gclp="cd $(pbpaste | xargs -I repo bash -c 'git clone repo  && basename repo .git')"

# Pure Activtation 
autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL=λ
prompt pure

# Carthage zsh completion

autoload -U compinit
compinit -u

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fasd --init auto)"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
