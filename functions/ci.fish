function ci --description 'shortcut for git commit -aS'
	set -lx GPG_TTY (tty)
	git commit -S -a $argv
end
