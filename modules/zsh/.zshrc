[[ "$TERM" == "dumb" ]] && return
export HISTSIZE="10000"
export SAVEHIST="10000"
export HISTFILE="$XDG_STATE_HOME/zsh/zsh_history"
[ ! -d $(dirname $HISTFILE) ] && mkdir -p "$(dirname $HISTFILE)"
setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_DUPS
unsetopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
unsetopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
unsetopt EXTENDED_HISTORY

# ZINIT
declare -A ZINIT
ZINIT[ZCOMPDUMP_PATH]="$XDG_CACHE_HOME/zsh/.zcompdump"
ZINIT_HOME="$XDG_DATA_HOME/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "$ZINIT_HOME/zinit.zsh"

zinit ice light-mode lucid
zinit snippet OMZL::git.zsh
zinit ice light-mode lucid
zinit snippet OMZP::git
zinit ice lucid as="program" from="gh-r" \
	mv="posh* -> oh-my-posh" \
	atclone="./oh-my-posh init zsh --config $XDG_CONFIG_HOME/oh-my-posh/mytheme.omp.json > init.zsh; ./oh-my-posh completion zsh > _oh-my-posh" \
	atpull="%atclone" src="init.zsh"
zinit light JanDeDobbeleer/oh-my-posh
zinit ice lucid as="program" from="gh-r" \
	pick="zoxide" \
	atclone="./zoxide init zsh > init.zsh" \
	atpull="%atclone" src="init.zsh"
zinit light ajeetdsouza/zoxide
zinit ice lucide as="program" from="gh-r" \
	bpick="*gnu*" pick="eza"
zinit light eza-community/eza
zinit ice lucide as="program" from="gh-r" \
	bpick="*gnu*" mv="bat*/bat -> bat" cp="bat*/autocomplete/bat.zsh -> _bat" pick="bat"
zinit light sharkdp/bat
zinit ice lucide as="program" from="gh-r" \
	bpick="*gnu*" mv="fd*/fd -> fd" pick="fd"
zinit light sharkdp/fd
zinit ice lucide as="program" from="gh-r" \
	mv="ripgrep*/rg -> rg" pick="rg" 
zinit light BurntSushi/ripgrep
zinit ice lucid as="null" completions="true" from="gh-r" \
  bpick="mise-*-linux-x64.tar.gz" \
  atclone="\$PWD/mise/bin/mise activate zsh > init.zsh;\$PWD/mise/bin/mise completion zsh > _mise" \
  atpull="%atclone" src="init.zsh"
zinit light jdx/mise
zinit light-mode lucid for \
	zsh-users/zsh-autosuggestions \
	zsh-users/zsh-syntax-highlighting

autoload -Uz compinit
compinit -d "${ZINIT[ZCOMPDUMP_PATH]}"
zinit cdreplay -q

# Aliases
alias mktmpd='cd $(mktemp -d)'
alias mktmpf='$EDITOR $(mktemp)'
alias cat='bat'
alias eza='eza --icons --git'
alias la='eza -a'
alias ll='eza -l'
alias lla='eza -la'
alias ls='eza'
alias lt='eza --tree'
alias cd='z'

if [[ -d "$XDG_CONFIG_HOME/alias.d" ]]; then
  for a in $XDG_CONFIG_HOME/alias.d/*; do
    source "$a"
  done
fi
if (( $+commands[op] )); then
	alias ops='eval $(op signin)'
fi
