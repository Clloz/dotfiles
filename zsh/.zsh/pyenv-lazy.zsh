#!/bin/zsh
# pyenv lazy loading

export PYENV_ROOT="$HOME/.pyenv"

if [[ -x "$PYENV_ROOT/bin/pyenv" ]]; then
  export PATH="$PYENV_ROOT/bin:$PATH"

  _PYENV_AUTO_ENABLED=0

  pyenv() {
    unset -f pyenv
    _initialize_pyenv_full
    command pyenv "$@"
  }

  _initialize_pyenv_full() {
    eval "$(command pyenv init - zsh)"

    if command pyenv commands | grep -qx "virtualenv-init"; then
      eval "$(command pyenv virtualenv-init -)"
    fi

    _PYENV_AUTO_ENABLED=1
  }

  enable_pyenv_auto() {
    if (( _PYENV_AUTO_ENABLED == 0 )); then
      _initialize_pyenv_full
    fi
  }

  _check_pyenv_auto() {
    if [[ -f .python-version || -d .venv ]]; then
      enable_pyenv_auto
    fi
  }

  autoload -U add-zsh-hook
  add-zsh-hook chpwd _check_pyenv_auto
  _check_pyenv_auto
fi
