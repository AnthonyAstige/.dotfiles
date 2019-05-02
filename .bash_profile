#!/bin/bash

# Custom BrightIdea stuff
export PATH=$PATH:/Users/anthonyastige/main/e2e/node_modules/.bin

# Load Anthony's personal bash config
[[ -s ~/.bashrc ]] && source ~/.bashrc

# Needed dupe loading for MacOS
## https://github.com/junegunn/fzf/issues/716
source ~/.fzf.bash

# nodeenv -- Install from https://github.com/nodenv/nodenv as needed
## Comment out as needed for Titanium Appcelerator
## Ubuntu install
[ -d "$HOME/.nodenv/bin" ] && export PATH="$HOME/.nodenv/bin:$PATH"
## Both mac & ubuntu
eval "$(nodenv init -)"

# react-native https://facebook.github.io/react-native/docs/getting-started.html
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
