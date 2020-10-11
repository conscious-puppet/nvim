" We should specify where we want Startify to keep our sessions
let g:startify_session_dir = '$HOME/.config/nvim/session'

" Startify Lists
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]

" Bookmarks
"let g:startify_bookmarks = [
"                          \ 'C:\Users\abhishek\Documents\competitive programming',
"                          \ 'C:\Users\abhishek\Documents\competitive programming\p',
"                          \ 'C:\Users\abhishek\Documents\competitive programming\cp_challenges',
"                          \  {'i': 'C:\Users\abhishek\AppData\Local\nvim\init.vim'},
"                          \ ]

let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ '~/Documents/competitive_programming',
            \ '~/Documents/competitive_programming/p',
            \ '~/Documents/competitive_programming/cp_challenges',
            \ ]

" Configuration options
let g:startify_session_autoload = 1

let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0


let g:startify_custom_header = [		
   \'            __         __         __   __  ',
   \'     ____ _/ /_  _____/ /_  ___  / /__/ /_ ',
   \'    / __ `/ __ \/ ___/ __ \/ _ \/ //_/ __ \',
   \'   / /_/ / /_/ (__  ) / / /  __/ ,< / / / /',
   \'   \__,_/_.___/____/_/ /_/\___/_/|_/_/ /_/',                                      
   \]
