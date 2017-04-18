"
" ~/.vimrc
"

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible 
" Create vimrc autocmd group and remove any existing vimrc autocmds,
" in case .vimrc is re-sourced.
augroup vimrc
  autocmd!
augroup END

"
" Theme / Syntax highlighting
"

" I always use dark terminals
set background=dark
" Use color scheme
"colorscheme kalisi
colorscheme distinguished
" Make invisible chars less visible in terminal.
autocmd vimrc ColorScheme * :hi NonText ctermfg=236
autocmd vimrc ColorScheme * :hi SpecialKey ctermfg=236
" Show trailing whitespace.
autocmd vimrc ColorScheme * :hi ExtraWhitespace ctermbg=red guibg=red
" Make selection more visible.
autocmd vimrc ColorScheme * :hi Visual guibg=#00588A
autocmd vimrc ColorScheme * :hi link multiple_cursors_cursor Search
autocmd vimrc ColorScheme * :hi link multiple_cursors_visual Visual

"
" Visual settings
"
" Highlight current line
set cursorline
" Enable line numbers
set number
" Always show tab bar
set showtabline=2
" Use relative line numbers, keeps current line in status bar
set relativenumber
" Show filename in the window titlebar
set title
" Do not wrap lines
set nowrap
" Don't show the current mode 
set noshowmode
" Always show status line
set laststatus=2
" Show absolute numbers in insert mode, otherwise relative line numbers.
autocmd vimrc InsertEnter * :set norelativenumber
autocmd vimrc InsertLeave * :set relativenumber
" Make it obvious where 80 characters is
set textwidth=121
let &colorcolumn="81,".join(range(120,999),",")
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
" Enable syntax highlighting
syntax on
" Enable TrueColor
" FIXME this seems to be broken
"set termguicolors


"
" Scrolling
"

" Start scrolling three lines before horizontal border of window
set scrolloff=3
" Start scrolling three columns before vertival border of window
set sidescrolloff=3
" Copy indent from last line when starting new line
set autoindent
" The number of spaces for indenting
set shiftwidth=2
" At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth
" spaces
set smarttab
" Tab key results in 2 spaces
set softtabstop=2
" Tabs indent only 2 spaces
set tabstop=2
" Expand tabs to spaces
set expandtab


"
" Reformatting
"

" Only insert single space after a '.', '?' and '!' with a join command.
set nojoinspaces " Only insert single space after a '.', '?' and '!' with a join command.


"
" Search / replace
"

" By default, add g flag to search/replace. Add g to toggle
set gdefault
" Highlight searches
set hlsearch
" Highlight dynamically as pattern is typed
set incsearch
" Ignore case of searches
set ignorecase
" Ignore 'ignorecase' if search pattern containes uppercase characters
set smartcase


"
" Ignore things
"
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/log/*,*/tmp/*


"
" Vim commands
"

" When a buffer is brought to foreground, remember undo history and marks
set hidden
" Show all changes
set report=0
" Enable mouse in all modes
set mouse=a
" Hide intro menu
set shortmess+=I


"
" Splits
"

" New split goes below
set splitbelow
" New split goes right
set splitright
" Ctrl-J/K/L/H select split
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h


"
" Buffer navigation
"

" List other buffers 
nnoremap <leader>b :CtrlPBuffer<CR>
" Switch between the last two files
" FIXME this seams to be broken:
"   No mapping found
"map <leader><leader>
" Next buffer
map gb :bnext<CR>
" Prev buffer
map gB :bprev<CR>
" Ctrl-J, the opposite of Shift-J
nnoremap <C-J> a<CR><Esc>k$
" Jump to buffer number 1-9 with ,<N> or 1-99 with <N>gb
let c = 1
while c <= 99
  if c < 10
    execute "nnoremap <silent> <leader>" . c . " :" . c . "b<CR>"
  endif
  execute "nnoremap <silent> " . c . "gb :" . c . "b<CR>"
  let c += 1
endwhile


"
" Paging
"

" Fix page up and down
map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>


"
" Formatting
"

" Use Q for formatting the current paragraph (or selection)
" vmap Q gq
" nmap Q gqap


"
" Sudo
"

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %


"
" Cursor positioning
"

" When editing a file, always jump to the last known cursor position. Don't do
" it for commit messages, when the position is invalid, or when inside an event
" handler (happens when dropping a file on gvim).
autocmd vimrc BufReadPost *
  \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif


"
" vimrc editing
"

" F12: Source .vimrc & .gvimrc files
nmap <F12> :call SourceConfigs()<CR>

if !exists("*SourceConfigs")
  function! SourceConfigs()
    let files = ".vimrc"
    source $MYVIMRC
    if has("gui_running")
      let files .= ", .gvimrc"
      source $MYGVIMRC
    endif
    echom "Sourced " . files
  endfunction
endif


"
" File types
"
autocmd vimrc BufRead .vimrc,*.vim set keywordprg=:help
autocmd vimrc BufRead,BufNewFile *.md set filetype=markdown
autocmd vimrc BufRead,BufNewFile *.tmpl set filetype=html
autocmd vimrc FileType sql :let b:vimpipe_command="psql mydatabase"
autocmd vimrc FileType sql :let b:vimpipe_filetype="postgresql"


"
" Plugin configuration
"

" Airline
" let g:airline_theme='kalisi'
let g:airline_powerline_fonts = 1 " TODO: detect this?
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s '
let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#tabline#fnamecollapse = 0
"let g:airline#extensions#tabline#fnamemod = ':t'

" NERDTree
let NERDTreeShowHidden = 1
let NERDTreeMouseMode = 2
let NERDTreeMinimalUI = 1
map <leader>n :NERDTreeToggle<CR>
autocmd vimrc StdinReadPre * let s:std_in=1
" If no file or directory arguments are specified, open NERDtree.
" If a directory is specified as the only argument, open it in NERDTree.
autocmd vimrc VimEnter *
  \ if argc() == 0 && !exists("s:std_in") |
  \   NERDTree |
  \ elseif argc() == 1 && isdirectory(argv(0)) |
  \   bd |
  \   exec 'cd' fnameescape(argv(0)) |
  \   NERDTree |
  \ end

" Signify
let g:signify_vcs_list = ['git', 'hg', 'svn']

" CtrlP.vim
" map <leader>p <C-P>
" map <leader>r :CtrlPMRUFiles<CR>
"let g:ctrlp_match_window_bottom = 0 " Show at top of window

" Vim-pipe
let g:vimpipe_invoke_map = '<Leader>r'
let g:vimpipe_close_map = '<Leader>p'

" Indent Guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" python-mode
let g:pymode_python = 'python3'


"
" Vim distribution compatibility
"
if has('nvim')
    " Neovim specific commands
else
    " Standard vim specific commands
endif


"
" Plugins dependencies
"

" https://github.com/junegunn/vim-plug
" Reload .vimrc and :PlugInstall to install plugins.
call plug#begin('~/.vim/plugins')

" Define bundles via Github repos
Plug 'bling/vim-airline'
Plug 'freeo/vim-kalisi'
Plug 'tpope/vim-sensible'
Plug 'christoomey/vim-run-interactive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'janko-m/vim-test'
Plug 'kchmck/vim-coffee-script'
Plug 'pbrisbin/vim-mkdir'
Plug 'scrooloose/syntastic'
Plug 'mhinz/vim-signify'
Plug 'editorconfig/editorconfig-vim'
Plug 'klen/python-mode', {'for': 'python'}
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

if filereadable(expand("~/.vimrc.bundles.local"))
  source ~/.vimrc.bundles.local
endif

call plug#end()
