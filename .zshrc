
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/Users/Aidar/Scripts:$PATH
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH="$HOME/.fastlane/bin:$PATH"
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
)

source $ZSH/oh-my-zsh.sh

DEFAULT_USER='nugmanoff'

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/Scripts/change_tabcolor.sh
source ~/.oh-my-zsh/custom/plugins/notify/notify.plugin.zsh

zstyle ':notify:*' success-title "Success!"
zstyle ':notify:*' error-title "Error!"
zstyle ':notify:*' error-icon "https://media3.giphy.com/media/10ECejNtM1GyRy/200_s.gif"
zstyle ':notify:*' success-icon "https://s-media-cache-ak0.pinimg.com/564x/b5/5a/18/b55a1805f5650495a74202279036ecd2.jpg"

alias zshconfig="vim ~/.zshrc"
alias tg="source ~/Scripts/o-telegram.sh"
alias xc="source ~/Scripts/o-xcode.sh"
alias gh="source ~/Scripts/o-github.sh"
alias ip="curl ipinfo.io/ip"
alias clean="~/Scripts/clean_execs.sh"
alias arb="cd ~/Workspace/ios/arbuz-ios"
alias j="fasd_cd -d"

# Pure Activtation 

autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL=λ
prompt pure

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
eval "$(fasd --init auto)"


