function log --description 'Shortcut for git log with nice options.'
	git log --name-status --objects --graph --summary $argv
end
