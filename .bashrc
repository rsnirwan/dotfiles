#OSH_THEME="pure"
setxkbmap -option caps:escape

set -o vi

function branchesls {
    git for-each-ref --format='%(committerdate) %09 %(authorname) %09 %(refname)' --sort=-committerdate | grep "$1"
}
function mybranchesls {
    branchesls "$(git config user.name)"
}
