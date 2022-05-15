# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi
#custom functions
function cdls() {
    builtin cd "$@" > /dev/null 2>&1 || /usr/bin/echo "no such directory '$@'"
    lscwd
}

function lscwd() {
    tot=$(/bin/ls -1 -f | wc -l)
    visible=$(/bin/ls -1 -U --color=never | wc -l)
    if [[ $tot -eq 2 ]]; then
        /bin/echo "This directory is empty"
    elif [[ $visible -eq 0 ]]; then
        ls -A
    else
        ls
    fi
}
# custom aliases

alias vim="nvim"
alias l="/bin/ls --group-directories-first --color=auto"
alias ls="/bin/ls --group-directories-first --color=auto"
alias ll="/bin/ls -lh --group-directories-first --color=auto"
alias la="/bin/ls -A --group-directories-first --color=auto"
alias lla="/bin/ls -lAh --group-directories-first --color=auto"
alias cd="cdls"
alias d="sudo dnf upgrade && flatpak update"
unset rc
alias config='/usr/bin/git --git-dir=/home/deventseng/.cfg/ --work-tree=/home/deventseng'
