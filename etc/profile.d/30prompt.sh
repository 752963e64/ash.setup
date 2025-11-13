# /etc/profile.d/**color_prompt.sh
# Setup a red prompt for root and a green one for users.

if [ "$USER" = root ]; then
	_color=$'\e[0;91m'
	_symbol='#'
else
	_color=$'\e[0;92m'
	_symbol='$'
fi

PS1="\[\e]0;\u@\h: \w\a\]\[\e[1;94m\]┌──\[\e[1;94m\](\[$_color\]\u\["
PS1="${PS1}\e[0;94m\]@\[\e[0;93m\]\h\[\e[1;94m\])\[\e[0;94m\]-\["
PS1="${PS1}\e[1;94m\][\[\e[0;92m\]\w\[\e[1;94m\]]\n\[\e[1;94m\]"
PS1="${PS1}└─\[$_color\] $_symbol \[\e[0m\]"
unset _color _symbol

