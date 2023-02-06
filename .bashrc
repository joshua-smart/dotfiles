#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# bash aliases
alias ls='exa -F'
alias la='exa -aF'
alias ll='exa -alFh'
alias grep='grep --color=auto'
alias ..='cd ..'
alias mv='mv -i'
alias :e='nvim'
alias :e!='sudo nvim'
alias ~='cd ~'
alias :q='exit'
alias view='qiv'
alias gc='git diff --name-status HEAD'

# bash exports
export EDITOR=nvim
export PATH="$HOME/.local/bin:$HOME/.ghcup/bin:$PATH" # Add ~/.local/bin to path

# Set terminal promt: js@laptop:~ $
PS1="\[\033[38;5;41m\]\u@\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;33m\]\W\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;33m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

[ -f "/home/js/.ghcup/env" ] && source "/home/js/.ghcup/env" # ghcup-env

. "$HOME/.cargo/env"
