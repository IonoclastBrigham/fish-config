set -x ANDROIDROOT /usr/local/bin/android
set -x GOROOT /usr/local/go
set -x GOPATH /Users/prime/Code/gocode
set -x PATH (for p in $PATH /opt/local/bin /opt/local/sbin $ANDROIDROOT/ndk $ANDROIDROOT/tools $ANDROIDROOT/platform-tools $GOROOT/bin $GOPATH/bin; echo $p; end | uniq)

set -x EDITOR (which emacs)

echo
fortune
echo
