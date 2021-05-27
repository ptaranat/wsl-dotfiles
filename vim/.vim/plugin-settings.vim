" colors
let g:equinusocio_material_style = 'darker'
let g:equinusocio_material_hide_vertsplit = 1
let g:equinusocio_material_bracket_improved = 1
colorscheme equinusocio_material
hi Normal guibg=NONE ctermbg=NONE

" completions
let b:vcm_tab_complete = 'omni'
set omnifunc=syntaxcomplete#Complete
" cycle completions with tab
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" accept completion with enter
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
let g:signify_realtime = 1
let g:signify_skip = {'vcs': { 'allow': ['git'] }}

if has('nvim')
    let g:deoplete#enable_at_startup = 1
endif

" lightline http://git.io/lightline
let g:lightline = {
  \ 'colorscheme': 'equinusocio_material',
  \ }
