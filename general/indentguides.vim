" refer to gist indentguides for original toggle function
function! ToggleIndentGuides()
      if !exists('b:indentguides')
          if !&expandtab && &tabstop == &shiftwidth
             let b:indentguides = 'tabs'
             let b:indentguides_listopt = &l:list
             let b:indentguides_listcharsopt = &l:listchars
             exe 'setl listchars' . '+'[!&l:list] . '=tab:˙\  list'
          else
             let b:indentguides = 'spaces'
             let pos = range(1, &textwidth > 0 ? &textwidth : 80, &shiftwidth)
             call map(pos, '"\\%" . v:val . "v"')
             let pat = '\%(\_^ *\)\@<=\%(' . join(pos, '\|') . '\) '
             let b:indentguides_match = matchadd('ColorColumn', pat)
          endif
      else
          if b:indentguides == 'tabs'
              let &l:list = b:indentguides_listopt
              let &l:listchars = b:indentguides_listcharsopt
              unlet b:indentguides_listopt b:indentguides_listcharsopt
          else
              call matchdelete(b:indentguides_match)
              unlet b:indentguides_match
         endif
         unlet b:indentguides
      endif
endfunction 


command! IndentGuides :call ToggleIndentGuides()
