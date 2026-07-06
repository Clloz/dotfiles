#!/bin/zsh

# Android Studio config
if [[ -d "$HOME/Library/Android/sdk" ]]; then
  alias sdk="cd $HOME/Library/Android/sdk"
  export ANDROID_HOME="$HOME/Library/Android/sdk"
elif [[ -d "$HOME/Android/Sdk" ]]; then
  alias sdk="cd $HOME/Android/Sdk"
  export ANDROID_HOME="$HOME/Android/Sdk"
fi

if [[ -n "$ANDROID_HOME" ]]; then
  [[ -d "$ANDROID_HOME/emulator" ]] && path+=("$ANDROID_HOME/emulator")
  [[ -d "$ANDROID_HOME/tools" ]] && path+=("$ANDROID_HOME/tools")
  [[ -d "$ANDROID_HOME/tools/bin" ]] && path+=("$ANDROID_HOME/tools/bin")
  [[ -d "$ANDROID_HOME/platform-tools" ]] && path+=("$ANDROID_HOME/platform-tools")
fi
