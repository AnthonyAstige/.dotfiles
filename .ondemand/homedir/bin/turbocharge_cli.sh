#!/usr/bin/env bash

##### WHAT THIS DOES
# This turbocharges CLI output of diffs (which you see when running `hg diff`
# or `hg show`).  It enables a side-by-side view and also adds syntax
# highlighting and line numbers.

##### HOW TO USE
# 1) Make sure you have Homebrew installed - see https://brew.sh/
# 2) Run this script on your local laptop (not OD or devserver).
#
# This script generates some files and puts them in a directory,
# `~/.ondemand/homedir`, that gets synced over to all future ondemands and
# powers the turbocharged CLI.
#
# This script is intended to be run only once.  You can safely run it
# multiple times, but may end up adding duplicate config in some files.

##### GOTCHAS
# **You may want to backup your `~/.ondemand/homedir` directory** if you have 
# one before running this script.  If things check out, you can reload that 
# and run this script again.
#
# Getting a permission error?  Try cloning the contents of this into another
# file and running that instead.

##### UNINSTALLATION
# If you're seeing issues related to your ondemands after running this script,
# run `rm -rf ~/.ondemand/homedir` and reload from your backup if you have one.

##### DEVSERVER SUPPORT
# If you have a fresh devserver, run the code below.  This syncs your OD 
# dotsync folder over to your devserver.
# 
# For older devservers, the script will also work, but keep in mind **it'll 
# overwrite some files** - `.aliases`, `.hgrc`, `.gitconfig`.  Manually apply 
# the changes in this script and comment out those lines if you have anything 
# you want to keep.
#
# [CODE]
# rsync -rKL ~/.ondemand/homedir/ <YOUR_DEVSERVER>:~

##### HELP!
# Still not working? Check that `echo $PATH` on your OD includes `~/bin`.  If 
# not, append it to `~/.ondemand/homedir/.aliases` and then reserve a new OD.

############################ SCRIPT START

# Util dependencies
brew install wget

# Create `~/bin` directory in ODs and sync it from a directory on your laptop
mkdir -p ~/.ondemand/homedir/bin
touch ~/.ondemand/homedir/.aliases
echo -e 'PATH=$PATH:~/bin\n' | cat - ~/.ondemand/homedir/.aliases > tmp && mv tmp ~/.ondemand/homedir/.aliases # hack to avoid duplicating ~/.bashrc content, prepend for better compatibility with fish shell - you can manually edit 

# Install and sync (OD version of) bat
wget https://github.com/sharkdp/bat/releases/download/v0.15.4/bat-v0.15.4-x86_64-unknown-linux-musl.tar.gz -O - | tar -xzvf - -C ~/.ondemand/homedir/bin --strip=1

# Fix bat's PHP issues

## Fix syntax highlighting if file doesn't start at top
## LINK: https://github.com/dandavison/delta/issues/162#issuecomment-625952288
mkdir -p ~/.config/bat/syntaxes
wget https://gist.githubusercontent.com/dasl-/9ea0d83cd478f36f6c7deaa737480492/raw/d2276cb45a41180304d7ad8b287b17c948c4d8a0/PHP.sublime-syntax -O ~/.config/bat/syntaxes/PHP.sublime-syntax

## Tweak theme to better recognize methods when syntax highlighting
## LINK: https://github.com/dandavison/delta/issues/162#issuecomment-626078327
mkdir -p ~/.config/bat/themes
wget "https://gist.githubusercontent.com/dasl-/255b183383bd412356d347c61d77181d/raw/4b4b41dfc1d705f13d40244c7fcf420c70a31d86/Monokai%2520(SL).tmTheme" -O ~/.config/bat/themes/MonokaiSL.tmTheme

## Apply fixes
brew install bat # Install bat locally so we can rebuild the cache
bat cache --build

## Sync fixes to OD
mkdir -p ~/.ondemand/homedir/.config
ln -hsf ~/.config/bat ~/.ondemand/homedir/.config/bat
mkdir -p ~/.ondemand/homedir/.cache
ln -hsf ~/.cache/bat ~/.ondemand/homedir/.cache/bat

# Install and sync (OD version of) delta
wget https://github.com/dandavison/delta/releases/download/0.3.0/delta-0.3.0-x86_64-unknown-linux-musl.tar.gz -O - | tar -xzvf - -C ~/.ondemand/homedir/bin --strip=1

## Use delta for anything diff-related
touch ~/.ondemand/homedir/.hgrc
echo -e "[ui]\nusername = $(id -F) <$(id -un)@fb.com>\n[pager]\npager = BAT_PAGER='less -FrKX' delta" >> ~/.ondemand/homedir/.hgrc

## Apply nice defaults and use tweaked theme
touch ~/.ondemand/homedir/.gitconfig
echo -e '[delta]\n  line-numbers = true\n  side-by-side = true\n  syntax-theme = MonokaiSL' >> ~/.ondemand/homedir/.gitconfig

