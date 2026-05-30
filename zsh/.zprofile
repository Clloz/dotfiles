
# Setting PATH for Python 2.7
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Auto attach tmux on SSH login
if [[ -o login ]] && [[ -n "$SSH_CONNECTION" ]] && [[ -z "$TMUX" ]] && [[ -t 1 ]] && command -v tmux >/dev/null 2>&1; then
  exec tmux attach-session -t main 2>/dev/null || exec tmux new-session -s main
fi
