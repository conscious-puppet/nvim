
syntax on
colorscheme grb256


" for italic
" let g:vim_monokai_tasty_italic = 1

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE

    " The commands below are needed for tmux + termguicolors
    " This is only necessary if you use "set termguicolors".
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    " fixes glitch? in colors when using vim with tmux
    set background=dark
    set t_Co=256
endif
