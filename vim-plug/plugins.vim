" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    
    " File Explorer
    Plug 'scrooloose/NERDTree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    
    " Cool Icons
    Plug 'ryanoasis/vim-devicons'
    
    " Intellisense
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    
    " Status Line
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    
    " Start Screen
    Plug 'mhinz/vim-startify'
    
    " Emmet for auto completion of html/css used by vs code as well
    Plug 'mattn/emmet-vim'
    
    " change/insert surroundings: parentheses, brackets, quotes, XML tags
    Plug 'tpope/vim-surround'
    
    "Plug 'Raimondi/delimitMate'
    
    " syntax checking
    Plug 'vim-syntastic/syntastic'
    
    " Icons
    Plug 'ryanoasis/vim-devicons'
    
    " Themes
    "Plug 'rafi/awesome-vim-colorschemes'
    Plug 'joshdick/onedark.vim'
    "Plug 'drewtempelmeyer/palenight.vim'
    Plug 'crusoexia/vim-monokai'
    Plug 'patstockwell/vim-monokai-tasty'

    " colors for html/css
    Plug 'norcalli/nvim-colorizer.lua'
    call plug#end()
