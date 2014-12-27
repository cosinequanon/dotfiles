# platform specific things
UNAME=$(uname)
MAC="Darwin"
LINUX="Linux"

if [ ${UNAME} = ${MAC} ]; then
    # brew
    alias brs="brew search"
    alias bri="brew install"
    alias brup="brew update && brew upgrade"

    alias ls="ls -FG"
    alias ks="ls -FG"
elif [ ${UNAME} = ${LINUX} ]; then
    # apt-get
    alias acs="apt-cache search"
    alias sag="sudo apt-get -y"
    alias sagi="sudo apt-get install -y"
    alias sagu="sudo apt-get update && sudo apt-get upgrade -y"

    alias ls="ls --color=auto"
    alias ks="ls --color=auto"
fi

# cd
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# access the dotfiles dir
alias cddf="cd ~/repos/dotfiles"

# ls
alias l="ls -l"
alias la="ls -a"
alias lh="ls -lh"
alias ll="ls -la"
alias larth="ls -larth"

# grep
alias grep="grep --color=auto"
alias grep="igrep -i --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

# tmux
alias ta="tmux attach"
alias td="tmux detach"
alias tn="tmux new"

# edit stuff
alias eb="$EDITOR ~/.bashrc"
alias sb="source ~/.bashrc"
alias eba="$EDITOR ~/.bash_aliases"
alias sba="source ~/.bash_aliases"
alias ebp="$EDITOR ~/.bash_profile"
alias sbp="source ~/.bash_profile"
alias ebc="$EDITOR ~/.bash_custom"
alias sbc="source ~/.bash_custom"
alias ev="$EDITOR ~/.vimrc"

# reload state
alias es='echo "executing shell"; exec $SHELL'

# scm
alias g="git "
alias h="hg "

# vim
alias v="vim "

# python
if $(command -v /usr/local/bin/virtualenvwrapper.sh > /dev/null 2>&1); then
    alias vw="source /usr/local/bin/virtualenvwrapper.sh"
    alias vwd="source /usr/local/bin/virtualenvwrapper.sh && workon dev"
fi

if $(command -v pip > /dev/null 2>&1); then 
    alias pipup="pip freeze | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U"
    alias pipi="pip instiall "
    alias pips="pip search"
fi

# make aliases work with sudo
alias sudo='sudo '

# compression
if command -v pigz > /dev/null 2>&1 ; then
    alias pigzb='pigz --best '
fi

# etc
alias histg="history | egrep"
alias pprint="python -m json.tool"
alias hotp="htop"
alias sshx='ssh -c arcfour,blowfish-cbc -XC'
alias jobkill="jobs -p | xargs kill"
alias caly="cal -y"
