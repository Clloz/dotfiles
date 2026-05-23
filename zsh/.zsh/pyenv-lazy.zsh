#!/bin/zsh
# pyenv 懒加载配置

# 只在 pyenv 存在时加载配置
if command -v pyenv >/dev/null 2>&1; then
    export PYENV_ROOT="$HOME/.pyenv"
    [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
    
    # 状态变量
    _PYENV_AUTO_ENABLED=0
    
    # 主懒加载函数
    pyenv() {
        unset -f pyenv
        _initialize_pyenv_full
        command pyenv "$@"
    }
    
    # 完整的初始化函数
    _initialize_pyenv_full() {
        eval "$(pyenv init - zsh)"
        eval "$(pyenv virtualenv-init -)"
        export _PYENV_AUTO_ENABLED=1
    }
    
    # Python 相关命令的懒加载
    #python() { pyenv >/dev/null; command python "$@"; }
    #pip() { pyenv >/dev/null; command pip "$@"; }
    #python3() { pyenv >/dev/null; command python3 "$@"; }
    #pip3() { pyenv >/dev/null; command pip3 "$@"; }
    
    # 自动激活功能
    enable_pyenv_auto() {
        if (( _PYENV_AUTO_ENABLED == 0 )); then
            _initialize_pyenv_full
            #echo "✅ pyenv 自动激活已启用"
        else
            #echo "ℹ️  虚拟环境自动激活已启用"
        fi
    }
    
    # 目录切换检查
    autoload -U add-zsh-hook
    add-zsh-hook chpwd _check_pyenv_auto
    
    _check_pyenv_auto() {
        if [[ -f .python-version || -f .venv ]]; then
            enable_pyenv_auto
        fi
    }
    
    # 导出函数以便调试
    #export -f enable_pyenv_auto
fi
