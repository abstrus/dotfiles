
install_vim_plug() {
  if [ ! -e "$HOME"/.vim/autoload/plug.vim ]; then
    curl -fLo "$HOME"/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  fi
}

update_vim_plugins() {
  vim -u "$HOME"/.vimrc +PlugInstall +PlugClean! +qa
}
