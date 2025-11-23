# /etc/profile.d/**ashrc.sh

# root only
if [ "$USER" = root ]; then

fi

# load user defined ashrc.
[ -f ~/.ashrc ] && . ~/.ashrc

