#
# Completions for sshfs
#
# Fixed and expanded by Brigham Toskin <brigham@acm.org>

## TODO:
## fill in functions below
## revome that heinous host completion
## fix __fish_print_users to skip comment lines (and get all os x users)
## make conditional completions for user, host and mount
## completion for '~/' or '/' for remote path (not really useful, but documents)

# util functions
function __fish_sshfs_accept_user
end

function __fish_sshfs_accept_host
end

function __fish_sshfs_accept_mountp
end

function __fish_sshfs_accept_options
end

function __fish_sshfs_accept_mountoptions
end


# Host combinations, borrowed from ssh.fish
complete -x -c sshfs -d Hostname -a "

(__fish_print_hostnames):

(
       #Prepend any username specified in the completion to the hostname
       echo (commandline -ct)|sed -ne 's/\(.*@\).*/\1/p'
)(__fish_print_hostnames):

(__fish_print_users)@
"

#
# Mountpoint completion
#
complete -x -c sshfs --description "User" -a '(__fish_print_users)'
complete -x -c sshfs --description "Mount point" -a '(__fish_complete_directories)'

#
# Command options
#
complete -c sshfs -n '__fish_sshfs_accept_options' -s V --description "Display version and exit"
complete -c sshfs -n '__fish_sshfs_accept_options' -s p -x --description "Port"
complete -c sshfs -n '__fish_sshfs_accept_options' -s C --description "Compression"
complete -c sshfs -n '__fish_sshfs_accept_options' -s d --description "Enable debug"
complete -c sshfs -n '__fish_sshfs_accept_options' -s f --description "Foreground operation"
complete -c sshfs -n '__fish_sshfs_accept_options' -s s --description "Disable multi-threaded operation"
complete -c sshfs -n '__fish_sshfs_accept_options' -s r --description "Mount options"
complete -c sshfs -n '__fish_sshfs_accept_options' -s h --description "Display help and exit"

complete -c sshfs -s o -x --description "Mount options"
complete -c sshfs -n '__fish_sshfs_accept_mountoptions' -Aa reconnect -d "Reconnect to server"
