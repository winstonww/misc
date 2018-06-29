" Include the system settings
:if filereadable( "/etc/vimrc" )
   source /etc/vimrc
:endif

" Include Arista-specific settings
:if filereadable( $VIM . "/vimfiles/arista.vim" )
   source $VIM/vimfiles/arista.vim 
:endif 

"install vimplug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

syntax on 
set nocompatible
set incsearch 
set nowrap 
set number 
set relativenumber 
set ignorecase 
set smartcase 

"ctags
map <F6> :!ctags -R *<CR> 

"vim-plug plugins
call plug#begin()
Plug 'justinmk/vim-sneak'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'  
Plug 'morhetz/gruvbox'
Plug 'ervandew/supertab'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end()

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

" set terminal
:tnoremap <Esc> <C-W>N

" esc delay 
set timeoutlen=1000 ttimeoutlen=0

"set smart search; case senstive only if search pattern contains uppercase;
set ignorecase
set smartcase

"" Fast scrolling mapping 
:noremap j 6<C-E>
:noremap k 6<C-Y>
:noremap h 10zh
:noremap l 10zl
:noremap J <Down>
:noremap K <Up>
:noremap H <Left>
:noremap L <Right>

:nnoremap <C-J> <C-W><C-J>
:nnoremap <C-K> <C-W><C-K>
:nnoremap <C-L> <C-W><C-L>
:nnoremap <C-H> <C-W><C-H>

:tnoremap <C-J> <C-W><C-J>
:tnoremap <C-K> <C-W><C-K>
:tnoremap <C-L> <C-W><C-L>
:tnoremap <C-H> <C-W><C-H>

"vim-sneak
let g:sneak#label = 1
map f <Plug>Sneak_s
map F <Plug>Sneak_S

"map global copy and paste
set clipboard=unnamed
augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
  autocmd WinLeave * setlocal nocursorline
  autocmd WinLeave * setlocal nocursorcolumn
augroup END
