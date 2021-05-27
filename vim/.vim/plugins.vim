set runtimepath+=~/.vim/

if empty(glob('~/.vim/autoload/plug.vim'))
  silent call system('mkdir -p ~/.vim/{autoload,bundle,cache,undo,backups,swaps}')
  silent call system('curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  execute 'source  ~/.vim/autoload/plug.vim'
  augroup plugsetup
    au!
    autocmd VimEnter * PlugInstall
  augroup end
endif

call plug#begin('~/.vim/plugged')

" colors
Plug 'yunlingz/equinusocio-material.vim'
Plug 'luochen1990/rainbow'

" programming
if has('nvim')
    Plug 'Shougo/deoplete.nvim', has('nvim') ? {} : { 'do': [ ':UpdateRemotePlugins', ':set runtimepath+=~/.vim/plugged/deoplete.nvim/' ]}
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'ajh17/VimCompletesMe'
Plug 'codota/tabnine-vim', {'on': []}
augroup loadYcm
  au!
  autocmd InsertEnter * call plug#load('tabnine-vim') | au! loadYcm
augroup end
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'psf/black'

" stylize
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'


call plug#end()
