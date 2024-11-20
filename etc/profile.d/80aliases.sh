# /etc/profile.d/**aliases.sh
# system wide alias
alias l='ls -alsh'
alias mv='mv -v'
alias ..='cd ..'

# user defined aliases.
[ -f ~/.aliases ] && . ~/.aliases
