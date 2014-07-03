# sudo.fish
# Completion for sudo
# modified by Brigham Toskin <brigham@acm.org>

#######################
# Util Functions

function __fish_sudo_accept_args --description 'Test for exclusive flags'
	 for i in (commandline -o)
	     if contains -- $i -h -v -V
	     	return 1
	     end
	 end
	 return 0 # true, in shell land
end

function __fish_sudo_no_args --description "Test if there's no arguments or options specified"
	 if test -z $argv[1]
	    return 0 # true, in shell land
	 else
	    return 1
	 end
end
	     

######################
# Option completions

complete -c sudo -As h -n "__fish_sudo_no_args" --description "Display help and exit"
complete -c sudo -As v -n "__fish_sudo_no_args" --description "Re-Validate privs"
complete -c sudo -As V -n "__fish_sudo_no_args" --description "Print version info and exit"

complete -c sudo -n "__fish_sudo_accept_args" -s b --description 'Run specified command in the background'
complete -c sudo -n "__fish_sudo_accept_args" -s E --description 'Preserve environment'
complete -c sudo -n "__fish_sudo_accept_args" -s e -rAa '(__fish_complete_suffix)' --description 'Edit a file instead of running a command'
complete -c sudo -n "__fish_sudo_accept_args" -s s --description 'Invoke a new shell'
complete -c sudo -n "__fish_sudo_accept_args" -s u -xa '(__fish_complete_users)' --description 'Run command as alternative user'

#########################
# Subcommand completions

complete -c sudo -n "__fish_sudo_accept_args" -xa '(__fish_complete_subcommand_root)' --description "Command to run"

# Since sudo runs subcommands, it can accept any switches
complete -c sudo -n "__fish_sudo_accept_args" -u
