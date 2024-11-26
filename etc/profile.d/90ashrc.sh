# /etc/profile.d/**ashrc.sh

ed25519() {
  ssh-keygen -t ed25519 -C "$1"
  # should check if ssh-agent is running...
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

# find and load ~/.ashrc
[ -f ~/.ashrc ] && . ~/.ashrc

# protect user environ from stealthy mutation
for i in $(find /home -type d); do
  chmod -v og-wx "$i/.ashrc"
  chown root:root "$i/.ashrc"
done
