function rgrep --description 'Recursive grep'
	if test (count $argv) = 1
		grep --color=auto -r $argv .
	else
		grep --color=auto -r $argv
	end
end
