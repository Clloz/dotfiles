# p10k instant prompt
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

# history，必须在 autosuggestions 之前
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=50000
export SAVEHIST=10000

setopt EXTENDED_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS

# fc -R "$HISTFILE"

# better cd
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

# zinit
source /opt/homebrew/opt/zinit/zinit.zsh

# completions
zinit ice wait lucid
zinit light zsh-users/zsh-completions

autoload -Uz compinit
compinit -C

# interactive plugins
# p10k
# zinit ice depth=1
# zinit light romkatv/powerlevel10k

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
zinit light zsh-users/zsh-autosuggestions

zinit ice wait lucid
zinit light zsh-users/zsh-history-substring-search

zinit ice wait lucid
zinit light Aloxaf/fzf-tab

zinit ice wait lucid
zinit light zsh-users/zsh-syntax-highlighting

# mudular configs
_load_zsh_configs() {
  local config_dir="${ZSH_CONFIG_DIR:-$HOME/.zsh}"
  local load_order_file="$config_dir/.load-order"

  [[ -f "$load_order_file" ]] || return

  while IFS= read -r config_name; do
    local config_file="$config_dir/$config_name"
    [[ -f "$config_file" ]] && source "$config_file"
  done < <(sed -e 's/[[:space:]]*#.*$//' -e '/^[[:space:]]*$/d' "$load_order_file")
}

_load_zsh_configs

# modern CLI integrations
eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
