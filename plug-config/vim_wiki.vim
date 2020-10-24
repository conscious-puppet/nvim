" set this in ftplugins of vimwiki 
" change the functionality of tab in normal mode to <leader><tab>, by
" default it is in insert mode, so change it to normal mode

" config for path and settings
let wiki = {}
let wiki.path = '~/Documents/vimwiki'
" let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
let wiki.syntax = 'markdown'
let wiki.ext = '.md'
let wiki.links_space_char = '_'
" let wiki.auto_tags = 1
let g:vimwiki_list = [wiki]
" let g:vimwiki_list = [{'path': '~/Documents/vimwiki', 'syntax': 'markdown', 'ext': '.md', 'links_space_char': '_'}}]


" disable the <tab> mapping provided by vimwiki, which interferes with SuperTab
" let g:vimwiki_table_mappings = 0

" let g:vimwiki_global_ext = 0

" make the markdown cooments proper
" let g:vimwiki_filetypes = ['markdown', 'pandoc']

" change the symbols of checklist
" let g:vimwiki_listsyms = ' ○◐●✓'
" let g:vimwiki_listsyms = ' ○◐●X'

" to invoke and update diary
" command! Diary VimwikiDiaryIndex

augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    " this is slow
    " autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks
    " update only on writing the file
    autocmd BufWrite diary.md VimwikiDiaryGenerateLinks
    " to change the syntax to markdown
    autocmd BufWinEnter *.md setlocal syntax=markdown
    " for spellcheck
    autocmd BufWinEnter *.md setlocal spell
    " to correct the comment string
    autocmd BufWinEnter *.md setlocal commentstring=<!--%s-->
    " for every markdown set the file type as vimwiki
    " au BufRead,BufNewFile *.md set filetype=vimwiki
    " list stuff
    " autocmd FileType vimwiki inoremap <silent><buffer> <CR>
              " \ <C-]><Esc>:VimwikiReturn 3 5<CR>
    " autocmd FileType vimwiki inoremap <silent><buffer> <S-CR>
              " \ <Esc>:VimwikiReturn 2 2<CR>
augroup end


" create new entry for today
command! CreateEntry VimwikiMakeDiaryNote

" replace enter with alt enter
nmap <A-CR> <Plug>VimwikiFollowLink

" replace tab with <cr> to follow the links in a page
nmap <f1> <Plug>VimwikiNextLink
nmap <S-f1> <Plug>VimwikiPrevLink

" the function to automatically update the todo list
function! UpdateTodo()

python3 << EOF
import re
import os, sys

def new_todo_list(current_file_name, current_file_object, todomd_object):
    current_file_lines = current_file_object.readlines()

    new_todo_file_list = []
    new_todo_line_list = []


    for i, line in enumerate(current_file_lines):

        if re.search(r"^\s*[-*]\s\[[\s.oO]\]", line):
            value = f"{current_file_name}:{i+1} {line}"
            new_todo_file_list.append(value)
            l = f"{current_file_name}:{i+1}"
            new_todo_line_list.append(l)

    todo_file_lines = todomd_object.readlines()
    todo_list = []

    for l in todo_file_lines:
        if current_file_name in l:
            continue
        todo_list.append(l)

    while len(todo_list) > 0 and todo_list[0] == "\n":
        todo_list = todo_list[1:]
        
    while len(todo_list) > 0 and todo_list[-1] == "\n":
        todo_list = todo_list[:-1]

    new_todo_file = "".join(todo_list) + "\n" + "".join(new_todo_file_list)
    return new_todo_file

def todo_driver():
    current_file_name = vim.eval("current_f")
    todomd_name = vim.eval("todo_f")

    todomd_object = open(todomd_name, "r")
    current_file_object = open(current_file_name, "r")

    new_todo_file = new_todo_list(current_file_name, current_file_object, todomd_object)
    todomd_object.close()
    current_file_object.close()
    
    todomd_object = open(todomd_name, "w")
    todomd_object.write(new_todo_file)

EOF
let current_f = expand('%:p')
let todo_f = "/home/abhishek/Documents/vimwiki/TODO/general_list.md"
let path = "/home/abhishek/Documents/vimwiki/TODO"

if(current_f =~? path)
  return
endif
if(current_f ==? todo_f)
  return
endif

if bufexists(todo_f)
  execute "e ".todo_f." | up! | bprev"
endif

python3 todo_driver()

endfunction

augroup updatetodo
  autocmd!
  " after writing *.md file, update todo
  au BufWritePost *.md call UpdateTodo()
  " before leaving the todo file, write it
  " au BufLeave /home/abhishek/Documents/vimwiki/TODO/general_list.md up!
  " autocmd User Startified set buftype="startify"
augroup END


" for spellcheck in the vimwiki. it corrects the spelling by selecting the
" first suggestion. 
" function! FixLastSpellingError()
"   " normal! mm[s1z=`m"
"   normal! mm1z=`m"
" endfunction
" nnoremap <leader>sp :call FixLastSpellingError()<cr>

" to track all the incomplete tasks all over the places in wiki
" function! VimwikiFindIncompleteTasks()
  " lvimgrep /- \[ \]/ %:p
  " lopen
" endfunction

" serches for the tasks and automatically closes the vertical split if there are no tasks
" function! VimwikiFindAllIncompleteTasks()
"   VimwikiSearch /[-*] \[[ ○◐●]\]/
"   lopen
"   if line('$') == 1 && getline(1) == ''
"     bd
"     q
"   endif
" endfunction

" nmap <Leader>wa :vsp <bar> call VimwikiFindAllIncompleteTasks()<CR>
" nmap <Leader>wx :call VimwikiFindIncompleteTasks()<CR>
" nmap <leader>ww <Plug>VimwikiIndex <bar> :vsp <bar> call VimwikiFindAllIncompleteTasks()<CR>
