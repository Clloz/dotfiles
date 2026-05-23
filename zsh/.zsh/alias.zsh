#!/bin/zsh
# =========================================================
# alias.zsh
# =========================================================

# ---------------------------------------------------------
# 1. Navigation
# ---------------------------------------------------------

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias -- -='cd -'

mkcd() {
  mkdir -p "$1" && cd "$1"
}

fcd() {
  local dir
  dir=$(fd -t d --hidden \
    --exclude .git \
    --exclude node_modules \
    | fzf) || return

  cd "$dir"
}
fcda() {
  local dir
  dir=$(fd -t d --hidden --no-ignore \
    --exclude .git \
    --exclude node_modules \
    | fzf) || return

  cd "$dir"
}

# ---------------------------------------------------------
# 2. Modern CLI replacements
# ---------------------------------------------------------

alias ls='eza --icons --group-directories-first --color=auto'
alias ll='eza -ll --icons --group-directories-first --git --time-style=long-iso --color=auto'
alias la='eza -la --icons --group-directories-first --git --time-style=long-iso --color=auto'
alias lt="eza --tree --level=2 --group-directories-first --icons --color=auto --ignore-glob='node_modules|.git|dist'"

alias cat='bat'
# alias grep='rg'
alias rgi='rg -n --hidden'

fv() {
  local file
  file=$(fd -t f --hidden \
    --exclude .git \
    --exclude node_modules \
    | fzf) || return

  nvim "$file"
}
fva() {
  local file
  file=$(fd -t f --hidden --no-ignore \
    --exclude .git \
    --exclude node_modules \
    | fzf) || return

  nvim "$file"
}

alias ta='tmux attach -t'
alias tls='tmux ls'
alias tn='tmux new -s'
alias tk='tmux kill-session -t'
t() {
  local dir
  dir=$(zoxide query -l | fzf) || return

  local name
  name=$(basename "$dir" | tr ' .:' '___')

  tmux new-session -A -s "$name" -c "$dir"
}

# ---------------------------------------------------------
# 3. Safer defaults
# ---------------------------------------------------------

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# ---------------------------------------------------------
# 4. Editor
# ---------------------------------------------------------

alias v='nvim'
alias vi='nvim'
alias vim='nvim'

# ---------------------------------------------------------
# 5. Git
# ---------------------------------------------------------

alias gst='git status'
alias gaa='git add --all'
alias gb='git branch'
alias gba='git branch --all'
alias gcm='git commit -m'
alias gd='git diff'
alias gds='git diff --staged'
alias gf='git fetch'
alias gm='git merge'
alias gl='git pull'
alias gp='git push'
alias gb='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gsw='git switch'
alias grb='git rebase'
alias gcp='git cherry-pick'

alias glo='git log --oneline --decorate --graph'
alias glog="git log --graph --pretty=format:'%C(auto)%h%d %s %C(black)%C(bold)%cr' --abbrev-commit"

# dotfiles bare repo
alias dotconf="/opt/homebrew/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

# ---------------------------------------------------------
# 6. Development
# ---------------------------------------------------------

alias clocvue='cloc ./ --exclude-dir=node_modules'
alias ports='lsof -i -P -n'
alias p3000='lsof -i :3000'
alias p5173='lsof -i :5173'

# ---------------------------------------------------------
# 7. Process / system
# ---------------------------------------------------------

alias psa='ps aux'
psg() {
  ps aux | grep -i --color=auto "$1" | grep -v grep
}
alias myip='curl -s ifconfig.me'

# disk usage
alias dus='du -sh * | sort -hr'
alias dud='du -sh */ | sort -hr'
alias dusa='du -sh .[!.]* * | sort -hr'
alias du1='du -sh .'

m() {
  man "$1" | col -bx | bat -l man
}

# ---------------------------------------------------------
# 8. Archive
# ---------------------------------------------------------

# gzip
alias tgz='tar -xzf'
alias tgzc='tar -czf'

# xz
alias txz='tar -xJf'
alias txzc='tar -cJf'

# zstd, use GNU tar on macOS
alias tzst='gtar --zstd -xf'
alias tzstc='gtar --zstd -cf'

alias unzipd='ditto -x -k'

# ---------------------------------------------------------
# 9. macOS app launchers
# ---------------------------------------------------------

alias chrome='open -a "Google Chrome"'
alias typora='open -a "Typora"'
alias bear='open -a "Bear"'
alias word='open -a "Microsoft Word"'
alias ppt='open -a "Microsoft PowerPoint"'
alias excel='open -a "Microsoft Excel"'
alias cdr='open -a "CodeRunner"'
alias esp='open -a "Espresso"'

# ---------------------------------------------------------
# 10. Shell mode
# ---------------------------------------------------------

alias vmode='set -o vi'
alias emode='set -o emacs'
