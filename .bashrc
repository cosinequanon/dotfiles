# history
export HISTCONTROL=ignoreboth
export HISTSIZE=10000
export HISTFILESIZE=5000
shopt -s histappend
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# vi bindings
set -o vi
bind -m vi-command ".":insert-last-argument
bind -m vi-insert "\C-l.":clear-screen
bind -m vi-insert "\C-a.":beginning-of-line
bind -m vi-insert "\C-e.":end-of-line

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

