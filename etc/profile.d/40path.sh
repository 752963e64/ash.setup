# /etc/profile.d/**path.sh
# prepend ~/bin path to PATH evironment

if [ -d ~/bin ]; then
  export PATH=~/bin:$PATH
fi
