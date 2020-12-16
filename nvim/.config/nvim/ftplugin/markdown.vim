" Commands run for markdown filetype

function s:auto_goyo()
  if &ft == 'gitcommit'
    Goyo 80
  elseif exists('#goyo')
    let bufnr = bufnr('%')
    Goyo!
    execute 'b '.bufnr
  endif
endfunction

augroup markdown
  autocmd!
  autocmd BufRead,BufEnter,BufNewFile *.md call s:auto_goyo()
augroup END
