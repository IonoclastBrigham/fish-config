function pull --description 'shortcut for git pull --rebase'
	git pull --rebase $argv
    set -l EXIT $status
    and if test -f .gitmodules
        read -l -p __pull_prompt response
        if [ $response = y -o $response = Y -o -z $response ]
	        git submodule update
            set EXIT $status
        end
    end
    return $EXIT
end
