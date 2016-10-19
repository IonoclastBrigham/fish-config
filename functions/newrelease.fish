function newrelease --description 'Bump version code of android project'
	if [ -z (st | grep "nothing to commit, working directory clean") ]
		echo 'Working directory dirty! Commit or stash first.'
		return
	end

	if [ ! (currentbranch) = develop ]
		echo "Please checkout the develop branch before continuing."
		return
	end
	
	set -l NEWVERSION (expr (cat app/build.gradle |grep 'versionCode'|awk '{ print $2 }') + 1)
	sed -i ''  "s/versionCode [0-9]*/versionCode $NEWVERSION/" app/build.gradle
	ci -m "Bumping version to $NEWVERSION"
	git tag "release$NEWVERSION"
	push; and push --tags
	mergeto master
	push
end
