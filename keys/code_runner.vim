
" autocmd FileType cpp nnoremap <f6> :w <bar> :!g++ -std=c++11 -O2 -Wall % && gnome-terminal -- bash -c "./a.out; bash"<CR>
"
" augroup updatetodo
"   autocmd!
"   " after writing *.md file, update todo
"   au BufWritePost *.md call UpdateTodo()
" augroup END


" nnoremap \\ :FloatermNew --height=0.2 --wintype=normal --position=bottom<CR>

" start terminal in insert mode
" au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" autocmd! TermOpen * 10 wincmd -
"
" sp | resize -10 | te
"


augroup coderunner
  autocmd!
  au FileType cpp nnoremap \\ <esc> :w <bar> :!g++ -std=c++11 -O2 -Wall % -o %:p:r <NL> :sp <bar> resize -10 <bar> te cd %:p:h; %:p:r; zsh<CR>
  au FileType python nnoremap \\ <esc> :w <bar> sp <bar> resize -10 <bar> te cd %:p:h; python3 %; zsh<CR>
  au FileType javascript nnoremap \\ <esc> :w <bar> sp <bar> resize -10 <bar> te cd %:p:h; node %; zsh<CR>
  au FileType html nnoremap \\ <esc> :w <bar> FloatermNew live-server % <CR>
augroup END



