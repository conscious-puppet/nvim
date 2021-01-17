" plugins
source $HOME/.config/nvim/vim-plug/plugins.vim

" general settings paths
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/scratchpad.vim
source $HOME/.config/nvim/general/paths.vim

" mappings keys
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/keys/code_runner.vim

" themes
source $HOME/.config/nvim/themes/monokai.vim
source $HOME/.config/nvim/themes/airline.vim
source $HOME/.config/nvim/themes/indentlines.vim

" plugin configuration
source $HOME/.config/nvim/plug-config/coc.vim
luafile $HOME/.config/nvim/lua/plug-colorizer.lua
source $HOME/.config/nvim/plug-config/vim-instant-md.vim
source $HOME/.config/nvim/plug-config/tagbar.vim
source $HOME/.config/nvim/plug-config/floaterm.vim
