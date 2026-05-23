#!/bin/zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/Users/Clloz/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/Users/Clloz/miniforge3/etc/profile.d/conda.sh" ]; then
#        . "/Users/Clloz/miniforge3/etc/profile.d/conda.sh"
#    else
#        export PATH="/Users/Clloz/miniforge3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
#export MAMBA_EXE='/Users/Clloz/miniforge3/bin/mamba';
#export MAMBA_ROOT_PREFIX='/Users/Clloz/miniforge3';
#__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__mamba_setup"
#else
#    alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
#fi
#unset __mamba_setup
# <<< mamba initialize <<<
#
# ==================== Conda 懒加载 ====================
lazy_load_conda() {
    unset -f conda lazy_load_conda
    
    # 执行原始的 conda 初始化逻辑
    __conda_setup="$('/Users/Clloz/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/Users/Clloz/miniforge3/etc/profile.d/conda.sh" ]; then
            . "/Users/Clloz/miniforge3/etc/profile.d/conda.sh"
        else
            export PATH="/Users/Clloz/miniforge3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    
    # 执行原始命令
    conda "$@"
}
conda() { lazy_load_conda "$@"; }

lazy_load_mamba() {
    unset -f mamba lazy_load_mamba

    export MAMBA_EXE='/Users/Clloz/miniforge3/bin/mamba';
    export MAMBA_ROOT_PREFIX='/Users/Clloz/miniforge3';
    __mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__mamba_setup"
    else
        alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
    fi
    unset __mamba_setup

    # 执行原始命令
    mamba "$@"
}
mamba() { lazy_load_mamba "$@"; }




