#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$PATH:~/.gem/ruby/2.1.0/bin

# svn editor
export SVN_EDITOR="vim"

# pacman editor
export EDITOR="vim"

# command promoter
red=$(tput setaf 1)
reset=$(tput sgr0)
PS1='\[$red\][\u@\h \W]\$\[$reset\] '

# source hightlight within less
# export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESSOPEN="|lesspipe.sh %s"
export LESS='-R '

# modified commands
alias diff='colordiff'              # requires colordiff package
alias grep='grep -i --color=auto'   # colored output and ignore case
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 5'
alias ..='cd ..'
alias python=python2.7
# alias mv='mv -iv'

# new commands
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias hist='history | grep $1'      # requires an argument
alias openports='ss --all --numeric --processes --ipv4 --ipv6'
alias pg='ps -Af | grep $1'         # requires an argument (note: /usr/bin/pg is installed by the util-linux package; maybe a different alias name should be used)
alias open='xdg-open'

# privileged access
if [ $UID -ne 0 ]; then
    alias sudo='sudo '
    alias scat='sudo cat'
    alias svim='sudoedit'
    alias root='sudo su'
    alias reboot='sudo systemctl reboot'
    alias poweroff='sudo systemctl poweroff'
    alias update='sudo pacman -Su'
fi

# ls
alias ls='ls -hF --color=auto'
alias ls='ls --color=auto'
alias lr='ls -R'                    # recursive ls
alias ll='ls -lh'
alias la='ls -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'
eval $(dircolors -b)                # enhanced ls color config

# safety features
alias cp='cp -v'
# alias rm=' timeout 3 rm -Iv --one-file-system'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# yaourt
alias yaosyy='yaourt -Syy'                      # 强制刷新软件仓库信息
alias yaosyu="yaourt -Syu"                      # 更新软件包并升级系统
alias yaos="yaourt -S"                          # 安装软件包
alias yaosnc='yaourt --noconfirm'               # 不确认
alias yaor="yaourt -R"                          # 删除软件包
alias yaoss="yaourt -Ss"                        # 在软件仓库搜索
alias yaosi="yaourt -Si"                        # 显示软件仓库中某软件包的信息
alias yaoqs="yaourt -Qs"                        # 在本地数据库搜索
alias yaoqi="yaourt -Qi"                        # 显示本地数据库中的软件包信息
alias yaoqdt="yaourt -Qdt"                      # 作为依赖安装并不再被需要的软件包 

# android
export PATH=$PATH:/opt/android-sdk/tools/:/opt/android-sdk/platform-tools/

# fbterm within tty1
if [[ $(tty) = /dev/tty1 ]] ; then
    fcitx > /dev/null 2>&1 &
    exec fbterm 
fi

if [ -z ${TMUX} ]; then
    tmux attach || tmux new-session
fi
