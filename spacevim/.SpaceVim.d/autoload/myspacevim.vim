function! myspacevim#before() abort
    inoremap kj <Esc>
    let g:material_theme_style = "darker"
endfunction

function! myspacevim#after() abort
	let g:neoformat_python_black = {
	    \ 'exe': 'black',
	    \ 'stdin': 1,
	    \ 'args': ['-q', '-'],
	    \ }
	let g:neoformat_enabled_python = ['black']
endfunction
