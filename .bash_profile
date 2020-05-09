export LC_ALL=en_US.UTF-8

#alias 'vim'=/usr/local/Cellar/vim/8.1.0650/bin/vim
#export PYTHONPATH=$PYTHONPATH:/Library/Frameworks/Python.framework/Versions/3.8/bin/python3

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi


alias p3="python3"
alias ip3="ipython3"

alias ll="ls -l"
alias la="ls -A"
alias l="ls -CF"

alias jn="jupyter notebook --no-browser"
alias jnb="jupyter notebook"
jnp(){ jupyter notebook --no-browser --port=$1; }
opentunnel(){ ssh -N -L localhost:$1:localhost:$2 nirwan@$3.uni-frankfurt.de; }
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
