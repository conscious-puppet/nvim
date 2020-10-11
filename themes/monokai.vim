syntax on
colorscheme vim-monokai-tasty


" for italic
let g:vim_monokai_tasty_italic = 1

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
