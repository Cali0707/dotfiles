# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob nomatch
unsetopt beep notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '${HOME}/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# knative build env variables
export GOPATH="$HOME/go"
export PATH="${PATH}:${GOPATH}/bin"
export KO_DOCKER_REPO='docker.io/cali0707'

# Setup prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{green}(%b)%r%f'
zstyle ':vcs_info:*' enable git
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{yellow}%8~%f%b ${vcs_info_msg_0_} %# '
fpath+=${ZDOTDIR:-~}/.zsh_functions
