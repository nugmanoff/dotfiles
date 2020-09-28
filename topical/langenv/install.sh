#!/bin/bash

source $HOME/.asdf/asdf.sh;

asdf plugin-add nodejs
asdf install nodejs latest
asdf latest nodejs | xargs asdf global nodejs