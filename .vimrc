" Install vim-plug if it isn't already
if empty(glob('~/dotfiles/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/dotfiles/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


""" Plugins
" Install Plugins with `:PlugInstall`
call plug#begin('~/dotfiles/.vim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'valloric/youcompleteme'
Plug 'scrooloose/nerdtree'

call plug#end()


""" Color Scheme
" Configure Dracula to work
let g:dracula_italic = 0
colorscheme dracula
highlight Normal ctermbg=None


""" General
" Allow unsaved changes to be stashed when switching buffers
set hidden
" Disable swap files
set noswapfile
set number " insert line numbers
set timeoutlen=750 ttimeoutlen=0
" Allow backspacking over everything in insert mode
set backspace=indent,eol,start
" Keep 10000 lines of command history
set history=10000
" Update faster
set updatetime=250
set textwidth=80 " make it obvious where 80 characters is


""" Mappings
" Insert mode
" insert -> visual mode
inoremap jj <ESC>

" Visual mode
" visual -> normal mode
xnoremap jk <ESC>
xnoremap kj <ESC>


""" Autocmd
autocmd BufEnter * silent! lcd %:p:h " automatically cd into current buffer


""" NERDTree
let NERDTreeShowHidden=1
let NERDTreeDirArrows=0
let NERDTreeMinimalUI=0
" Change into directory when entering
let g:NERDTreeChDirMode = 2

" Start NERDTree automatically on vim startup
autocmd vimenter * NERDTree
" Close vim if only window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Ctrl + n toggles NERDTree
map <C-n> :NERDTreeToggle<CR>
" Map r to change pwd
map <leader>r :NERDTreeFind<cr>


""" YouCompleteMe
" Use either Enter or ctrl+y to select autocompletion
let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']
