# history
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=5000

# aliases
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# custom for machine
if [ -f ~/.bash_custom ]; then
    source ~/.bash_custom
fi

# git completion
if [ -z ~/.git-completeion.bash ]; then
    . ~/.git-completion.bash
    export PS1='[\w$(__git_ps1 "|%s")]\$ '
fi

export EDITOR="/usr/bin/vim"
export PAGER="/usr/bin/less"

mkdirdate() { mkdir $(date +'%Y-%m-%d')-"$1"; }

