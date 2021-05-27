" colors
let g:equinusocio_material_style = 'darker'
let g:equinusocio_material_hide_vertsplit = 1
let g:equinusocio_material_bracket_improved = 1
colorscheme equinusocio_material
hi Normal guibg=NONE ctermbg=NONE

" completions

if has('nvim')
    let g:deoplete#enable_at_startup = 1
endif

" lightline http://git.io/lightline
let g:lightline = {
  \ 'colorscheme': 'equinusocio_material',
  \ }
