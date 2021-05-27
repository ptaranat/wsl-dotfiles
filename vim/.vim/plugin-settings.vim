" colors
let g:equinusocio_material_style = 'darker'
let g:equinusocio_material_hide_vertsplit = 1
let g:equinusocio_material_bracket_improved = 1
colorscheme equinusocio_material
hi Normal guibg=NONE ctermbg=NONE

" omnifuncs
augroup omnifuncs
  au!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
augroup end

" completions
let b:vcm_tab_complete = 'omni'
set omnifunc=syntaxcomplete#Complete
" accept completion with enter
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

if has('nvim')
    let g:deoplete#enable_at_startup = 1
    " cycle completions with tab
    inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
endif

" signify diff
let g:signify_realtime = 1
let g:signify_skip = {'vcs': { 'allow': ['git'] }}

" limit modelines
set nomodeline
let g:secure_modelines_verbose = 0
let g:secure_modelines_modelines = 15

" lightline http://git.io/lightline
let g:lightline = {
  \ 'colorscheme': 'equinusocio_material',
  \ }
