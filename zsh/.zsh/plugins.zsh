#!/bin/zsh
# omz plugins config

#[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
# alias j="z"

# lazy_load_zoxide() {
#   unset -f zoxide z
#   eval "$(zoxide init zsh)"
# }
# z() { lazy_load_zoxide; z "$@"; }
# zoxide() { lazy_load_zoxide; zoxide "$@"; }
#eval "$(zoxide init zsh)"

# thefuck
#eval $(thefuck --alias fk)
# 延迟加载 thefuck
lazy_load_thefuck() {
    unset -f fuck fk
    eval $(thefuck --alias fk)
}
fk() { lazy_load_thefuck; fk "$@"; }
fuck() { lazy_load_thefuck; fuck "$@"; }

