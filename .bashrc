# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ls='ls -G'
alias ll='ls -lFG'
alias la='ls -AG'
alias l='ls -CFG'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Enable git completion
# * https://apple.stackexchange.com/a/243276
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Some aliases -Anthony Mar 27 2015
# * This vi alias doesn't seem to do anything?
# TODO: Remove this path stripping when YCM updates or remove nodeenv (https://github.com/Valloric/ycmd/issues/1050)
# TODO: * Path removal solution https://unix.stackexchange.com/a/108876
alias vi='PATH=$(echo "$PATH" | sed -e "s/\/Users\/.*\.nodenv[^:]*://") nvim'
alias vim='PATH=$(echo "$PATH" | sed -e "s/\/Users\/.*\.nodenv[^:]*://") nvim'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit -a"
alias gcam="git commit -am"
alias gb="git branch"
alias gp='git push'
alias gpp="git pull;git push"
alias gpmp="git pull;git merge origin/stage;git push;git status"
alias gl="git log"
alias swiftformat="/usr/local/bin/swiftformat --indent tab"

# From Ben @ BrightIdea Oct 18th 2017
# Note: Don't use pull upstream, learn more about rebase?
# alias gfsh='git fetch -p && git pull upstream bi/qa:bi/qa && git rebase --autostash bi/qa'
# Git push origin params force
# gpof() {
  #git push origin "$@" -f
# }

# NVim is editor of chocie -Anthony Jan 15 2018
export VISUAL=nvim
export EDITOR=nvim

# Git Prompt was geting too slow -- disabled 2018-10-19
# gitprompt configuration from https://github.com/magicmonty/bash-git-prompt
# GIT_PROMPT_ONLY_IN_REPO=1
# GIT_PROMPT_FETCH_REMOTE_STATUS=0 # uncomment to avoid fetching remote status
# GIT_PROMPT_THEME=Solarized       # use theme optimized for solarized color scheme
#GIT_PROMPT_START="\e]2;\w\a"     # Set window title to path http://goo.gl/w93zpL
# source ~/.bash-git-prompt/gitprompt.sh # Do it

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
    if [ -d "$HOME/bin/bi" ] ; then
        PATH="$HOME/bin/bi:$PATH"
    fi
fi

# set PATH so it includes commonwealth private bin if it exists
if [ -d "$HOME/.commonwealth/AnthonyAstige/bin" ] ; then
    PATH="$HOME/.commonwealth/AnthonyAstige/bin:$PATH"
fi

SWIFT_ROOT="/opt/swift-3.1.1-RELEASE-ubuntu16.04"
if [ -d "$SWIFT_ROOT" ] ; then
	export SWIFT_ROOT
	export PATH="$SWIFT_ROOT/usr/bin:$PATH"
	alias sw="swift"
fi

# Change directories, suppressing errors as this .bashrc is used on multiple systems
# cd ~/sites &>/dev/null
# cd ~/sites/exercise.astige.com &>/dev/null
# cd ~/sites/redux.play.loc &>/dev/null
# cd ~/sites/couples.loc &>/dev/null
# cd ~/sites/anthony.astige.com &>/dev/null

# Installing rg on Ubuntu 2017-12-02
## https://github.com/BurntSushi/ripgrep/issues/618#issuecomment-338351638
## https://github.com/BurntSushi/ripgrep/releases

# Stop <c-s> interpretation so can use in VIM
# https://stackoverflow.com/q/3446320/4747661
bind -r '\C-s'
stty -ixon

# Rouge
source ~/.rouge.bash

# FZF
## https://github.com/junegunn/fzf
## "If you use vi mode on bash, you need to add set -o vi before source ~/.fzf.bash in your .bashrc, so that it correctly sets up key bindings for vi mode."
set -o vi
# Loading for ubuntu works as single call here
source ~/.fzf.bash

# Fix npm run watch problems https://stackoverflow.com/a/48895989
export NODE_OPTIONS=--max_old_space_size=4096

# Connect to other macbook when on BI network
# if [ "$HOSTNAME" = "Anthonys-MacBook-Pro.local" ]; then
#     # Connect to my work macbook
#     echo "Connecting to my other laptop...timing out after 2 seconds"
#     ssh -o ConnectTimeout=2 anthonyastige@localanthony3.brightideadev.com
# fi

# Autocomplete things like `npm run awes` >> `npm run awesome"
# * Source: https://github.com/npm/npm/issues/8030#issuecomment-289137854
eval "`npm completion`"

# dotfiles like https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles.html
alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
