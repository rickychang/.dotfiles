parse_git_branch () {

    while read -r branch; do
        [[ $branch = \** ]] && current_branch=${branch#* }
    done < <(git branch 2>/dev/null)

    [[ $current_branch ]] && printf ' [%s]' "$current_branch"

}

export PS1="\[\033[0;34m\]\h:\w\[\033[0m\]\$(parse_git_branch)\[\033[0;34m\]$\[\033[0m\] "
export PATH=/usr/local/bin/:$PATH:$HOME/bin
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

if [ -f $HOME/.bash_profile.local ]; then
    source $HOME/.bash_profile.local
fi
