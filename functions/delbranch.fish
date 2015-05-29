function delbranch --description 'Delete local branch an its remote.'
	if test (count $argv) != 1
		echo "Usage:"
		echo "    delbranch <LOCAL_BRANCH>"
		return 1
	end

	set -l BRANCH $argv[1]
	set -l REMOTE (git remote show origin|grep "$BRANCH *pushes to "|awk -F ' ' '{print $4}')

	branch --delete $BRANCH
	or return 1
	if [ -n "$REMOTE" ]
		push origin ":$REMOTE"
		or return 1
	end
end
