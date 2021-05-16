" use vim settings, rather than vi settings
" must be first, because it changes other options as a side effect
set nocompatible

" maintain undo history between sessions
set undofile
set undodir=~/.vim/undo
set noswapfile

" show line numbers
set number
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

hi BgColor guibg=#3A3A3A guifg=#ffffff ctermbg=237 ctermfg=255
hi ModColor guibg=#3A3A3A guifg=#afaf00 ctermbg=237 ctermfg=142
hi StatColor guibg=#3a3a3a guifg=#ffffff ctermbg=237 ctermfg=255
hi GitColor guibg=#4e4e4e guifg=#ffffff ctermbg=239 ctermfg=255
hi VoidColor guibg=#222222 guifg=#4e4e4e ctermbg=NONE ctermfg=239
hi TypeColor guibg=#D78700 guifg=#262626 ctermbg=66 ctermfg=235
hi PosColor guibg=#8787AF guifg=#262626 ctermbg=103 ctermfg=235

function! WizardStatus(mode)
    let statusline="%#BgColor#"
    if &modified == 1
    let statusline.="%#ModColor# »» "
    else
        let statusline.="    " 
    endif
    if &readonly != ''
        hi StatColor guifg=#af0000 ctermfg=124
    endif
    let statusline.="%#StatColor#%F " 
    let statusline .= '%#VoidColor#▓▒░  '
    let statusline .= "%=%h%w\ %#TypeColor#▓"
    if &filetype != ''
        let statusline .="▒ %Y "
    endif
    let statusline .="▒ %{&encoding}:%{&fileformat} %#PosColor#▒ %p%% ░ %l/%L\.\%c\ ▒"
    return statusline
endfunction

au WinEnter * setlocal statusline=%!WizardStatus('Enter')
au WinLeave * setlocal statusline=%!WizardStatus('Leave')
set statusline=%!WizardStatus('Enter')

function! Colorize(mode)
  if a:mode == 'i'
    hi StatColor guibg=#D78700 guifg=#222222 ctermbg=110 ctermfg=235
  elseif a:mode == 'r'
    hi StatColor guibg=#D78700 guifg=#222222 ctermbg=172 ctermfg=235
  elseif a:mode == 'v'
    hi StatColor guibg=#D78700 guifg=#222222 ctermbg=172 ctermfg=235
  else
    hi StatColor guibg=#af0000 guifg=#222222 ctermbg=124  ctermfg=235
  endif
endfunction 

au InsertEnter * call Colorize(v:insertmode)
au InsertLeave * hi StatColor guibg=#3a3a3a guifg=#ffffff ctermbg=237 ctermfg=255

" sourcerer -- a vim color scheme
" forked from http://git.io/sorcerer.vim by Jeet Sukumaran
" mods by xero harrison (http://git.io/xero)

set background=dark
hi clear
set t_Co=256
let colors_name = "sorcerer"

hi Normal                 cterm=NONE             ctermbg=NONE  ctermfg=145
hi ColorColumn            cterm=NONE             ctermbg=16    ctermfg=NONE
hi Cursor                 cterm=NONE             ctermbg=241   ctermfg=fg
hi CursorColumn           cterm=NONE             ctermbg=16    ctermfg=fg
hi CursorLine             cterm=NONE             ctermbg=236   ctermfg=fg
hi DiffAdd                cterm=NONE             ctermbg=71    ctermfg=16
hi DiffDelete             cterm=NONE             ctermbg=124   ctermfg=16
hi DiffChange             cterm=NONE             ctermbg=68    ctermfg=16
hi DiffText               cterm=NONE             ctermbg=117   ctermfg=16
hi Directory              cterm=NONE             ctermbg=234   ctermfg=33
hi ErrorMsg               cterm=bold             ctermbg=NONE  ctermfg=203
hi FoldColumn             cterm=bold             ctermbg=239   ctermfg=66
hi Folded                 cterm=NONE             ctermbg=16    ctermfg=60
hi IncSearch              cterm=bold             ctermbg=202   ctermfg=231
hi LineNr                 cterm=NONE             ctermbg=237   ctermfg=102
hi MatchParen             cterm=bold             ctermbg=NONE  ctermfg=226
hi ModeMsg                cterm=bold             ctermbg=NONE  ctermfg=145
hi MoreMsg                cterm=bold             ctermbg=234   ctermfg=29
hi NonText                cterm=NONE             ctermbg=NONE  ctermfg=59
hi Pmenu                  cterm=NONE             ctermbg=238   ctermfg=231
hi PmenuSbar              cterm=NONE             ctermbg=250   ctermfg=fg
hi PmenuSel               cterm=NONE             ctermbg=149   ctermfg=16
hi Question               cterm=bold             ctermbg=NONE  ctermfg=46
hi Search                 cterm=bold             ctermbg=185   ctermfg=16
hi SignColumn             cterm=NONE             ctermbg=NONE  ctermfg=231
hi SpecialKey             cterm=NONE             ctermbg=NONE  ctermfg=59
hi SpellBad               cterm=undercurl        ctermbg=NONE  ctermfg=196
hi SpellCap               cterm=undercurl        ctermbg=NONE  ctermfg=21
hi SpellLocal             cterm=undercurl        ctermbg=NONE  ctermfg=30
hi SpellRare              cterm=undercurl        ctermbg=NONE  ctermfg=201
hi StatusLine             cterm=bold             ctermbg=101   ctermfg=16
hi StatusLineNC           cterm=NONE             ctermbg=102   ctermfg=16
hi VertSplit              cterm=NONE             ctermbg=102   ctermfg=102
hi TabLine                cterm=bold             ctermbg=102   ctermfg=16
hi TabLineFill            cterm=NONE             ctermbg=102   ctermfg=16
hi TabLineSel             cterm=bold             ctermbg=16    ctermfg=59
hi Title                  cterm=bold             ctermbg=NONE  ctermfg=66
hi Visual                 cterm=NONE             ctermbg=67    ctermfg=16
hi WarningMsg             cterm=NONE             ctermbg=234   ctermfg=208
hi WildMenu               cterm=NONE             ctermbg=116   ctermfg=16
hi ExtraWhitespace        cterm=NONE             ctermbg=66    ctermfg=fg

hi Comment                cterm=NONE             ctermbg=NONE  ctermfg=59
hi Boolean                cterm=NONE             ctermbg=NONE  ctermfg=208
hi String                 cterm=NONE             ctermbg=NONE  ctermfg=101
hi Identifier             cterm=NONE             ctermbg=NONE  ctermfg=145
hi Function               cterm=NONE             ctermbg=NONE  ctermfg=230
hi Type                   cterm=NONE             ctermbg=NONE  ctermfg=103
hi Statement              cterm=NONE             ctermbg=NONE  ctermfg=110
hi Keyword                cterm=NONE             ctermbg=NONE  ctermfg=110
hi Constant               cterm=NONE             ctermbg=NONE  ctermfg=208
hi Number                 cterm=NONE             ctermbg=NONE  ctermfg=172
hi Special                cterm=NONE             ctermbg=NONE  ctermfg=64
hi PreProc                cterm=NONE             ctermbg=NONE  ctermfg=66
hi Todo                   cterm=bold,underline   ctermbg=234   ctermfg=96

hi diffOldFile            cterm=NONE             ctermbg=NONE  ctermfg=67
hi diffNewFile            cterm=NONE             ctermbg=NONE  ctermfg=67
hi diffFile               cterm=NONE             ctermbg=NONE  ctermfg=67
hi diffLine               cterm=NONE             ctermbg=NONE  ctermfg=67
hi diffAdded              cterm=NONE             ctermfg=NONE  ctermfg=71
hi diffRemoved            cterm=NONE             ctermfg=NONE  ctermfg=124
hi diffChanged            cterm=NONE             ctermfg=NONE  ctermfg=68

hi link                   diffSubname            diffLine
hi link                   diffOnly               Constant
hi link                   diffIdentical          Constant
hi link                   diffDiffer             Constant
hi link                   diffBDiffer            Constant
hi link                   diffIsA                Constant
hi link                   diffNoEOL              Constant
hi link                   diffCommon             Constant
hi link                   diffComment            Constant

hi pythonClass            cterm=NONE             ctermbg=NONE  ctermfg=fg
hi pythonDecorator        cterm=NONE             ctermbg=NONE  ctermfg=101
hi pythonExClass          cterm=NONE             ctermbg=NONE  ctermfg=95
hi pythonException        cterm=NONE             ctermbg=NONE  ctermfg=110
hi pythonFunc             cterm=NONE             ctermbg=NONE  ctermfg=fg
hi pythonFuncParams       cterm=NONE             ctermbg=NONE  ctermfg=fg
hi pythonKeyword          cterm=NONE             ctermbg=NONE  ctermfg=fg
hi pythonParam            cterm=NONE             ctermbg=NONE  ctermfg=fg
hi pythonRawEscape        cterm=NONE             ctermbg=NONE  ctermfg=fg
hi pythonSuperclasses     cterm=NONE             ctermbg=NONE  ctermfg=fg
hi pythonSync             cterm=NONE             ctermbg=NONE  ctermfg=fg

hi Conceal                cterm=NONE             ctermbg=248   ctermfg=252
hi Error                  cterm=NONE             ctermbg=196   ctermfg=231
hi Ignore                 cterm=NONE             ctermbg=NONE  ctermfg=234
hi InsertModeCursorLine   cterm=NONE             ctermbg=16    ctermfg=fg
hi NormalModeCursorLine   cterm=NONE             ctermbg=235   ctermfg=fg
hi PmenuThumb             cterm=reverse          ctermbg=NONE  ctermfg=fg
hi StatusLineAlert        cterm=NONE             ctermbg=160   ctermfg=231
hi StatusLineUnalert      cterm=NONE             ctermbg=238   ctermfg=144
hi Test                   cterm=NONE             ctermbg=NONE  ctermfg=fg
hi Underlined             cterm=underline        ctermbg=NONE  ctermfg=111
hi VisualNOS              cterm=bold,underline   ctermbg=NONE  ctermfg=fg
hi cCursor                cterm=reverse          ctermbg=NONE  ctermfg=fg
hi iCursor                cterm=NONE             ctermbg=210   ctermfg=16
hi lCursor                cterm=NONE             ctermbg=145   ctermfg=234
hi nCursor                cterm=NONE             ctermbg=NONE  ctermfg=145
hi vCursor                cterm=NONE             ctermbg=201   ctermfg=16
