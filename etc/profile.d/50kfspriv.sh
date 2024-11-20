# /etc/profile.d/**kfspriv.sh

[ $USER = 'root' ] && {

  function kfs.fixup()
  {
    chmod o-rwx /sys /proc
    touch /tmp/.kfs.ok
  }

  # per boot
  [ -f /tmp/.kfs.ok ] || kfs.fixup
  unset -f kfs.fixup

}
