function mergefrom --description 'Merge from the given branch to the current one.'
	set BRANCH (git rev-parse --abbrev-ref HEAD)
	and co $argv
	and pull
	and co $BRANCH
	and git merge $argv

end
