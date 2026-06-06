# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false

# group descriptions
zstyle ':completion:*:descriptions' format '[%d]'

# filename colors
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# let fzf-tab capture unambiguous prefix
zstyle ':completion:*' menu no

# use plain fzf instead of tmux popup
zstyle ':fzf-tab:*' fzf-command fzf

# pseudo-popup UI, stable in tmux
zstyle ':fzf-tab:*' fzf-flags \
  --height=50% \
  --layout=reverse \
  --border=rounded \
  # --margin=0,1 \
  # --padding=0 \
  --bind=tab:accept

# Do not inherit FZF_DEFAULT_OPTS, avoids breaking fzf-tab
# zstyle ':fzf-tab:*' use-fzf-default-opts yes

# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

# general file preview
zstyle ':fzf-tab:complete:*:*' fzf-preview '
if [[ -d $realpath ]]; then
  eza --tree --level=2 --icons --color=always $realpath
elif [[ -f $realpath ]]; then
  bat --style=numbers,changes --color=always --line-range :300 $realpath
fi
'

# git checkout preview
zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview '
git log --oneline --graph --color=always --max-count=20 $word
'
