function mergeto --description 'Merges the current branch to the specified target.'
	set BRANCH (git rev-parse --abbrev-ref HEAD)
	and push
	and co $argv
	and git merge --ff-only $BRANCH

end
