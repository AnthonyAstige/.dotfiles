# This .dotfiles repository

Setup from [A simpler way to manage your dotfiles](https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles.html)

1. Basic clone overwrite
	1. `git clone --separate-git-dir=$HOME/.dotfiles git@github.com:AnthonyAstige/.dotfiles.git tmpdotfiles`
	1. `rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/`
	1. `rm -r tmpdotfiles`
1. Make it show up and work
	1. [Set Bash as default shell](https://support.apple.com/en-us/HT208050) (all my scripts are based on bash ; before MacOS switched to zsh default)
	1. Restart shell for `.bash_profile` to load (which includes `.bash_rc`)
	1. Install misc below as needed to fix things, proactively, etc.
1. Hide untracked files
	1. `dotfiles config --local status.showUntrackedFiles no`

# Licences
    See `~/Documents/setupNewMacLicences` (copy them over manually as not placed in public repository)

# Misc

## [Brew](https://brew.sh/)


### Personal computer

Install in default directory for faster installs (less recompiles)

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

### Corperate computer

Install under home folder (less conflicts with autoconfigs)

```
git clone https://github.com/Homebrew/brew ~/homebrew
brew update
```

## [NeoVim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

`brew install neovim`

### Python 3 Support

`brew install python`

`python3 -m pip install --user --upgrade pynvim`

Note: You may get some errors. Follow instructions to cleanup and make brew's version take over.

### YCM Support

[YCM install instructions](https://github.com/ycm-core/YouCompleteMe#quick-start-installing-all-completers) for details, though these simple steps seemed to work for new 2022 work macbook

1. `brew install cmake python go nodejs`
2. `cd ~/.vim/bundle/YouCompleteMe && python3 install.py --all`

### Airline font support, may need to do these things

1. [Install power-line fonts](https://github.com/powerline/fonts#quick-installation)
```
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
```
1. iTerm2 issues: [Configure to a powerline font](https://github.com/powerline/fonts/issues/44)

## [FZF](https://github.com/junegunn/fzf)

`brew install fzf`

### [FZF completion misc]

`git clone https://github.com/junegunn/fzf.git ~/.fzf`

### [Vundle for VIM](https://github.com/VundleVim/Vundle.vim)

`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

### Install all the plugins

`vim` >> `:PluginInstall`

## [Nodenv](https://github.com/nodenv/nodenv#installation)

## [Witch Mouse ignore](https://manytricks.com/osticket/kb/faq.php?id=109)

## iTerm2 Setup

### Solarized Dark

iTerm2 >> Preferences >> Profiles >> Colors >> Color Presets... >> Solarized Dark

### [Open links in vim](https://tosbourn.com/iterm2-open-files-paths-in-vim/)
iTerm2 >> Preferences >> Profiles >> Advanced >> Under Semantic History select “Run coprocess…” and enter `echo vim \1`


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
    1. Manually sync styles
1. Install [tampermonkey](https://www.tampermonkey.net/)
    1. Manually sync scripts 

## Mac preference hacking

1. Disable power chime sound (sound made when plugging in regardless of if headphones plugged in and I think volume)
    1. `~/bin/no-chime`

## SnagIt

Manually copy configuration

## VSCode

1. Find wherever `settings.json` and `keybindings.json` are on old system (`find ~/ settings.json 2>/dev/null` ...), and copy they over manually (backing up existing)
    1. Custom for Meta base, didn't want in repo
1. Install plugins
    1. At time of writting (Sept '22) VIM (`vscodevim`) is the only one 

# System Preferences

	1. Keyboard
        1. Microsoft Wireless Optical Desktop 2.20 [My old school curve keyboard]
            1. Swap Option & Command keys as needed
	1. Shortcuts [Note: Leave defaults where possible for using other's systems]
        1. Mission Control
            1. Show Desktop: Option-D [Why: F11 default doesn't exist with touch bar]
