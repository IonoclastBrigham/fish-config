function newbranch --description 'Checks out a new branch and pushes it to a new remote.'
	if test (count $argv) != 1
		echo "Usage:"
		echo "    newbranch <BRANCH>"
		return 1
	end

	set BRANCH $argv[1]

	pull
	or return 1
	co -b $BRANCH
	or return 1
	push -u origin $BRANCH:brig-$BRANCH
	or return 1
end
