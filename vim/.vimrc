" use vim settings, rather than vi settings
" must be first, because it changes other options as a side effect
set nocompatible

" paste without auto indentation
set paste

" maintain undo history between sessions
set undofile
set undodir=~/.vim/undo
set noswapfile

" file name tab completion
set wildmode=longest,list,full
set wildmenu

" case insensitive search
set ignorecase
set smartcase

" the /g flag on :s substitutions by default
set gdefault

" show matching brackets/parenthesis
set showmatch   

" make backspace behave in a sane manner
set backspace=indent,eol,start

" disable startup message
set shortmess+=I

" syntax highlighting and colors
syntax on
filetype plugin indent on

" stop unnecessary rendering
set lazyredraw

" show line numbers
set number

" no line wrapping
set nowrap

" searching
set hlsearch
set incsearch

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
nnoremap ; :

" enable file type detection and do language-dependent indenting
if has("autocmd")
  filetype on
  filetype indent on
  filetype plugin on
endif

" let mapleader=","
vnoremap <silent> <leader>y :w !xsel -i -b<CR>
nnoremap <silent> <leader>y V:w !xsel -i -b<CR>
nnoremap <silent> <leader>p :silent :r !xsel -o -b<CR>

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

set background=dark
