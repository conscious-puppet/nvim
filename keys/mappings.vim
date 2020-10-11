" 'Q' in normal mode enters Ex mode. You almost never want this.
nmap Q <Nop> 

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" I hate escape more than anything else
" inoremap jk <Esc>
" inoremap kj <Esc>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
" nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" tl in general mode will move to next tab
nnoremap tl :tabn<CR>
" th will go back
nnoremap th :tabp<CR>

" tn for new tab
nnoremap tn :tabnew<CR>

" t<delete> to close the tab
nnoremap t<delete> :tabclose<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>
" Use control-c instead of escape
nnoremap <C-c> :SClose<CR>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da


" clears highlights
nnoremap // :noh<return> 

" LaunchTerminal in vertical split
nnoremap \\ :vsp <bar> :te<enter>

" Switch to normal mode in terminal with Esc
tnoremap <Esc> <C-\><C-n>



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
