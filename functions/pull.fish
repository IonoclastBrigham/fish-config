function pull --description 'shortcut for git pull --rebase'
	git pull --rebase $argv
    and if test -f .gitmodules
        read -l -p __pull_prompt response
        if [ $response = y -o $response = Y -o -z $response ]
	        git submodule update
        end
    end
end
