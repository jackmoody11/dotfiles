" Install vim-plug if it isn't already
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install Plugins with `:PlugInstall`
call plug#begin('~/.vim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

" Configure Dracula to work
set number
set termguicolors
let g:dracula_italic = 0
colorscheme dracula
highlight Normal ctermbg=None

