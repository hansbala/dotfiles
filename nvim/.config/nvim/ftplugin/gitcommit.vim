" execute for git commit messages

function s:auto_goyo()
  if &ft == 'gitcommit'
    Goyo 80
  elseif exists('#goyo')
    let bufnr = bufnr('%')
    Goyo!
    execute 'b '.bufnr
  endif
endfunction

augroup commits
  autocmd!
"  autocmd BufEnter COMMIT_EDITMSG call s:auto_goyo()
augroup END
