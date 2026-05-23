#!/bin/zsh
#emacs config

# emacs daemon
#export PATH="/Users/Clloz/.emacs.d/bin:$PATH"
alias emacs="~/.emacs_client.sh -t"
alias em="emacs"
alias emd="kill-emacs"
function kill-emacs(){
    emacsclient -e "(kill-emacs)"
    emacs_pid=$( ps x | grep "Emacs.*app" | grep daemon | awk '{print $1}' )
    if [[ -n "${emacs_pid}" ]];then
        kill -9 "${emacs_pid}"
    fi
}
