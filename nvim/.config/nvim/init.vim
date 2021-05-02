" Special NeoVim settings {{{
" Documentation: https://is.gd/a7O8th
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
" }}}

" Set Environment variable for init.vim so that I can easily get there {{{
let $MYRC="$XDG_CONFIG_HOME/nvim/init.vim"
" }}}

" Plugin Management {{{
call plug#begin('~/.local/share/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Gotta ride that coc
Plug 'junegunn/fzf.vim'                         " #1 plugin that I absolutely NEED
Plug 'tpope/vim-commentary'                     " gcc to comment anything baby
Plug 'tpope/vim-fugitive'                       " It really should be illegal
Plug 'tpope/vim-repeat'                         " Great for . with plugin stuff
Plug 'tpope/vim-surround'                       " This should be built into vim, honestly.
Plug 'tpope/vim-vinegar'                        " sensible defaults and some mappings for netrw
Plug 'ap/vim-css-color'                         " Adds some visual bling
Plug 'sheerun/vim-polyglot'                     " Add support for more languages in vim
Plug 'vim-airline/vim-airline'                  " Nice coloured bottom status bar and tab bar
Plug 'honza/vim-snippets'                       " Commonly used vim snippets
call plug#end()
" }}}

" Basic settings {{{
let mapleader = " "             " <Space> as leader key
let g:netrw_dirhistmax = 0      " remove directory history everytime we open netrw
set encoding=utf-8
set noswapfile                  " fucking hate this shit
set nobackup                    " hate this too
set tm=300                      " set timeoutlen for a sequence of keys to complete
set hidden                      " allow switching out of unsaved buffers
set number
set relativenumber
set mouse=a                     " enable mouse support
set nowrap                      " no wrap in code files
set splitbelow splitright       " normal splitting behaviour for panes
set shiftwidth=2 softtabstop=2 
set expandtab shiftround        " code indentation stuff
set colorcolumn=100             " 100 columns is a good size for modern times
set clipboard=unnamed           " Mac OS integration with system clipboard
"}}} 

" Eye candy {{{
set background=dark
colorscheme badwolf
" }}}

" File finding {{{
set path=.,,**                  " add ** to add all subchildren of current directory
set wildignore=**/node_modules/**,**/__pycache__/**,**/.git/** " ignore these directories
" }}}

" Faster code navigation and basic shit {{{
nnoremap J 10j
nnoremap K 10k
nnoremap H ^
nnoremap L $
nnoremap <C-q> :nohl<CR>        " remove highlights after search
" }}}

" FZF plugin {{{
if isdirectory('/usr/local/opt/fzf')
  set rtp+=/usr/local/opt/fzf   " add fzf directory to the vim runtimepath (homebrew installs here)
endif
if isdirectory($HOME.'/opt/fzf')
  set rtp+=$HOME/opt/fzf        " on some linux machines, I install fzf here
endif
" FZF mappings
nmap <Leader>p :Files<CR>
nmap <Leader>o :GFiles<CR>
" <Alt-f> translates to ƒ so this is used to "find"
nnoremap ƒ :BLines<CR>
" }}}

" Embedded terminal stuff {{{
set shellcmdflag-=ic            " Set the terminal to interactive so that I can use all my aliases
tnoremap <Esc> <C-\><C-n>       " get out of terminal mode easily without awkward \+n
tnoremap <M-[> <Esc>            " use <Meta-[> sequence to send <Esc> to terminal
augroup TerminalStuff
  au!
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
" }}}

" Import coc settings {{{
source $XDG_CONFIG_HOME/nvim/configs/coc-settings.vim
" }}}
