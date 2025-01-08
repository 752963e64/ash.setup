# /etc/profile.d/**aliases.sh
# system wide alias
alias l='ls -alsh'
alias mv='mv -v'
alias ..='cd ..'
alias todo='write todo'
alias notice='write notice'

# user defined aliases.
[ -f ~/.aliases ] && . ~/.aliases
