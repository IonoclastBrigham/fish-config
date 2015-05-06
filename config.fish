if test -z $rvm_bin_path
    exec bash --login -c "exec fish"
end

set -x ANDROIDROOT /usr/local/bin/android
set -x ANDROID_HOME $ANDROIDROOT
set -x NDK_ROOT $ANDROIDROOT/ndk
set -x GOROOT /usr/local/go
set -x GOPATH /Users/prime/Code/gocode
set -x PATH (for p in $PATH /opt/local/bin /opt/local/sbin $ANDROIDROOT $ANDROIDROOT/tools $ANDROIDROOT/platform-tools $NDK_ROOT $GOROOT/bin $GOPATH/bin; echo $p; end | sort | uniq)

set -x EDITOR (which emacs)

set -x GPG_TTY (tty)
if test -z (pgrep gpg-agent)
	# cache gpg password for 1 day
	gpg-agent --daemon --default-cache-ttl=86400 --max-cache-ttl=86400 --write-env-file > /dev/null
	while test ! -f ~/.gpg-agent-info; sleep 1; end
	# have to parse agent info, because it assumes sh/bash syntax
	set -Ux GPG_AGENT_INFO (cat ~/.gpg-agent-info | cut -d= -f2)
end

echo
fortune
echo
