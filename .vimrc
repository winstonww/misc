set nocompatible              " be iMproved, required filetype off                  
" required 
syntax on 
set incsearch 
set hlsearch
set nowrap 
set number 
set relativenumber 
set ignorecase 
set smartcase 
map <F6> :!ctags -R *<CR> 
" set the runtime path to include Vundle and initialize 
set rtp+=~/.vim/bundle/Vundle.vim 
call vundle#begin() " alternatively, pass a path where Vundle should install plugins " 
Plugin 'VundleVim/Vundle.vim'
Plugin 'justinmk/vim-sneak'
"Plugin 'easymotion/vim-easymotion'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'  
Plugin 'morhetz/gruvbox'
Plugin 'ervandew/supertab'
Plugin 'mhinz/vim-startify'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab

" airline settings 
"let g:airline_powerline_fonts=m
set t_Co=256
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme = 'zenburn'

" set colorscheme
set background=dark
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
if g:colors_name == "gruvbox"
"List other overrides here
endif
" set mouse 

"set smart search; case senstive only if search pattern contains uppercase;
set ignorecase
set smartcase

"" Fast scrolling mapping 
noremap j 6<C-E>
noremap k 6<C-Y>
noremap h 10zh
noremap l 10zl
noremap J <Down>
noremap K <Up>
noremap H <Left>
noremap L <Right>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"easy motion config
" map  f <Plug>(easymotion-bd-f)
" nmap <Leader>w <Plug>(easymotion-bd-w)

" vim-sneak
let g:sneak#label = 1
map f <Plug>Sneak_s
map F <Plug>Sneak_S

" backspace problem in mac
set backspace=indent,eol,start

" terminal
tnoremap <Esc> <C-W>N
tnoremap <C-J> <C-W><C-J>
tnoremap <C-K> <C-W><C-K>
tnoremap <C-L> <C-W><C-L>
tnoremap <C-H> <C-W><C-H>

"map global copy and paste
 
augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
  autocmd WinLeave * setlocal nocursorline
  autocmd WinLeave * setlocal nocursorcolumn
augroup END
