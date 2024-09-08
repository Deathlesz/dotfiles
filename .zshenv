ZSH_CONFIG_DIR="${XDG_CONFIG_HOME:-${HOME}/.config}/zsh"

if [ -d "$ZSH_CONFIG_DIR" ]; then
    export ZDOTDIR="$ZSH_CONFIG_DIR"
fi
