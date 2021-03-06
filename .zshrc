# Set Env Variables
export GOPATH=$HOME/go
export EDITOR='vim'
export PATH=$HOME/bin:$PATH:$GOPATH/bin
export ELECTRON_TRASH=trash-cli

# ZShell configuration
export ZSH=${HOME}/.oh-my-zsh
export ZSH_CUSTOM=${HOME}/.zsh_custom
ZSH_THEME="powerlevel9k/powerlevel9k"
prompt_my_go_version() {
  [ ! -n $GOPATH ] && return
  if [[ "$(pwd)" == ("$GOPATH")* ]]; then
    local go_version=$(go version 2>/dev/null | awk '{print substr($3,3)}')
    [[ -n "$go_version" ]] && "$1_prompt_segment" "prompt_go_version" "$2" "green" "255" "$go_version" "GO_ICON"
  fi
}
POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs my_go_version time)
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_GO_VERSION_BACKGROUND="black"
POWERLEVEL9K_GO_VERSION_FOREGROUND="249"
POWERLEVEL9K_GO_VERSION_VISUAL_IDENTIFIER_COLOR="green"
POWERLEVEL9K_GO_ICON="\ue8ae"
POWERLEVEL9K_TIME_BACKGROUND="black"
POWERLEVEL9K_TIME_FOREGROUND="249"
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S} \UE12E"
plugins=(git tmux)
DISABLE_AUTO_UPDATE=true
source $ZSH/oh-my-zsh.sh

alias config="$(which git) --git-dir=${HOME}/.cfg/ --work-tree=${HOME}"

# Setup GNUPG 2
if ! pgrep -x -u "${USER}" gpg-agent>/dev/null 2>&1;then
	gpg-connect-agent /bye>/dev/null 2>&1
fi
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
	if [[ "${OS}" == "Linux" ]]; then
		export SSH_AUTH_SOCK="/run/user/${UID}/gnupg/S.gpg-agent.ssh"
	elif [[ "${OS}" == "OSX" ]]; then
		export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"
	fi
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

source $ZSH/tools/check_for_upgrade.sh 

source $HOME/.customEnv
