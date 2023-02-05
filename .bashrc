#OSH_THEME="pure"

# fix for python virtualenv with oh-my-bash. eg in $OSH/themes/pure.theme.sh
#python_venv=""
#if [[ -n "${VIRTUAL_ENV}" ]]; then
    #python_venv="($(basename "${VIRTUAL_ENV}")) "
#fi
# add ${python_venv} to PS1

setxkbmap -option caps:escape

set -o vi

function branchesls {
    git for-each-ref --format='%(committerdate) %09 %(authorname) %09 %(refname)' --sort=-committerdate | grep "$1"
}
function mybranchesls {
    branchesls "$(git config user.name)"
}
