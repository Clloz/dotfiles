#!/bin/zsh

# homebrew make
[[ -d /opt/homebrew/opt/make/libexec/gnubin ]] && path=(/opt/homebrew/opt/make/libexec/gnubin $path)

# homebrew binutils
# [[ -d /opt/homebrew/opt/binutils/bin ]] && path=(/opt/homebrew/opt/binutils/bin $path)

# homebrew llvm
[[ -d /opt/homebrew/opt/llvm ]] && alias bllvm="cd /opt/homebrew/opt/llvm/"
[[ -x /opt/homebrew/opt/llvm/bin/clang ]] && alias bclang="/opt/homebrew/opt/llvm/bin/clang"
[[ -x /opt/homebrew/opt/llvm/bin/clang++ ]] && alias bclang++="/opt/homebrew/opt/llvm/bin/clang++"
[[ -x /opt/homebrew/opt/llvm/bin/lldb ]] && alias blldb="/opt/homebrew/opt/llvm/bin/lldb"
# [[ -d /opt/homebrew/opt/llvm/bin ]] && path=(/opt/homebrew/opt/llvm/bin $path)
#export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
#export CPPFLAGS="-I/opt/homebrew/opt/llvm/include

# homebrew gcc
[[ -x /opt/homebrew/bin/gcc-15 ]] && alias bgcc="/opt/homebrew/bin/gcc-15"
[[ -x /opt/homebrew/bin/g++-15 ]] && alias bg++="/opt/homebrew/bin/g++-15"

# homebrew bison
[[ -d /opt/homebrew/opt/bison/bin ]] && path=(/opt/homebrew/opt/bison/bin $path)
