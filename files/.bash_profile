function parse_git_branch {
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}

export PS1="\[\033[0;32m\]\h:\W \[\033[0m\]\$(parse_git_branch)\[\033[0;32m\]$\[\033[0m\] "
export PATH=$PATH:$HOME/bin
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

if [ -f $HOME/.bash_profile.local ]; then
    source $HOME/.bash_profile.local
fi
