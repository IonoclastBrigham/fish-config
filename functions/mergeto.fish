function mergeto --description 'Merges the current branch to the specified target.'
	set -lx GPG_TTY (tty)
	set BRANCH (git rev-parse --abbrev-ref HEAD)
	and push
	and co $argv
	and git merge -S --no-ff $BRANCH

end
