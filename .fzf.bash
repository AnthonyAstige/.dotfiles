# https://github.com/BurntSushi/ripgrep/issues/169#issuecomment-312450875
# https://github.com/BurntSushi/ripgrep/issues/169#issuecomment-333229762
if [[ $(uname) == "Darwin" ]]; then
	# dirname on OS X behaves funky, get gdirname via
	# brew install coreutils
	export dirname_command="gdirname"
else
	export dirname_command="dirname"
fi

# My config
# --files: List files that would be searched but do not search
# --hidden: Search hidden files and folders
# `git rev-parse --show-toplevel` : Search git repository always
# --follow: Follow symlinks
export FZF_DEFAULT_COMMAND='rg `git rev-parse --show-toplevel` --ignore-file ~/.bi-rg-ignore --files --hidden --follow'
export FZF_ALT_C_COMMAND='rg `git rev-parse --show-toplevel` --ignore-file ~/.bi-rg-ignore --files --hidden --follow --null --sort-files | xargs -0 $dirname_command | sort -u'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
# export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --null 2> /dev/null | xargs -0 dirname | uniq"
# https://github.com/BurntSushi/ripgrep/issues/169#issuecomment-333229762
if [[ $(uname) == "Darwin" ]]; then
	# dirname on OS X behaves funky, get gdirname via
	# brew install coreutils
	export dirname_command="gdirname"
else
	export dirname_command="dirname"
fi
_fzf_compgen_dir() {
	rg --hidden --files --ignore-file ~/.bi-rg-ignore --null "$1" 2>/dev/null | xargs -0 "$dirname_command" | awk '!h[$0]++'
}
# Preview commentes:
# * Don't parse binary
# * Remove extra info if there from oneliner searchers, colorize if possible otherwise simple
# * Keep some extra chars in case color signifiers?
export FZF_DEFAULT_OPTS="--preview "\
"'[[ \$(file --mime {}) =~ binary ]] && "\
"echo {} is binary || "\
"(rougify \$( cut -d ':' -f 1 <<< "{}" ) || cat \$( cut -d ':' -f 1 <<< "{}" )) 2> /dev/null "\
"| head -500' "\
"--height 80% "\
"--bind ctrl-f:page-down,ctrl-b:page-up"

# Basics setup fzf
# ---------
if [[ ! "$PATH" == *~/.fzf/bin* ]]; then
  export PATH="$PATH:~/.fzf/bin"
fi

# Auto-completion
# ---------------
source ~/.fzf/shell/completion.bash

# Key bindings
# ------------
# declare -x FZF_ALT_C_COMMAND="cd ~/; bfs -type d -nohidden | sed 's/^\\./\\/Users\\/anthony\\//'"
source ~/.fzf-key-bindings.bash
