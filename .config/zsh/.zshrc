if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    exec tmux new-session -A -s default > /dev/null 2>&1
fi

# Set the directory where we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
# zinit light zsh-users/zsh-syntax-highlighting
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-completions

# Add snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# Load completions
fpath+="${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.zfunc"
autoload -Uz compinit && compinit
zinit cdreplay -q

# Continue loading plugins
# fzf-tab must be loaded after compinit, but before zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -1 --color=always $realpath'

# History
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/.zsh_history"

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Aliases
alias ls='eza --color=always'
alias vim='nvim'
alias neofetch='fastfetch'
alias ff='fastfetch'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
. "$HOME/.cargo/env"
eval "$(register-python-argcomplete pipx)"

# PyEnv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Fastfetch
fastfetch

# Don't load oh-my-posh as Apple Terminal doesn't support ANSI escape codes
if [ "$TERM_PROGRAM" != "Apple Terminal" ]; then
	# TODO: use XDG_CONFIG_whatever
	eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"
fi
