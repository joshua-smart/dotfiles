#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# bash aliases
alias ls='ls -F --color=auto'
alias la='ls -AF'
alias ll='ls -alFh'
alias grep='grep --color=auto'
alias ..='cd ..'
alias mv='mv -i'

# bash exports
export EDITOR=vim
export PATH="$HOME/.local/bin:$HOME/.ghcup/bin:$PATH" # Add ~/.local/bin to path

# Set terminal promt: js@laptop:~ $
PS1="\[\033[38;5;41m\]\u@\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;33m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;33m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

[ -f "/home/js/.ghcup/env" ] && source "/home/js/.ghcup/env" # ghcup-env

# fuck!
eval "$(thefuck --alias)"
