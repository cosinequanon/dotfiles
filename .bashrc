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

# set defaults
export EDITOR="/usr/bin/vim"
export PAGER="/usr/bin/less"

# aliases
if [[ -f ~/.bash_aliases ]]; then
    source ~/.bash_aliases
fi

# custom for machine
if [[ -f ~/.bash_custom ]]; then
    source ~/.bash_custom
fi

# git completion
if [[ -f ~/.git-completion.bash && -f ~/.git-prompt.sh ]]; then
    source ~/.git-completion.bash
    source ~/.git-prompt.sh
    export PS1='[\w$(__git_ps1 "|%s")]\$ '
fi

# functions
mkdirdate() { 
    DIR_NAME=$(date +'%Y-%m-%d')-"$1"
    mkdir ${DIR_NAME}
    cd ${DIR_NAME}
}

mkdircd() {
    DIR_NAME="$1"
    mkdir -p ${DIR_NAME}
    cd ${DIR_NAME}
}

gr() { cd $(git root); }

# move the last downloaded file somewhere
mvlastdl() {
    SEARCH_DIR="${HOME}/Downloads"
    MV_DIR=${1:-.}
    LAST_FILE="$(ls -t ${SEARCH_DIR} | head -1)"
    if [[ ${LAST_FILE} == *download ]]; then
        echo "File is still downloading, wait a bit"
        exit
    else
        echo ${SEARCH_DIR}/${LAST_FILE} ${MV_DIR}
        mv -- "${SEARCH_DIR}/${LAST_FILE}" ${MV_DIR}
    fi
}


# platform specific things
UNAME=$(uname)
LINUX="Linux"

if [ ${UNAME} = ${LINUX} ]; then
    xmodmap ~/.speedswapper
fi
