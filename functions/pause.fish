function pause --description 'Wait for user to press a key.'
	function usage
		echo 'pause - Wait for user input.'
		echo 'Usage: pause [-p [PROMPT]]'
	end
	set args (count $argv)
	if test $args -gt 0
		if test $argv[1] != '-p' -o $args -gt 2
			usage >& 2
			return 1
		end
		if test $args -eq 1
			echo -n Press any key to continue...
		else
			echo -n $argv[2]
		end
	end
	bash -e read -s -n1
	echo
end
