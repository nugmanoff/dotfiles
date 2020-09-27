#!/bin/bash
#
# hooks the dotfiles project to your home and shell config
export DOTFILES="$HOME/.dotfiles"

echo ''

info () {
  printf "\r  [ \033[00;34m..\033[0m ] %s\n" "$1"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] %s\n" "$1"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] %s\n" "$1"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] %s\n" "$1"
  echo ''
  exit
}

setup_gitconfig () {
  if ! [ -f specific/git/gitconfig-local.symlink ]; then
    info 'setup gitconfig'

    user ' - What is your github author name?'
    read -r -e git_authorname
    user ' - What is your github author email?'
    read -r -e git_authoremail

    sed \
      -e "s/AUTHORNAME/$git_authorname/g" \
      -e "s/AUTHOREMAIL/$git_authoremail/g" \
      specific/git/gitconfig-local.symlink.example > specific/git/gitconfig-local.symlink

    success 'gitconfig'
  fi
}


link_file () {
  local SRC=$1 DST=$2

  local overwrite='' backup='' skip=''
  local action=

  if [ -f "$DST" ] || [ -d "$DST" ] || [ -L "$DST" ]; then
    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]; then
      local currentSrc
      currentSrc="$(readlink "$DST")"

      if [ "$currentSrc" == "$SRC" ]; then
        skip=true;
      else
        user "File already exists: $DST ($(basename "$SRC")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -r -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac
      fi
    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]; then
      rm -rf "$DST"
      success "removed $DST"
    fi

    if [ "$backup" == "true" ]; then
      mv "$DST" "${DST}.backup"
      success "moved $DST to ${DST}.backup"
    fi

    if [ "$skip" == "true" ]; then
      success "skipped $SRC"
    fi
  fi

  # "false" or empty
  if [ "$skip" != "true" ]; then
    ln -s "$1" "$2"
    success "linked $1 to $2"
  fi
}

install_dotfiles () {
  info 'installing dotfiles'

  local overwrite_all=false backup_all=false skip_all=false

  # shellcheck disable=SC2044
  for SRC in $(find -H "$DOTFILES" -maxdepth 4 -name '*.symlink' -not -path '*.git*'); do
    DST="$HOME/.$(basename "${SRC%.*}")"
    link_file "$SRC" "$DST"
  done
}

setup_gitconfig
install_dotfiles

info "installing dependencies"
if source scripts/dependencies-install.sh
then
  success "dependencies installed"
else
  fail "error installing dependencies"
fi

echo ''
success '  All installed!'
