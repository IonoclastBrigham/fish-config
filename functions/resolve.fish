function resolve --description 'resolve, commit'
	ti state $argv[1] resolved
    echo "
Resolves issue: " $argv[1] > ~/.ticgit_commit_tmp
    set TMPL (git config commit.template)
    git config commit.template ~/.ticgit_commit_tmp
    git commit
    if test -n "$TMPL"
	    git config commit.template "$TMPL"
    else
    	git config --unset commit.template
    end
    set -e TMPL
end
