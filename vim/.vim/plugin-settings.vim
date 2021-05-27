" colors
let g:equinusocio_material_style = 'darker'
let g:equinusocio_material_hide_vertsplit = 1
colorscheme equinusocio_material
hi Normal guibg=NONE ctermbg=NONE
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

" linting
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = ' '
let g:ale_sign_warning = ' '
let g:ale_fixers = {'python': ['black']}
let g:ale_fix_on_save = 1

" limit modelines
set nomodeline
let g:secure_modelines_verbose = 0
let g:secure_modelines_modelines = 15

let s:startify_ascii_header = [
\ '    _   ____________ _    ________  ___',
\ '   / | / / ____/ __ \ |  / /  _/  |/  /',
\ '  /  |/ / __/ / / / / | / // // /|_/ /',
\ ' / /|  / /___/ /_/ /| |/ // // /  / /',
\ '/_/ |_/_____/\____/ |___/___/_/  /_/',
\ ''
\]
let g:startify_custom_header = map(s:startify_ascii_header, '"   ".v:val')
"let g:startify_custom_header = map(s:startify_ascii_header +
"        \ startify#fortune#quote(), '"   ".v:val')

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

