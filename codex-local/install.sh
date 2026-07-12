#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(
  cd -- "$(dirname -- "${BASH_SOURCE[0]}")"
  pwd
)"

SOURCE="$SCRIPT_DIR/config.base.toml"
TARGET_DIR="$HOME/.codex"
TARGET="$TARGET_DIR/config.toml"

if [[ ! -f "$SOURCE" ]]; then
  printf 'Error: base config does not exist:\n  %s\n' "$SOURCE" >&2
  exit 1
fi

mkdir -p "$TARGET_DIR"

if [[ -L "$TARGET" ]]; then
  printf 'Error: target is still a symbolic link:\n  %s\n' "$TARGET" >&2
  printf 'Run "stow -D codex" or remove the old link first.\n' >&2
  exit 1
fi

if [[ -e "$TARGET" ]]; then
  printf 'Codex config already exists:\n  %s\n' "$TARGET"
  printf 'No changes were made.\n'
  printf 'Edit the existing config manually instead of overwriting it.\n'
  exit 0
fi

cp "$SOURCE" "$TARGET"
chmod 600 "$TARGET"

printf 'Initialized Codex config:\n  %s\n' "$TARGET"
