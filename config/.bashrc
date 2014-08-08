# If not running interactively, don't do anything
[ -z "$PS1" ] && return

declare -x HISTFILE=~/.bash_history
declare -x HISTCONTROL=ignoreboth
declare -x HISTFILESIZE=5000
declare -x HISTSIZE=5000

# SHELL VARIABLES
set -o noclobber
set -o physical
shopt -s extglob
shopt -s cmdhist
shopt -s lithist
shopt -s progcomp
shopt -s checkhash
shopt -s histreedit
shopt -s histappend
shopt -s promptvars
shopt -s checkwinsize
shopt -s hostcomplete
shopt -s expand_aliases
shopt -s interactive_comments

# COMPLETIONS
complete -A setopt set
complete -A user groups
complete -A binding bind
complete -A helptopic help
complete -A alias {,un}alias
complete -A signal -P '-' kill
complete -A stopped -P '%' fg bg
complete -A job -P '%' jobs disown
complete -A variable readonly unset
complete -A file -A directory ln chmod
complete -A user -A hostname finger pinky
complete -A directory find cd pushd {mk,rm}dir
complete -A file cat pico nano vi vim view emacs
complete -A file -A directory -A user chown
complete -A file -A directory -A group chgrp
complete -o default -W 'Makefile' -P '-o ' qmake
complete -A command man which whatis sudo info apropos

# CUSTOM
alias ls='ls -h -F'
alias grc='git rebase --continue'
alias rbs='git fetch upstream && git rebase upstream/master'

# homebrew - OS X
[[ -n `which brew` ]] && source `brew --prefix`/Library/Contributions/brew_bash_completion.sh

# virtualenvwrapper
if [ -e /usr/local/bin/virtualenvwrapper.sh ]; then
  source /usr/local/bin/virtualenvwrapper.sh
fi

# screen SSH agent reconnector
if [ -e $HOME/.screen/session-variables ]; then
  alias ssh='source $HOME/.screen/session-variables && ssh'
  alias git='source $HOME/.screen/session-variables && git'
fi

if [ -e $HOME/bin/save-ssh-vars ]; then
  alias screen='$HOME/bin/save-ssh-vars && screen'
  alias tmux='$HOME/bin/save-ssh-vars && tmux'
fi

export EDITOR=vim
