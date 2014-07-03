function currentbranch --description 'Print the current working git branch.'
	git rev-parse --abbrev-ref HEAD ^ /dev/null
end
