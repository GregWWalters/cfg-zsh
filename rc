# Set config dir
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=${HOME}/.config}"
XDG_DATA_HOME="${XDG_DATA_HOME:=${HOME}/.local/share}"
ZSH_CFG_DIR="${ZSH_CFG_DIR:=${XDG_CONFIG_HOME}/zsh}"
SH_CFG_DIR="${SH_CFG_DIR:=${XDG_CONFIG_HOME}/sh}"

# load profile, if it hasn't already been loaded
# profile loads environment variables, path, aliases, and functions
[ -s "${SH_CFG_DIR}/profile" ] && source "${SH_CFG_DIR}/profile"

# set prompt
[ -s "$ZSH_CFG_DIR/prompt" ] && source "$ZSH_CFG_DIR/prompt"

fpath=( "${ZSH_CFG_DIR}/func" "${fpath[@]}" )
# autoload -U "$fpath[1]/*(.:t) # load all functions in first directory of fpath

# Keep 1000 lines of history within the shell and save it to ~/.zsh/history:
setopt histignorealldups
HISTSIZE=1000
SAVEHIST=1000
HISTFILE="${XDG_DATA_HOME}/zsh/history"
## search backward through command history
_history-incremental-search-backward () {
    zle .history-incremental-search-backward $BUFFER
}

# autocompletion
autoload -Uz compinit && compinit
## case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
## partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix
zle -N history-incremental-search-backward _history-incremental-search-backward
## this line is actually not necessary since this is default.
bindkey '^R' history-incremental-search-backward

## Codefresh CLI completion
codefresh_config="${XDG_CONFIG_HOME}/codefresh"
if [ -d "$codefresh_config" -a -s "${codefresh_config}/completion.zsh" ]; then
	. "${codefresh_config}/completion.zsh"
fi

# Load nvm (Node Version Manager)
if [ -z ${NVM_DIR+x} ]; then
	# This loads nvm bash_completion
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

# Fuzzy Find autocompletion and keybindings
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/greg/.npm/_npx/14940/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && source /Users/greg/.npm/_npx/14940/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/greg/.npm/_npx/14940/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && source /Users/greg/.npm/_npx/14940/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/greg/.npm/_npx/14940/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash ] && source /Users/greg/.npm/_npx/14940/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash

# Hook Functions
[ -f "${ZSH_CFG_DIR}/hooks" ] && source "${ZSH_CFG_DIR}/hooks"

# vim:ft=zsh
