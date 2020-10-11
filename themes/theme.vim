let g:nord_bold_vertical_split_line = 1

highlight Comment cterm=italic gui=italic

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

"colorscheme gruvbox "dues desert anderson OceanicNext
colorscheme default
let g:palenight_terminal_italics=1
