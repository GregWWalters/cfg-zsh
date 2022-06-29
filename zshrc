# Set config dir
if [ -z "$XDG_CONFIG_HOME" ]; then
	XDG_CONFIG_HOME="${HOME}/.config"
fi
sh_config="${XDG_CONFIG_HOME}/sh"
zsh_config="${XDG_CONFIG_HOME}/zsh"

# load profile
# profile loads environment variables, path, aliases, functions, and sets the
# prompt
[ -f "$HOME/.profile" ] && source "$HOME/.profile"

fpath=( "${zsh_config}/func" "${fpath[@]}" )
# autoload -U "$fpath[1]/*(.:t) # load all functions in first directory of fpath

# Keep 1000 lines of history within the shell and save it to ~/.zsh/history:
setopt histignorealldups
HISTSIZE=1000
SAVEHIST=1000
HISTFILE="${HOME}/.zsh/history"
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
## codefresh cli
codefresh_config="${HOME}/.config/codefresh"
if [ -d "$codefresh_config" -a -s "${codefresh_config}/completion.zsh" ]; then
	source "${codefresh_config}/completion.zsh"
fi

# Load nvm (Node Version Manager)
if [ -z ${NVM_DIR+x} ]; then
	# This loads nvm bash_completion
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
	# Only load NVM when needed so not to slow down shell startup
	function nvm {
		[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
		nvm "$@"
	}
fi

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/greg/.npm/_npx/14940/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /Users/greg/.npm/_npx/14940/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/greg/.npm/_npx/14940/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /Users/greg/.npm/_npx/14940/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/greg/.npm/_npx/14940/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash ] && . /Users/greg/.npm/_npx/14940/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash

# Hook Functions
[ -f "${zsh_config}/hooks" ] && source "${zsh_config}/hooks"

# Splash Screen
# Display ASCII art when loading .bashrc
# if [ -f "${HOME}/.bash_splash" ]; then
# 	source "${HOME}/.bash_splash"
# fi

# vim:ft=zsh
