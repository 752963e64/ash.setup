# /etc/profile.d/**ashrc.sh

ssh-agent.start() {
  eval "$(ssh-agent)"
}


ed25519() {
  ssh-keygen -t ed25519 -C "$1"
  # should check if ssh-agent is running...
  # strange problem ssh-agent vanish from user control when started
  # with hidepid=2, it still show the right user in process list viewed by root. 
  ssh-add ~/.ssh/id_ed25519
  cat ~/.ssh/id_ed25519.pub
}

# Open bar.
chmod.fixup()
{
  for i in $(find . -type d); do chmod -v og+rx "$i"; done
  for i in $(find . -type f); do chmod -v og+r "$i"; done
}


find.file.exec()
{
  # this aint bb find.
  for i in $(find . -type f -executable); do echo "$i"; done
}

urlencode() {
  # urlencode <string>
  # https://gist.github.com/cdown/1163649
  # modified for ash by 752963e64 - 22/11/2024
  local length=$((${#1}-1))
  i=0; while [ $i -le $length ]; do
    local c="${1:$i:1}"
    case $c in
      [a-zA-Z0-9.~_-]) printf '%s' "$c" ;;
      *) printf '%%%02X' "'$c" ;;
    esac
    i=$((++i))
  done
}

urldecode() {
  # urldecode <string>
  # https://gist.github.com/cdown/1163649
  local url_encoded="${1//+/ }"
  printf '%b' "${url_encoded//%/\\x}"
}

shellcheck() {
  [ -f "$1" ] && curl -d script=$(urlencode "$(cat $1)") https://www.shellcheck.net/shellcheck.php | jq '.[] | .code,.message'
}

host.io()
{
  [ "$1" ] && { curl "https://host.io/api/full/${1}?token=YOURTOKEN"; }
}

# write format for todos and notices simply.
write()
{
  local DEST=~/$1.txt
  if [ "$2" != '' ]; then
    if [[ "$2" == 'edit' && "$3" == '' ]]; then
      vi "$DEST"
      return
    fi
    local about="$2"
    local message="$3"
    echo -e "  \e[00;37m$(date +'%d/%m/%Y-%H:%M:%S'): \e[00;33m>> \e[01;33m${about}\e[00;33m <<\e[0m" >> $DEST
    local IFS=$'\n'
    for i in ${message}; do
      echo -en "\t" >> $DEST
      echo "$i" >> $DEST
    done
  fi

  cat $DEST
}

# shows up your todos & notices each times you open up a shell.                                                                         
[ -f ~/.todo.txt ] && { cat ~/.todo.txt; }
# [ -f ~/.notice.txt ] && { cat ~/.notice.txt; }


# user defined ashrc.          
[ -f ~/.ashrc ] && . ~/.ashrc

# protect user environ from stealthy mutation
# for i in $(find /home -type d); do
#  chmod -v og-wx "$i/.ashrc"
#  chown root:root "$i/.ashrc"
# done

