#!/bin/zsh

# homebrew make
export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"

# homebrew binutils
# export PATH="/opt/homebrew/opt/binutils/bin:$PATH"

# homebrew llvm
# export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
alias bllvm="cd /opt/homebrew/opt/llvm/"
alias bclang="/opt/homebrew/opt/llvm/bin/clang"
alias bclang++="/opt/homebrew/opt/llvm/bin/clang++"
alias blldb="/opt/homebrew/opt/llvm/bin/lldb"
#export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
#export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
#export CPPFLAGS="-I/opt/homebrew/opt/llvm/include

# homebrew gcc
alias bgcc="/opt/homebrew/bin/gcc-14" 
alias bg++="/opt/homebrew/bin/g++-14" 

# homebrew bison
export PATH="/opt/homebrew/opt/bison/bin:$PATH"

