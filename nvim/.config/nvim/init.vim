" Special NeoVim settings {{{
" Documentation: https://is.gd/a7O8th
let g:python_host_prog = '/usr/bin/python3'
let g:netrw_dirhistmax = 0
" }}}
" Basic settings {{{
syntax enable
filetype plugin indent on
set encoding=utf-8
set noswapfile                  " fucking hate this shit
set nobackup                    " hate this too
set hidden                      " allow switching out of unsaved buffers
set number
set relativenumber
set mouse=a                     " enable mouse support
set nowrap                      " no wrap in code files
set splitbelow splitright       " normal splitting behaviour for panes
set shiftwidth=2 softtabstop=2 
set expandtab shiftround        " code indentation stuff
set colorcolumn=100             " 100 columns is a good size for modern times
colorscheme badwolf
hi statusline ctermbg=darkgray ctermfg=white
"}}} 

" File finding {{{
set path=.,,**                  " add ** to add all subchildren of current directory
set wildignore=**/node_modules/**,**/__pycache__/**,**/.git/** " ignore these directories
" }}}

" Faster code navigation and basic shit {{{
nnoremap J 10j
nnoremap K 10k
nnoremap <C-l> :nohl<CR>        " remove highlights after searching with /
nnoremap <Leader>b ^
nnoremap <Leader>e $
" }}}

" FZF plugin {{{
if isdirectory('/usr/local/opt/fzf')
  set rtp+=/usr/local/opt/fzf   " add fzf directory to the vim runtimepath (homebrew installs here)
endif
if isdirectory($HOME.'/opt/fzf')
  set rtp+=$HOME/opt/fzf        " on some linux machines, I install fzf here
endif
" }}}

" Snippet Management {{{
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" }}}

" Embedded terminal stuff {{{
tnoremap <Esc> <C-\><C-n>       " get out of terminal mode easily without awkward \+n
tnoremap <M-[> <Esc>            " use <Meta-[> sequence to send <Esc> to terminal
augroup TerminalStuff
  au!
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
" }}}
