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

GREP_COLORS="ms=01;31:mc=01;31:sl=:cx=:fn=1;33:ln=32:bn=32:se=36"

LS_COLORS="*.h=01;30:*.c=00;33:*.md=00;32:*.txt=00;37:*.sh=00;37:\
*.lua=38;5;14:*.a=01;31:*.o=01;33:*.so=01;93:*.zip=01;31:*.7zip=01;31:\
*.7z=01;31:*.xz=01;31:*.bz=01;31:*.gz=01;31:*.tar.*=01;31:*.webm=01;36:\
*.avi=01;36:*.mp4=01;36:*.wmv=01;36:*.mkv=01;36:*.flv=01;36:*.mp3=01;36:\
*.wav=01;36:*.wma=01;36:*.jpg=01;35:*.jpeg=01;35:*.png=01;35:*.gif=01;35:\
*.tiff=01;35:"

GCC_COLORS="error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"

export GREP_COLORS LS_COLORS GCC_COLORS


# load user defined ashrc.
[ -f ~/.ashrc ] && . ~/.ashrc

