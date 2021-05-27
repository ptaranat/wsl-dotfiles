"if (has('termguicolors'))
"  set termguicolors
"endif

set guifont=MesloLGS\ NF:h14
if exists("&termguicolors") && exists("&winblend")
  set termguicolors
  set winblend=10
  set wildoptions=pum
  set pumblend=10
endif
