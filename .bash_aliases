# cd
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# ls
alias ls="ls --color=autoo"
alias ks="ls --color=autoo"
alias l="ls -l"
alias la="ls -la"
alias lh="ls -lh"
alias ll="ls -l"
alias larth="ls -larth"

# grep
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

# tmux
alias ta="tmux attach"
alias td="tmux detach"
alias tn="tmux new"

# edit stuff
alias eb="vim ~/.bashrc"
alias sb="source ~/.bashrc"
alias eba="vim ~/.bash_aliases"
alias sba="source ~/.bash_aliases"
alias ev="vim ~/.vimrc"

# git
alias g="git"

# etc
alias histg="history | egrep"
alias pprint="python -m json.tool"
alias hotp="htop"

# platform specific things
UNAME=$(uname)
MAC="Darwin"
LINUX="Linux"

if [ ${UNAME} = ${MAC} ]; then
    # brew
    alias br="brew"
    alias brup="brew update && brew upgrade"
elif [ ${UNAME} = ${LINUX} ]; then
    # apt-get
    alias acs="apt-cache search"
    alias sag="sudo apt-get -y"
    alias sagi="sudo apt-get install -y"
    alias sagu="sudo apt-get update && sudo apt-get upgrade -y"
fi
