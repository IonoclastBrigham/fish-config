function __pull_prompt
	echo -n 'Update submodules? ['
    set_color --bold green
    echo -n Y
    set_color normal
    echo -n /
    set_color red
    echo -n n
    set_color normal
    echo -n ']: '
end
