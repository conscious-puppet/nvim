" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    
    Plug 'scrooloose/NERDTree'                                                " File Explorer
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'                            " File Explorer
    Plug 'jiangmiao/auto-pairs'                                               " Auto pairs for '(' '[' '{'
    Plug 'ryanoasis/vim-devicons'                                             " Cool Icons
    Plug 'vim-airline/vim-airline'                                            " Status Line
    Plug 'vim-airline/vim-airline-themes'                                     " Status Line
    Plug 'mhinz/vim-startify'                                                 " Start Screen
    Plug 'tpope/vim-surround'                                                 " change/insert surroundings --parentheses, brackets, quotes, XML tags
    Plug 'ryanoasis/vim-devicons'                                             " Icons
    " Plug 'rafi/awesome-vim-colorschemes'                                    " Themes
    " Plug 'joshdick/onedark.vim'                                             " Themes 
    " Plug 'drewtempelmeyer/palenight.vim'                                    " Themes 
    " Plug 'crusoexia/vim-monokai'                                            " Themes
    " Plug 'patstockwell/vim-monokai-tasty'                                   " Themes
    Plug 'morhetz/gruvbox'                                                    " Themes
    Plug 'norcalli/nvim-colorizer.lua'                                        " colors for html/css
    " Plug 'preservim/nerdcommenter'                                          " Comments
    Plug 'tpope/vim-commentary'                                               " Comments
    


    Plug 'neoclide/coc.nvim', {'branch': 'release'}                           " Intellisense --code completion
    " Plug 'mattn/emmet-vim'                                                  " Emmet for auto completion of html/css used by vs code as well
    "Plug 'Raimondi/delimitMate'
    " Plug 'vim-syntastic/syntastic'                                          " syntax checking
    Plug 'vimwiki/vimwiki'                                                    " vim-wiki notetaking tasks todo
    Plug 'suan/vim-instant-markdown', {'for': 'markdown'}                     " markdown live preview
    " Plug  'gabenespoli/capitalL.vim'                                        " easier location lists
    Plug 'sheerun/vim-polyglot'                                               " Better Syntax Support --syntax highlighting

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }                       " Fuzzy search
    Plug 'junegunn/fzf.vim'                                                   " Fuzzy search
    Plug 'airblade/vim-rooter'                                                " Fuzzy search

    call plug#end()
