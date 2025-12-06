# /etc/profile.d/**ashrc.sh

# root only
if [ "$USER" = root ]; then

fi

doas()
{
  [[ "$1" ]] || return 1
  local args="$@"
  /bin/su - -c "$args"
}

# load user defined ashrc.
[ -f ~/.ashrc ] && . ~/.ashrc

