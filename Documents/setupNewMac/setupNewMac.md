This .dotfiles repository
	git clone git@github.com:AnthonyAstige/.dotfiles.git ~/.dotfiles
	# If really needed: git clone https://github.com/AnthonyAstige/.dotfiles.git ~/.dotfiles

Misc
	# [Brew](https://brew.sh/)
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

	# [FZF](https://github.com/junegunn/fzf)
	brew install fzf

        # [FZF completion misc]
        git clone https://github.com/junegunn/fzf.git ~/.fzf

	# [NeoVim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
	brew install neovim

        # [Vundle for VIM](https://github.com/VundleVim/Vundle.vim)
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

            # Install all the plugins
            vim >> :PluginInstall

    # [Nodenv](https://github.com/nodenv/nodenv#installation)

    # [Witch Mouse ignore](https://manytricks.com/osticket/kb/faq.php?id=109)

    # iTerm2: Solarized Dark
        iTerm2 >> Preferences >> Profiles >> Colors >> Color Presets... >> Solarized Dark

    # [RIPGrep](https://github.com/BurntSushi/ripgrep#installation)

    # [USB Overdrive](http://www.usboverdrive.com/USBOverdrive/Download.html)
        Install from file in this folder or download above
        Any Mouse, Any Application
            >> Disable Speed
            >> Disable Accelleration


System Preferences
	Keyboard
		Keyboard
			Microsoft Wireless Optical Desktop 2.20 [My old school curve keyboard]
				Swap Option & Command keys as needed
		Shortcuts [Note: Leave defaults where possible for using other's systems]
			Mission Control
				Show Desktop: Option-D [Why: F11 default doesn't exist with touch bar]
