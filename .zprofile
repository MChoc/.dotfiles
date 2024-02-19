# General purpose
alias edit-alias="nvim ~/.zprofile"
alias source-alias="source ~/.zprofile"
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# Hardware stuff
alias lsusb=". ~/dev/tools/lsusb.sh"
alias get-esprs=". ~/export-esp.sh"

# System
alias la="ls -al"
alias lrt="ls -lrt"

# Jumps
alias proj="cd ~/dev/projects"


eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH=/usr/local/share/python:$PATH
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(pyenv virtualenv-init -)"

. "$HOME/.cargo/env"
