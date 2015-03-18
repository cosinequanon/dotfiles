# General Bash
##############

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
export VISUAL="/usr/bin/vim"
export PAGER="/usr/bin/less"
export LESS="-R" # for color

# aliases
if [[ -f ~/.bash_aliases ]]; then
    source ~/.bash_aliases
fi

# custom for machine. this useful for things that are specific to work
if [[ -f ~/.bash_custom ]]; then
    source ~/.bash_custom
fi

# prompt for git/hg because that is what I use
if [[ -f ~/.scm_prompt ]]; then
    source ~/.scm_prompt
else
    export PS1='[\w]\$ '
fi

# Renv because I love R
if [[ -d $HOME/.Renv ]]; then
    export PATH="$HOME/.Renv/bin:$PATH"
    eval "$(Renv init -)"
fi

# Functions
###########

# make a directory appended with the date
mkdirdate() { 
    if [ -z "$1" ]; then
        echo "Please specify a directory name"
        return
    fi
    DIR_NAME=$(date +'%Y-%m-%d')-"$1"
    mkdir ${DIR_NAME}
    cd ${DIR_NAME}
}

# make a directory and cd into it
mkdircd() {
    DIR_NAME="$1"
    mkdir -p ${DIR_NAME}
    cd ${DIR_NAME}
}

# cd into the git root or noop
gr() {
    ROOT_DIR=$(git root)
    cd ${ROOT_DIR:-.}
}

# cd into the hg root or noop
hr() {
    ROOT_DIR=$(hg root)
    cd ${ROOT_DIR:-.}
}

# move the last downloaded file to a destination or the current dir
mvlastdl() {
    SEARCH_DIR="${HOME}/Downloads"
    MV_DIR=${1:-.}
    LAST_FILE="$(ls -t ${SEARCH_DIR} | head -1)"
    if [[ ${LAST_FILE} == *download ]]; then
        echo "File is still downloading, wait a bit"
        exit
    else
        echo "Moving" ${SEARCH_DIR}/${LAST_FILE} "to" ${MV_DIR}
        mv -- "${SEARCH_DIR}/${LAST_FILE}" ${MV_DIR}
    fi
}

# change the directory to the last modified one
cdlm() {
    LAST_MOD_DIR=$(ls -rd */ 2> /dev/null | head -1)
    cd ${LAST_MOD_DIR:-.}
}

# try a couple third-party packages for printing source files with color
color_cat() {
    if $(command -v highlight > /dev/null 2>&1); then
        highlight -O ansi "$1" 2> /dev/null || cat "$1"
    elif $(command -v pygmentize > /dev/null 2>&1); then
        pygmentize -g "$1" 2> /dev/null || cat "$1"
    else
        cat "$1"
    fi
}
# override any ccat functions in the path
alias ccat='color_cat '

# Prevents me from accidentally doing `pkill .`
# which is very, very annoying
pkill() {
    for i in $@; do :; done # get last argument
    if [[ "$i" == "." ]]; then
        echo "I'm sorry, Dave. I'm afraid I can't do that."
    else
        pkill "$@"
    fi
}


# Platform Specific
###################

UNAME=$(uname)
LINUX="Linux"

# if on linux, switch caps with escape
if [[ ${UNAME} = ${LINUX} && $(command -v xmodmap > /dev/null 2>&1) ]]; then
    xmodmap ~/.speedswapper
fi
