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
  # firewall.
  ##############################################
  # netfilter arptables arp
  alias arptables.list='arptables -nvL'
  alias arptables.restore='arptables-restore < /etc/arptables'
  alias arptables.save='arptables-save > /etc/arptables'
  # restore and save the given file
  alias arptables.restore.this='arptables-restore <'
  alias arptables.save.this='arptables-save >'
  ###############################################
  # netfilter iptables ipv4
  alias iptables.raw.list='iptables -t raw -nvL'
  alias iptables.nat.list='iptables -t nat -nvL'
  alias iptables.filter.list='iptables -t filter -nvL'
  
  alias iptables.restore.rules='iptables-restore < /etc/iptables/rules-save'
  
  alias iptables.save.rules='iptables -t raw -Z &&
  iptables-save -t raw > /etc/iptables/rules-save &&
  iptables -t filter -Z &&
  iptables-save -t filter >> /etc/iptables/rules-save &&
  iptables -t nat -Z &&
  iptables-save -t nat >> /etc/iptables/rules-save'
  
  # restore and save the given file
  alias iptables.restore.this='iptables-restore <'
  alias iptables.save.this='iptables-save >'
  ###############################################
  # netfilter ip6tables ipv6
  alias ip6tables.raw.list='ip6tables -t raw -nvL'
  alias ip6tables.filter.list='ip6tables -t filter -nvL'
  alias ip6tables.nat.list='ip6tables -t nat -nvL'

  alias ip6tables.restore.rules='ip6tables-restore < /etc/ip6tables'

  alias ip6tables.save.rules='ip6tables-save > /etc/ip6tables
  ip6tables-save -t raw > /etc/iptables/rules6-save &&
  ip6tables -t filter -Z &&
  ip6tables-save -t filter >> /etc/iptables/rules6-save &&
  ip6tables -t nat -Z &&
  ip6tables-save -t nat >> /etc/iptables/rules6-save'

  # restore and save the given file
  alias ip6tables.restore.this='ip6tables-restore <'
  alias ip6tables.save.this='ip6tables-save >'
  ###############################################
  # netfilter ebtables bridge
  alias ebtables.list='ebtables -vL'
  alias ebtables.restore='ebtables-restore < /etc/ebtables'
  alias ebtables.save='ebtables-save > /etc/ebtables'
  # restore and save the given file
  alias ebtables.restore.this='ebtables-restore <'
  alias ebtables.save.this='ebtables-save >'
fi

if [ -x /usr/bin/git ]; then
  alias git.status='git status'
  alias git.show='git show'
  alias git.diff='git diff'
  alias git.push='git push'
  alias git.add='git add'
  alias git.log='git log'
  alias git.commit='git commit -m'
  alias git.branch='git branch'
fi

# load user defined aliases.
[ -f ~/.aliases ] && . ~/.aliases
