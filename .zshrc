# ZSH_THEME="daveverwer"

alias p3="python3"
alias ip3="python3 -m IPython"
alias p39="$HOME/.pyenv/versions/3.9.7/bin/python3"
alias p38="$HOME/.pyenv/versions/3.8.13/bin/python3"
alias pip38="$HOME/.pyenv/versions/3.8.13/bin/pip3"


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
function nbtopdf {  # download notebook from remote and convert to pdf
    scp remote:"/path/to/notebook/folder/$1" .
    jupyter nbconvert --no-input --to pdf --no-prompt $1
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

# s3 bucket size
function s3size {
    aws s3api list-objects --profile $1 --bucket $2 --output json --query "[sum(Contents[].Size), length(Contents[])]" | awk  'NR!=2 {print $0;next}  NR==2 {print $0/1024/1024/1024" GB"}'
}


# PROMPT
export PROMPT="CD2 $PROMPT"

#PYENV
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

countpy() { find $1 -name "*.py" | xargs wc -l ; }
bindkey -v
