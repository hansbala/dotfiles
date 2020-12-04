" Indentation and folding method for VimScript
set shiftwidth=2
" set foldmethod=marker

" Source the Vim file on save
augroup Vimrc
  autocmd!
  autocmd! BufWritePost .vimrc,init.vim source %
augroup END
