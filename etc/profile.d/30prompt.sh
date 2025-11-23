# /etc/profile.d/**color_prompt.sh
# Setup a red prompt for root and a green one for users.

if [ "$USER" = root ]; then
  _color="1"
  _symbol="#"
fi

PS1="\[\e]0;\u@\h: \w\a\]\[\e[1;94m\]┌──\[\e[1;94m\](\[\e[1;9${_color:-2}m\]\u\["
PS1="${PS1}\e[1;94m\]@\[\e[1;96m\]\h\[\e[1;94m\])\[\e[1;94m\]-\["
PS1="${PS1}\e[1;94m\][\[\e[0;92m\]\w\[\e[1;94m\]]\n\[\e[1;94m\]"
PS1="${PS1}└─\[\e[0;9${_color:-2}m\] ${_symbol:-$} \[\e[0m\]"
unset _color _symbol

