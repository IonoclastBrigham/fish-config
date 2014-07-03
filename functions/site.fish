function site --description Check\ that\ ionoclast.com\ doesn\'t\ give\ 403\ errors.
	if test -z (curl -s http://www.ionoclast.com/ | grep 403)
    echo "No error."
else
    echo "403 error!"
end
end
