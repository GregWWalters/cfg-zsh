# Set config dir
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=${HOME}/.config}"
XDG_DATA_HOME="${XDG_DATA_HOME:=${HOME}/.local/share}"
ZSH_CFG_DIR="${ZSH_CFG_DIR:=${XDG_CONFIG_HOME}/zsh}"
SH_CFG_DIR="${SH_CFG_DIR:=${XDG_CONFIG_HOME}/sh}"

# load profile, if it hasn't already been loaded
# profile loads environment variables, path, aliases, and functions
[ -s "${SH_CFG_DIR}/profile" ] && source "${SH_CFG_DIR}/profile"

# Load nvm (Node Version Manager)
if [ -z ${NVM_DIR+x} ]; then
	# This loads nvm bash_completion
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

# vim:ft=zsh

