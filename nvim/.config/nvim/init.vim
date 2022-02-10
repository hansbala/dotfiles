let $MYRC = "$XDG_CONFIG_HOME/nvim/init.vim"

" Plugins
call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'mattn/emmet-vim'
call plug#end()

" Basic vim settings
let mapleader = " "
set noswapfile nobackup
set hidden
set clipboard=unnamed

" Appearance and moving around
set number relativenumber
set mouse=a
set nowrap

" Better vim settings
set splitbelow splitright
set incsearch nohlsearch
set ignorecase smartcase
set background=dark
colorscheme spacecamp
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" vim path settings
set path=.,,**
set wildignore=**/node_modules/**,**/__pycache__/**,**/.git/**

" Indentation
set expandtab
set autoindent
set smartindent

" moving around easier mappings
nnoremap J 10j
nnoremap K 10k
nnoremap H ^
nnoremap L $

" FZF keymappings
nnoremap <leader>p  :GFiles<CR>
nnoremap <leader>pp :Files<CR>
nnoremap <leader>bf :BuffersCR>
nnoremap <leader>f  :BLines<CR>
nnoremap <leader>ff :Rg 

" Emmet settings
let g:user_emmet_leader_key='`'
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

hi Normal guibg=NONE ctermbg=NONE

" autocommands
autocmd TermOpen * setlocal nonumber norelativenumber
