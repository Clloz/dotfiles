#!/bin/zsh

#JAVA_HOME
# Java config
export JAVA_21_HOME="/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home"
export JAVA_17_HOME="/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home"
export JAVA_L_HOME="/opt/homebrew/opt/openjdk"

# config alias
alias jdk21="export JAVA_HOME=$JAVA_21_HOME"
alias jdk17="export JAVA_HOME=$JAVA_17_HOME"
alias jdkl="export JAVA_HOME=$JAVA_L_HOME"

alias javacheck="/usr/libexec/java_home -V"

export PATH="$HOME/.jenv/bin:$PATH"
#eval "$(jenv init -)"
jenv() {
  unset -f jenv
  _initialize_jenv_full
  command jenv "$@"
}
_initialize_jenv_full() {
  eval "$(jenv init -)"
}

# config default jdk
#export JAVA_HOME=$JAVA_21_HOME
#export PATH="$JAVA_HOME:$PATH"


