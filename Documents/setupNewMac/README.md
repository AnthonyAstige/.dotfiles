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

## [Volta](https://github.com/volta-cli/volta)

## [NeoVim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

`brew install neovim`

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

### [Fix Tern Errror](https://github.com/ternjs/tern_for_vim/issues/88#issuecomment-122641054)

`cd ~/.vim/bundle/tern_for_vim && npm install`

## [FZF](https://github.com/junegunn/fzf)

`brew install fzf`

### [FZF completion misc]

`git clone https://github.com/junegunn/fzf.git ~/.fzf`

### TypeScript Server

`vim` >> `:CocInstall coc-tsserver`

## [Witch Mouse ignore](https://manytricks.com/osticket/kb/faq.php?id=109)

## iTerm2 Setup

### Solarized Dark

iTerm2 >> Preferences >> Profiles >> Colors >> Color Presets... >> Solarized Dark

### [Open links in vim](https://tosbourn.com/iterm2-open-files-paths-in-vim/)
iTerm2 >> Preferences >> Profiles >> Advanced >> Under Semantic History select “Run coprocess…” and enter `echo vim \1`


## [RIPGrep](https://github.com/BurntSushi/ripgrep#installation)

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
