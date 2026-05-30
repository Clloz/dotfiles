#!/bin/zsh

# fnm
export FNM_DIR="$HOME/.fnm"
if command -v fnm >/dev/null 2>&1; then
  eval "$(fnm env --use-on-cd --shell zsh)"
fi

#_FNM_AUTO_ENABLED=0
#fnm() {
#  unset -f fnm
#  _initialize_fnm_full
#  command fnm "$@"
#}
#_initialize_fnm_full() {
#  eval "$(fnm env --use-on-cd --shell zsh)"
#  export _FNM_AUTO_ENABLED=1
#}

# NVM
# export NVM_DIR="$HOME/.nvm"
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# node corepack
alias corepackv="change-corepack-version"
function change-corepack-version() {
    corepack prepare $1@$2 --activate
}
# PNPM
export PNPM_HOME="$HOME/.pnpm"
export PATH="$PNPM_HOME:$PATH"

