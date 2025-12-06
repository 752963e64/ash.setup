# /etc/profile.d/**aliases.sh
# system wide alias
alias ls='ls --color'
alias grep='grep --color'
alias l='ls -alsh'
alias mv='mv -v'
alias rm='rm -v'
alias chmod='chmod -v'
alias chown='chown -v'
alias ..='cd ..'

alias ashrc='vi ~/.ashrc && . ~/.ashrc'
alias aliases='vi ~/.aliases && . ~/.aliases'

if [ -x /usr/bin/git ]; then
  alias git.status='git status'
  alias git.show='git show'
  alias git.diff='git diff'
  alias git.push='git push'
  alias git.add='git add'
  alias git.log='git log'
  alias git.commit='git commit -m'
  alias git.branch='git branch'
  alias git.reset='git reset'
  alias git.mv='git mv'
  alias git.rm='git rm'
fi

# load user defined aliases.
[ -f ~/.aliases ] && . ~/.aliases
