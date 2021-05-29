" banner
let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]

" colors
let g:equinusocio_material_style = 'darker'
let g:equinusocio_material_hide_vertsplit = 1
colorscheme equinusocio_material
"hi Normal guibg=NONE ctermbg=NONE
let g:rainbow_active = 1

" omnifuncs
augroup omnifuncs
  au!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=python3complete#Complete
augroup end

" completions
set completeopt=menuone,noselect
let b:vcm_tab_complete = 'omni'
set omnifunc=syntaxcomplete#Complete
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" treesitter
if has('nvim')
lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "bash", 
        "c",
        "cpp",
        "css",
        "dockerfile",
        "go",
        "gomod",
        "html",
        "javascript",
        "json",
        "lua",
        "python",
        "rust",
        "ruby",
        "toml",
        "yaml",
    },
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
        disable = {"python"}
    },
    incremental_selection = {
        enable = true,
    },
}
EOF
endif

" nvim-compe
if has('nvim')
  let g:compe = {}
  let g:compe.enabled = v:true
  let g:compe.source = {
    \ 'buffer': v:true,
    \ 'path': v:true,
    \ 'tags': v:true,
    \ 'spell': v:true,
    \ 'calc': v:true,
    \ 'nvim_lsp': v:true,
    \ 'nvim_treesitter': v:true,
    \ 'vsnip': v:true,
    \ 'tabnine': v:true,
    \ }
  inoremap <silent><expr> <C-Space> compe#complete()
  inoremap <silent><expr> <CR>      compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })
  inoremap <silent><expr> <C-e>     compe#close('<C-e>')
  inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
  inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
lua <<EOF
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF
endif

" dashboard
let g:mapleader="\<Space>"
let g:dashboard_default_executive ='telescope'
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

" signify diff
let g:signify_realtime = 1
let g:signify_skip = {'vcs': { 'allow': ['git'] }}

" indent lines
let g:indentLine_char = '│'
let g:indentLine_first_char = '│'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_fileTypeExclude = ['dashboard']
let g:indent_blankline_use_treesitter = 1
let g:indent_blankline_show_current_context = 1
let g:indent_blankline_show_end_of_line = 1
let g:indent_blankline_char = '│'

" linting
let g:ale_sign_column_always = 1
let g:ale_sign_error = ' '
let g:ale_sign_warning = ' '
let g:ale_fixers = {
  \ 'python': ['black'],
  \ 'go': ['gofmt'],
  \ }
let g:ale_fix_on_save = 1

" limit modelines
set nomodeline
let g:secure_modelines_verbose = 0
let g:secure_modelines_modelines = 15

" lightline http://git.io/lightline
let g:lightline = {
  \ 'colorscheme': 'equinusocio_material',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'readonly', 'filename', 'modified' ]
  \           ],
  \   'right': [
  \     ['ale'],
  \     ['lineinfo'],
  \     ['percent'],
  \     ['charcode', 'fileformat', 'filetype'],
  \   ]
  \ },
  \ 'inactive': {
  \   'left': [ [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component': {
  \   'filename': '%f'
  \ },
  \ 'component_function': {
  \   'fugitive': 'MyFugitive',
  \   'readonly': 'MyReadonly',
  \   'modified': 'MyModified',
  \   'ale': 'ALEGetStatusLine'
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
  \ }

function! MyModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "\u2b64"
  else
    return ""
  endif
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction

set noshowmode

augroup alestatus
  au!
  autocmd User ALELint call lightline#update()
augroup end

