" use vim settings, rather than vi settings
" must be first, because it changes other options as a side effect
set nocompatible

" security
set modelines=0

" maintain undo history between sessions
set undofile
set undodir=~/.vim/undo
set noswapfile

" show line numbers
set number relativenumber
" ruler
set ruler
" file name tab completion
set wildmode=longest,list,full
set wildmenu
set showcmd	"shows the normal mode command before it gets executed
set showmatch " show matching brackets/parenthesis

" encoding/format
set encoding=utf-8
set fileformats=unix,dos

" searching
set hlsearch " highlight search
set incsearch " incremental search
set ignorecase " case insensitive search
set smartcase " ignore case if no capitals

set gdefault " the /g flag on :s substitutions by default

set backspace=indent,eol,start " make backspace behave in a sane manner

" disable startup message
set shortmess+=I

" syntax highlighting and colors
syntax on
filetype plugin indent on

" stop unnecessary rendering
set lazyredraw

" no line wrapping
set nowrap

" no folding
set foldlevel=99
set foldminlines=99

" wrap long lines
set nowrap 

" use indents of 4 spaces
set shiftwidth=4

" tabs are spaces, not tabs
set expandtab

" an indentation every four columns
set tabstop=4

" let backspace delete indent
set softtabstop=4

" remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" make ; works like : for commands. lazy shifting
"nnoremap ; :

" enable file type detection and do language-dependent indenting
if has("autocmd")
  filetype on
  filetype indent on
  filetype plugin on
endif

" let mapleader=","
"vnoremap <silent> <leader>y :w !xsel -i -b<CR>
"nnoremap <silent> <leader>y V:w !xsel -i -b<CR>
"nnoremap <silent> <leader>p :silent :r !xsel -o -b<CR>

" Quicksave
noremap <Leader>s :update<CR>

" remap code completion to ^space
"inoremap <Nul> <C-x><C-o>
" inoremap <Nul> <C-n>

inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

" always display status line
set laststatus=2

" Esc in insert mode
inoremap kj <Esc>

" Esc in command mode
cnoremap kj <Esc>
