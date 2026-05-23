# 仅在交互终端使用 GPG_TTY
if [ -t 1 ]; then
    export GPG_TTY=$(tty)
fi
