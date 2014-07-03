function showlog --description 'Show git log for the given file, searching if needed.'
	if test -e $argv[1]
		set FILE $argv[1]
	else
		set FILE (find ~/Code/ninja -name $argv[1])
		if test -z $FILE
			echo Unable to find file $argv[1] >& 2
			return 1

		end
	end

	git log --name-status --summary --graph --objects -- $FILE
end
