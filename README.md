My Dotfiles
===========

This is a collection of files I have configured for my development environment.
Feel free to use whatever you find useful. However, I recommend
that you understand what settings you are using before applying them to your
own development environment.

Setting Up
----------
In order to do a full setup, run `sh bootstrap.sh` from the dotfiles directory.
This will ask you to verify that you want to run through the bootstrap process
and then configure the files from the setup folder for you.  

Plugins
-------
I use [vim-plug](https://github.com/junegunn/vim-plug) to manage my plugins.
Below is a list of the plugins I currently use (these can be located in
`setup/vim/.vimrc`).

| Plugin | Repository | Description |
| ------ | ---------- | ----------- |
| Dracula | [dracula/vim](https://github.com/dracula/vim) | Dark theme |
| Airline | [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline) | Lightweight status bar |
| YouCompleteMe | [valloric/youcompleteme](https://github.com/valloric/youcompleteme) | Autocompletion |
| NerdTree | [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree) | Directory browsing |
| Fugitive | [tpope/vim-fugitive](tpope/vim-fugitive) | Better git commands |
| Hard Mode | [wikitopian/hardmode](https://github.com/wikitopian/hardmode) | Stop using arrow keys and use hjkl |
| DelimitMate | [raimondi/delimitmate](https://github.com/raimondi/delimitmate)| Change surrounding quotations/tags easier |
| surround.vim | [tpope/vim-surround](https://github.com/tpope/vim-surround) | Automatically close brackets, parentheses, etc. |
| ctrlp.vim | [kien/ctrlp.vim](https://github.com/kien/ctrlp.vim) | Better way to find files/directories |
