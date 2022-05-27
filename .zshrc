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

function dr {
    if [ $# -eq 0 ]; then
        export DR=us-east
    elif [ $1 = "nir" ]; then
        export DR=us-west
    else
        export DR=$1
    fi
}
