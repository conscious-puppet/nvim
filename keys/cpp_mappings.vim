

" CompileAndRun in vertical split terminal

" available options:
" * g:split_term_style
" * g:split_term_resize_cmd
"function! TermWrapper(command) abort
	"if !exists('g:split_term_style') | let g:split_term_style = 'vertical' | endif
	"if g:split_term_style ==# 'vertical'
		"let buffercmd = 'vnew'
	"elseif g:split_term_style ==# 'horizontal'
		"let buffercmd = 'new'
	"else
		"echoerr 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'' but is currently set to ''' . g:split_term_style . ''')'
		"throw 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'')'
	"endif
	"if exists('g:split_term_resize_cmd')
		"exec g:split_term_resize_cmd
	"endif
	"exec buffercmd
	"exec 'term ' . a:command
	"exec 'startinsert'
"endfunction
"
"command! -nargs=0 CompileAndRun call TermWrapper(printf('g++ -std=c++11 -O2 -Wall %s && ./a.out', expand('%')))
""command! -nargs=1 CompileAndRunWithFile call TermWrapper(printf('g++ -std=c++11 %s && ./a.out < %s', expand('%'), <args>))
"autocmd FileType cpp nnoremap <f6> :CompileAndRun<CR>


" compile and run in a new terminal window
autocmd FileType cpp nnoremap <f6> :w <bar> :!g++ -std=c++11 -O2 -Wall % && gnome-terminal -- bash -c "./a.out; bash"<CR>
