#
# ~/.bash_aliases
#

#####
# basic commands

###
# ls
###
alias ls='ls -hFG --color=auto'     # colored ls
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'

###
# misc
###
alias grep='grep --color=auto'      # color my greps
alias more='less'                   # more is less
alias df='df -h'                    # human readable disk informations
alias du='du -c -h'                 # human readable total disk usage
alias mkdir='mkdir -p -v'           # verbode with create parents
alias ping='ping -c 5'              # ping 5 times
alias ..='cd ..'                    # easy parent directory
#alias diff='colordiff'             # requires colordiff package

###
# new commands
###
alias hist='history | grep'         # requires an argument
alias openports='netstat --all --numeric --programs --inet --inet6'
#alias date='date "+%A, %B %d, %Y [%T]"'

###
# readline wrapped commands
###
alias ocaml='rlwrap ocaml'

###
# privileged access
###
if [ $UID -ne 0 ]; then
    alias sudo='sudo '
    #alias scat='sudo cat'
    #alias svim='sudo vim'
    alias root='sudo su'
    alias reboot='sudo reboot'
    alias halt='sudo halt'
    alias shutdown='sudo shutdown -h now'
    #alias update='sudo pacman -Su'
    #alias netcfg='sudo netcfg2'
fi

###
# safety features
###
#alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'                    # 'rm -i' prompts for every file
alias ln='ln -i'
#alias chown='chown --preserve-root'
#alias chmod='chmod --preserve-root'
#alias chgrp='chgrp --preserve-root'

#####
