" enable tabline
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline#extensions#tabline#right_sep = ''
" let g:airline#extensions#tabline#right_alt_sep = ''

" enable powerline fonts
let g:airline_powerline_fonts = 1
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''

" Switch to your current theme
" let g:airline_theme = 'onedark'
let g:airline_theme = 'monokai_tasty'
" let g:airline_theme = 'base16_grayscale'
" let g:airline_theme = 'gruvbox'
" let g:airline_theme = 'term'

" coc extension integration
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = 'E:'
let airline#extensions#coc#warning_symbol = 'W:'
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

set statusline^=%{coc#status()}


" enable fzf integration
let g:airline#extensions#fzf#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = '|'
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = '|'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ':'
let g:airline_symbols.maxlinenr = ' '


" define the set of names to be displayed instead of a specific filetypes (for section a and b): >


let g:airline_filetype_overrides = {
    \ 'coc-explorer':  [ 'CoC Explorer', '' ],
    \ 'defx':  ['defx', '%{b:defx.paths[0]}'],
    \ 'fugitive': ['fugitive', '%{airline#util#wrap(airline#extensions#branch#get_head(),80)}'],
    \ 'gundo': [ 'Gundo', '' ],
    \ 'help':  [ 'Help', '%f' ],
    \ 'minibufexpl': [ 'MiniBufExplorer', '' ],
    \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', 'NERD'), '' ],
    \ 'startify': [ 'startify', '' ],
    \ 'vim-plug': [ 'Plugins', '' ],
    \ 'vimfiler': [ 'vimfiler', '%{vimfiler#get_status_string()}' ],
    \ 'vimshell': ['vimshell','%{vimshell#get_status_string()}'],
    \ 'vaffle' : [ 'Vaffle', '%{b:vaffle.dir}' ],
    \ }



" configure the layout of the sections by specifying an array of two arrays (first array is the left side, second array is the right side). >

let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c' ],
    \ [ 'x', 'y', 'error', 'warning', 'z' ]
    \ ]



" * enable/disable fzf integration >
let g:airline#extensions#fzf#enabled = 1



call airline#parts#define_accent('linenr', 'bold')
call airline#parts#define_accent('maxlinenr', 'bold')
