#!/bin/sh

install_ohmyzsh() {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"    
}

main() {
    install_ohmyzsh
}
