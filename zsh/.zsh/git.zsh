#!/bin/zsh

# git alias
alias gitline="git ls-files | xargs wc -l"
alias gitperson="get-person-line-stats"
function get-person-line-stats() {
    git log --format='%aN' | sort -u | while read name; do echo -en "$name\t"; git log --author="$name" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }' -; done
}
alias glh="get-line-log-history"
function get-line-log-history() {
    if [ $# = 2 ];then
        git log -L $1,$1:$2
    else
        git log -L $1,$2:$3
    fi
}
alias gbh="get-line-blame-history"
function get-line-blame-history() {
    if [ $# = 2 ];then
        git blame -L $1,$1 $2
    else
        git blame -L $1,$2 $3
    fi
}
# 自动补全 git branch
compdef _git_branch_comp gerrit-push
_git_branch_comp() {
    local -a git_branches
    git_branches=("${(@f)$(git branch --format='%(refname:short)')}")
    _describe 'command' git_branches
}
alias gpref="gerrit-push"
function gerrit-push() {
    git push origin HEAD:refs/for/$1
}
