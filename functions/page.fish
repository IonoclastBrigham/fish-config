function page --description 'View output from the specified command'
	set -l pager
	if not test -z (which less)
		set pager less
	else
		set pager more
	end
	eval $argv | eval $pager
	set -e pager

end
