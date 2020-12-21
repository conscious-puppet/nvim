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

" TAB in general mode will move to next buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>
" nnoremap <leader><TAB> :bnext<CR>

" tl in general mode will move to next tab
nnoremap tl :tabn<CR>
" th will go back
nnoremap th :tabp<CR>

" tn for new tab
nnoremap tn :tabnew<CR>

" t<delete> to close the tab
nnoremap t<delete> :tabclose<CR>

" Alternate way to save
" nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>



" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

" function! CleverTabNext()
" 	 if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
" 			return "\<Tab>"
" 	 else
" 			return "\<C-N>"
" 	 endif
" endfunction
" inoremap <Tab> <C-R>=CleverTabNext()<CR>

" function! CleverTabPrevious()
" 	 if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
" 			return "\<Tab>"
" 	 else
" 			return "\<C-N>"
" 	 endif
" endfunction
" inoremap <S-Tab> <C-R>=CleverTabPrevious()<CR>


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
" start terminal in insert mode
" au BufEnter * if &buftype == 'terminal' | :startinsert | endif
autocmd! TermOpen * startinsert

" replace gf with gF to jump on the file at the specified line
nnoremap gf gF
