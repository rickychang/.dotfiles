function parse_git_branch {
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\h:\W \$(parse_git_branch)$ "
export PATH=$PATH:$HOME/bin
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

if [ -f $HOME/.bash_profile.local ]; then
    source $HOME/.bash_profile.local
fi
