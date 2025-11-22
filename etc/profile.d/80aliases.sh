# /etc/profile.d/**aliases.sh
# system wide alias
alias ls='ls --color'
alias l='ls -alsh'
alias mv='mv -v'
alias rm='rm -v'
alias chmod='chmod -v'
alias chown='chown -v'
alias mount='mount -v'
alias umount='umount -v'
alias remount.ro='mount -o remount,ro'
alias remount.rw='mount -o remount,rw'

alias ..='cd ..'
alias ashrc='vi ~/.ashrc && . ~/.ashrc'
alias aliases='vi ~/.aliases && . ~/.aliases'

# load user defined aliases.
[ -f ~/.aliases ] && . ~/.aliases
