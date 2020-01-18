" --------------------Default config-------------------

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards compatible.
" The ! means the package won't be loaded right away but when plugins are loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" --------------------Plugin-------------------

call plug#begin('~/.vim/plugged')

"Fugitive Vim Github Wrapper
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" buttom bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Color Scheme
Plug 'morhetz/gruvbox'

" Auto completion - Use release branch (Recommend)
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Auto Pairs
Plug 'jiangmiao/auto-pairs'

" Auto Format
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" Nerd Tree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'


call plug#end()
"

" --------------------Custom config-------------------
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

set number
set relativenumber
set nocompatible
set showmode
set showcmd
set t_Co=256
" set cursorline

syntax on
set wrap
filetype plugin indent on
set clipboard=unnamedplus
let mapleader = " "
set wildmode=longest,list,full

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set smartindent " Intellegently dedent / indent new lines based on rules.

" We have VCS -- we don't need this stuff.
set nobackup " We have vcs, we don't need backups.
set nowritebackup " We have vcs, we don't need backups.
set noswapfile " They're just annoying. Who likes them?

" don't nag me when hiding buffers
set hidden " allow me to have buffers with unsaved changes.
set autoread " when a file has changed on disk, just load it. Don't ask.

" Make search more sane
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" So we don't have to reach for escape to leave insert mode.
inoremap jf <esc>

" SHORTCUTS
" create new vsplit, and switch to it.
noremap <leader>v <C-w>v
noremap <leader>n :NERDTreeToggle<CR>
" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Copy Paste
vnoremap <C-c> "+y
map <C-v> "+P

colorscheme gruvbox
" Call the .vimrc.plug file
" if filereadable(expand(".vimrc.plug"))
"    source .vimrc.plug
" endif
" ------------Airline config---------------

" let g:airline_powerline_fonts = 1
" let g:Powerline_symbols = 'fancy'
" set guifont=Liberation_Mono_for_Powerline:h10
