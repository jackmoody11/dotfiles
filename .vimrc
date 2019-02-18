" Install vim-plug if it isn't already
if empty(glob('~/dotfiles/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/dotfiles/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install Plugins with `:PlugInstall`
call plug#begin('~/dotfiles/.vim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'

call plug#end()

" Configure Dracula to work
let g:dracula_italic = 0
colorscheme dracula
highlight Normal ctermbg=None

""" General
set number " insert line numbers
set termguicolors " allow terminal colors
set timeoutlen=750 ttimeoutlen=0

set textwidth=80 " make it obvious where 80 characters is

""" Mappings
" Insert mode
inoremap jj <ESC>

" Visual mode
" For quickly escaping visual mode
xnoremap jk <ESC>
xnoremap kj <ESC>

""" Autocmd
autocmd BufEnter * silent! lcd %:p:h " automatically cd into current buffer
