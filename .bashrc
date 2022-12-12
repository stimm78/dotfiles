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
export WLR_NO_HARDWARE_CURSORS=1
# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

function cdandls() {
  cd "$@" && ls;
}

# custom aliases

alias vim="lvim"
alias l="/bin/ls --group-directories-first --color=auto"
alias ls="/bin/ls --group-directories-first --color=auto"
alias ll="/bin/ls -lh --group-directories-first --color=auto"
alias la="/bin/ls -A --group-directories-first --color=auto"
alias lla="/bin/ls -lAh --group-directories-first --color=auto"
alias cd="cdandls"
alias d="sudo dnf upgrade && flatpak update"
unset rc
