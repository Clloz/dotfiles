#!/bin/zsh

#JAVA_HOME
# Java config
[[ -d /Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home ]] && export JAVA_21_HOME="/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home"
[[ -d /Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home ]] && export JAVA_17_HOME="/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home"
[[ -d /opt/homebrew/opt/openjdk ]] && export JAVA_L_HOME="/opt/homebrew/opt/openjdk"

# config alias
[[ -n "$JAVA_21_HOME" ]] && alias jdk21='export JAVA_HOME="$JAVA_21_HOME"'
[[ -n "$JAVA_17_HOME" ]] && alias jdk17='export JAVA_HOME="$JAVA_17_HOME"'
[[ -n "$JAVA_L_HOME" ]] && alias jdkl='export JAVA_HOME="$JAVA_L_HOME"'

[[ -x /usr/libexec/java_home ]] && alias javacheck="/usr/libexec/java_home -V"

[[ -d "$HOME/.jenv/bin" ]] && path=("$HOME/.jenv/bin" $path)
#eval "$(jenv init -)"
if command -v jenv >/dev/null 2>&1; then
  jenv() {
    unset -f jenv
    _initialize_jenv_full
    command jenv "$@"
  }
  _initialize_jenv_full() {
    eval "$(jenv init -)"
  }
fi

# config default jdk
#export JAVA_HOME=$JAVA_21_HOME
#export PATH="$JAVA_HOME:$PATH"

