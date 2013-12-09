#
# ~/.bashrc
#

### If not running interactively, don't do anything
[[ $- != *i* ]] && return

#####
# Terminal configuration
#
###
# history
###
# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ignore same sucessive entries.
export HISTCONTROL=ignoreboth
# increase history size
export HISTSIZE=1000

###
# window 
###
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#####  

#####
# Path variables
#
###
# User-defined path
#
# Append to this variable using the += operator before the end of this script
# to add directories to the PATH
###
USER_DEFINED_PATH=(
    ~/Local/bin
)

###
# Bash libs
#
# Append to this variable using the += operator before the end of this script
# to add directories to the bash framework search paths.
#
# These paths will be used by the bash framework symbol loader
###
SHELL_LIBRARY_PATH=(
    ~/.bash_lib
)
#####

#####
# Fetches
#

###
# framework
###
if [ -f ~/.bash_framework ]
then 
    source ~/.bash_framework
fi

### 
# colors
###
if [ -f ~/.bash_colors ]
then
    source ~/.bash_colors
fi

### 
# aliases
###
if [ -f ~/.bash_aliases ]
then
    source ~/.bash_aliases
fi

### 
# functions
###
if [ -f ~/.bash_functions ]
then
    source ~/.bash_functions
fi

###
# prompt
###
if [ -f ~/.bash_prompt ]
then
    source ~/.bash_prompt
fi

#####

#####
# Apply user-defined path directories to PATH
for path in "${USER_DEFINED_PATH[@]}" ; do
    if [[ ! "$PATH" == *"$path:"* ]] ; then
        export PATH="$path:$PATH"
    fi        
done
unset USER_DEFINED_PATH
#####

