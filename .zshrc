export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
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
POWERLEVEL9K_RBENV_BACKGROUND="black"
POWERLEVEL9K_RBENV_FOREGROUND="249"
POWERLEVEL9K_RBENV_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_AWS_VISUAL_IDENTIFIER_COLOR="yellow"
POWERLEVEL9K_TIME_BACKGROUND="black"
POWERLEVEL9K_TIME_FOREGROUND="249"
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S} \UE12E"
plugins=(git,golang)
source $ZSH/oh-my-zsh.sh

# Set Env Variables
export JDK_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_91.jdk/Contents/Home
export GOPATH=$HOME/Go
export PATH=$PATH:$GOPATH/bin:/Applications/Postgres.app/Contents/Versions/latest/bin:/Applications/Couchbase\ Server.app/Contents/Resources/couchbase-core/bin

# Setup GNUPG 2
if ! pgrep -x 0u "${USER}" gpg-agent>/dev/null 2>&1;then
	gpg-connect-agent /bye>/dev/null 2>&1
fi
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
	export SSH_AUTH_SOCK="/Users/${USER}/.gnupg/S.gpg-agent.ssh"
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

alias config="$(which git) --git-dir=${HOME}/.cfg/ --work-tree=${HOME}"
