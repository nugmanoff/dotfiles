# use `hub` as our git wrapper
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# custom aliases
alias gs='gst'
# for all the rest, I just use oh-my-zsh git plugin aliases
