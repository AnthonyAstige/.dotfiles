# This .dotfiles repository

Setup from [A simpler way to manage your dotfiles](https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles.html)
	1. Basic clone overwrite
		1. `git clone --separate-git-dir=$HOME/.dotfiles git@github.com:AnthonyAstige/.dotfiles.git tmpdotfiles`
		1. `rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/`
		1. `rm -r tmpdotfiles`
	1. Hide untracked files
		1. `dotfiles config --local status.showUntrackedFiles no`

# Licences
    See ~/Documents/setupNewMacLicences (copy them over manually as not placed in public repository)

# Misc

## [Brew](https://brew.sh/)

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## [NeoVim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

brew install neovim

## [FZF](https://github.com/junegunn/fzf)

brew install fzf

### [FZF completion misc]

git clone https://github.com/junegunn/fzf.git ~/.fzf

### [Vundle for VIM](https://github.com/VundleVim/Vundle.vim)

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

### Install all the plugins

vim >> :PluginInstall

## [Nodenv](https://github.com/nodenv/nodenv#installation)

## [Witch Mouse ignore](https://manytricks.com/osticket/kb/faq.php?id=109)

## iTerm2: Solarized Dark

iTerm2 >> Preferences >> Profiles >> Colors >> Color Presets... >> Solarized Dark

## [RIPGrep](https://github.com/BurntSushi/ripgrep#installation)

## [USB Overdrive](http://www.usboverdrive.com/USBOverdrive/Download.html)

    1. Install from file in this folder or download above
    1. Any Mouse, Any Application
        1. >> Disable Speed
        1. >> Disable Accelleration

## [Rouge](https://github.com/jneen/rouge)
    git clone https://github.com/jneen/rouge ~/.rouge

## Chrome

1. Install [stylebot](https://chrome.google.com/webstore/detail/stylebot/oiaejidbmkiecgbjeifoejpgmdaleoha)
    1. Import custom rules: `{"https://trello.com/":{"_enabled":true,"_rules":{".content-all-boards > div > .boards-page-board-section":{"display":"none"},".window-overlay":{"background-color":"rgba(0,0,0,.98)"},"[data-test-id=header-notifications-button]":{"display":"none"}}},"*":{"_enabled":false,"_rules":{}}}`

## Mac preference hacking

1. Disable power chime sound (sound made when plugging in regardless of if headphones plugged in and I think volume)

    https://apple.stackexchange.com/a/309947

    > defaults write com.apple.PowerChime ChimeOnNoHardware -bool true
    > killall PowerChime

## Jing

# System Preferences

	1. Keyboard
        1. Microsoft Wireless Optical Desktop 2.20 [My old school curve keyboard]
            1. Swap Option & Command keys as needed
	1. Shortcuts [Note: Leave defaults where possible for using other's systems]
        1. Mission Control
            1. Show Desktop: Option-D [Why: F11 default doesn't exist with touch bar]
