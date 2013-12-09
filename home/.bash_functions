#
# ~/.bash_functions
#

#####
# File management
#
###
# Removes a directory and asks for confirmation
###
function rmdir ()   { rm -r $@; }

###
# Find file from current directory
###
function ff ()      { find . -name $@ -print; }

###
# Remove ~ files created by Kate
###
function delswaps { rm ./*~; } 

#####

#####
# Processes management
#
###
# View processes
###
function psa ()     { ps aux $@; }
function psu ()     { ps ux $@; }

#####

