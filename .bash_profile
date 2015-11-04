# env
PS1='\[\e[1;31m\][\u \W]\$\[\e[0m\] '

# gnu coreutils
PATH="/usr/local/opt/coreutils/libexec/gnubin:/opt/mongodb/bin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
TMPDIR="/tmp"

# gnu
PATH="/usr/local/bin:$PATH"
alias g++='g++-5 -std=c++11'

# ls
alias ls='ls -h --color'
alias ll='ls -l'
alias la='ls -a'

# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

alias ta='tmux attach -t'
