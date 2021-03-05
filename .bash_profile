export LC_ALL=en_US.UTF-8

export PYTHONPATH=$PYTHONPATH:~/Dev/python

#export PYTHONPATH=$PYTHONPATH:/Library/Frameworks/Python.framework/Versions/3.8/bin/python3
#PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi


alias p3="python3"
alias ip3="ipython3"
alias p36="~/.runtimes/Python36/bin/python3"
alias p37="~/.runtimes/Python37/bin/python3"
alias p38="~/.runtimes/Python38/bin/python3"

alias ll="ls -l"
alias la="ls -A"
alias l="ls -CF"

alias jn="jupyter notebook --no-browser"
alias jnb="jupyter notebook"
jnp(){ jupyter notebook --no-browser --port=$1; }
jn_vim(){
    if [ $1 = "on" ]; then
        jupyter nbextension enable vim_binding/vim_binding
    elif [ $1 = "off" ]; then
        jupyter nbextension disable vim_binding/vim_binding
    fi
}

########### set marks to quickly navigate your filesystem #################
#https://www.datascienceworkshops.com/blog/quickly-navigate-your-filesystem-from-the-command-line/
export MARKPATH=$HOME/.marks
function jump {
	cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark {
	mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
	rm -i "$MARKPATH/$1"
}
function marks {
	#ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
    # for mac
    \ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
}
##########################################################################


alias vims="vim -S .session.vim"

run_timer(){ while true; do echo -ne "`date`\r"; sleep 1; done }
#export PATH=~/.npm-global/bin:$PATH
#export PATH=/Library/Frameworks/Python.framework/Versions/3.8/bin:$PATH

#git
source ~/.git-completion.bash
source ~/.git-prompt.sh
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM="auto"
green="\[\033[0;32m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
reset="\[\033[0m\]"
export PS1="$purple\u$green\$(__git_ps1)$blue \W $ $reset"
#export PS1="$purple\u@\h:$green\$(__git_ps1)$blue \W $ $reset"
