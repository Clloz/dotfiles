#!/bin/zsh

# flutter
# [[ -d "$HOME/Development/flutter/bin" ]] && path=("$HOME/Development/flutter/bin" $path)
[[ -d "$HOME/fvm/default/bin" ]] && path=("$HOME/fvm/default/bin" $path)
export FLUTTER_STORAGE_BASE_URL="https://mirrors.tuna.tsinghua.edu.cn/flutter"
export PUB_HOSTED_URL="https://mirrors.tuna.tsinghua.edu.cn/dart-pub"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f "$HOME/.dart-cli-completion/zsh-config.zsh" ]] && . "$HOME/.dart-cli-completion/zsh-config.zsh" || true
## [/Completion]
