# .bashrc
# bashrc is for aliases, functions, and shell configuration intended for use in
# interactive shells.  However, in some circumstances, bash sources bashrc even
# in non-interactive shells (e.g., when using scp), so it is standard practice
# to check for interactivity at the top of .bashrc and return immediately if
# the shell is not interactive.  The following line does that; don't remove it!
[[ $- != *i* ]] && return

# Load CentOS stuff and Facebook stuff (don't remove these lines).
source /etc/bashrc
source /usr/facebook/ops/rc/master.bashrc

# Keep oodles of command history (see https://fburl.com/bashhistory).
HISTFILESIZE=-1
HISTSIZE=1000000
shopt -s histappend

# Fix bin to executable with New OnDemand server connection (something changed in 2020 I think to remove all +x flags 🤷)
chmod +x /home/astige/bin/bat
chmod +x /home/astige/bin/delta
chmod +x /home/astige/bin/g
chmod +x /home/astige/bin/gbb
chmod +x /home/astige/bin/gsr
chmod +x /home/astige/bin/turbocharge_cli.sh
chmod +x /home/astige/bin/wcgrep

# Set up personal aliases, functions, etc.  See https://fburl.com/bash.
# ...(put your own stuff here!)...

