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
Plug 'w0rp/ale'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'psf/black'
if has ('nvim')
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'
  Plug 'tzachar/compe-tabnine', { 'do': './install.sh' }
  Plug 'glepnir/dashboard-nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'romgrk/barbar.nvim'
endif
" snippets
Plug 'rafamadriz/friendly-snippets'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'Raimondi/delimitMate'

" stylize
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'


call plug#end()
