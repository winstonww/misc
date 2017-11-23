set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
set incsearch
set number
" cscope
" auto make and reload cscope database cscope.out
map <F6> :!cscope -Rb<CR>:cs reset<CR> :cs add cscope.out<CR><CR>
" abbreviation find all symbol to cc 
ab cc cs find s
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'  
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'lervag/vimtex'

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

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to

" ctrlp plugin set-up 
"set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_user_command = 'find %s -type f'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
" warning: cache needs to be clear manually now; use <F5> to reset cache 
"let g:ctrlp_clear_cache_on_exit=0

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

" Fast scrolling mapping 
:noremap j <C-E><C-E><C-E><C-E>
:noremap k <C-Y><C-Y><C-Y><C-Y>

" easy motion config
map  f <Plug>(easymotion-bd-f)
nmap <Leader>w <Plug>(easymotion-bd-w)

" c++ specific
ab hcpp **/*.h **/*.cpp

" grep; gr search text that contains word; gR search whole word
nmap gr :vimgrep /<C-R>=expand("<cword>")<CR>/gj **/*.h **/*.cpp<CR>:copen 20<CR>
nmap gR :vimgrep /<C-R>=expand("\b<cword>\b")<CR>/gj **/*.h **/*.cpp<CR>:copen 20<CR>

"syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"map global copy and paste
vnoremap <Leader>y "+y
noremap <Leader>p "+p

"map tn to tab drop
ca tn tabnew 

