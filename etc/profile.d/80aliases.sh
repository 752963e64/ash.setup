# /etc/profile.d/**aliases.sh
# system wide alias
alias ls='ls --color'
alias l='ls -alsh'
alias mv='mv -v'
alias rm='rm -v'
alias chmod='chmod -v'
alias chown='chown -v'
alias ..='cd ..'
alias ashrc='vi ~/.ashrc && . ~/.ashrc'
alias aliases='vi ~/.aliases && . ~/.aliases'

if [ "$USER" = root ]; then
  alias mount='mount -v'
  alias umount='umount -v'
  alias remount.ro='mount -o remount,ro'
  alias remount.rw='mount -o remount,rw'
  alias apk.update='apk update'
  alias apk.upgrade='remount.rw && apk upgrade && remount.ro'
fi

# load user defined aliases.
[ -f ~/.aliases ] && . ~/.aliases
