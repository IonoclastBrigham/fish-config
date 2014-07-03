function pgrep --description 'List process info by executable name'
	ps aux | grep -v grep | grep -i $argv
end
