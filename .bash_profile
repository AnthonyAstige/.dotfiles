#!/bin/bash

# Needed dupe loading for MacOS
## https://github.com/junegunn/fzf/issues/716
source ~/.fzf.bash

# nodeenv -- Install from https://github.com/nodenv/nodenv as needed
## Comment out as needed for Titanium Appcelerator
## Ubuntu install
[ -d "$HOME/.nodenv/bin" ] && export PATH="$HOME/.nodenv/bin:$PATH"
## Both mac & ubuntu
eval "$(nodenv init -)"

# Load Anthony's personal bash config
[[ -s ~/.bashrc ]] && source ~/.bashrc

# react-native https://facebook.github.io/react-native/docs/getting-started.html
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# BEGIN: Block added by chef, to set environment strings
# Please see https://fburl.com/AndroidProvisioning if you do not use bash
# or if you would rather this bit of code 'live' somewhere else
. ~/.fbchef/environment
# END: Block added by chef
