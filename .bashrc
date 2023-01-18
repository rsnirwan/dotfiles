#OSH_THEME="pure"

set -o vi

function mybranchesls {
    git for-each-ref --format='%(committerdate) %09 %(authorname) %09 %(refname)' --sort=-committerdate | grep "$(git config user.name)"
}
