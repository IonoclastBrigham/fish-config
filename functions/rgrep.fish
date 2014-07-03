function rgrep --description 'Recursive grep'
	if test (count $argv) = 1
grep -r $argv .
else
grep -r $argv
end

end
