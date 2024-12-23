"Line Numbers
set number
set relativenumber

set tabstop=4
set shiftwidth=4
filetype indent plugin on

" Appearance
syntax on
set termguicolors
colorscheme catppuccin_mocha

" Status Line
" Clear status line when vimrc is reloaded.
" 1. Left side
" 2. Middle divider
" 3. Right side
" 4. Status bar
set statusline=
set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=\ row:\ %l\ col:\ %c
set laststatus=2

