let mapleader = " "

" vim plugin management
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/plugged"'))
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'preservim/nerdtree'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-commentary'
  Plug 'tomasr/molokai'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Basic settings
  set nocompatible
  filetype plugin on
  syntax on
  set encoding=utf-8
  set number relativenumber
  set splitbelow splitright
  set background=dark
  set autoindent
  set shiftwidth=4
  set softtabstop=4
  set tabstop=4
  set expandtab
  set smarttab
  set nowrap
  set mouse=a
  set clipboard=unnamed
  set ttimeoutlen=5

" Aesthetics
  set termguicolors
  colorscheme molokai
  set cursorline
  let g:airline_theme='molokai'

" Faster code navigation and workflow
  nmap <C-n> :NERDTreeToggle<CR>
  nnoremap <silent> J 10j
  nnoremap <silent> K 10k
  nnoremap <Leader>b ^
  nnoremap <Leader>e $
  nnoremap <silent> <C-l> :nohl<CR><C-l>

" fzf stuff
  nmap <C-p> :GFiles<CR>
  nmap <C-f> :BLines<CR>
  nmap <C-g> :Rg! 

" Code completion
  let g:deoplete#enable_at_startup = 1

" management of vim config
  nnoremap <Leader>ve :vert sf $XDG_CONFIG_HOME/nvim/init.vim<CR>
  nnoremap <Leader>vs :source $XDG_CONFIG_HOME/nvim/init.vim<CR>
