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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Auto Pairs
Plug 'jiangmiao/auto-pairs'

" Auto Format
" Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" Nerd Tree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

"Plug 'lervag/vimtex'
"Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

Plug 'ctrlpvim/ctrlp.vim'

"Plug 'valloric/youcompleteme'

Plug 'tpope/vim-surround'

"Plug 'scrooloose/syntastic'

Plug 'scrooloose/nerdcommenter'

"Plug 'plasticboy/vim-markdown'

Plug 'junegunn/goyo.vim'

Plug 'mhinz/vim-startify'

"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

"Plug 'vim-scripts/TaskList.vim'

call plug#end()
"

" --------------------Custom config-------------------
set bg=dark
"set encoding=utf-8
"set fileencoding=utf-8
"set termencoding=utf-8
"set cursorline
set number
set relativenumber
set nocompatible
set showmode
set showcmd
"set t_Co=256

syntax on
set wrap
filetype plugin indent on
set clipboard+=unnamedplus
let mapleader = " "
"let maplocalleader = ";"
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

""don't nag me when hiding buffers
"set hidden " allow me to have buffers with unsaved changes.
"set autoread " when a file has changed on disk, just load it. Don't ask.

" Make search more sane
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.

" So we don't have to reach for escape to leave insert mode.
inoremap jf <esc>
"let g:vimtex_view_general_viewer = 'SumatraPDF'
"let g:livepreview_previewer = 'SumatraPDF'


" SHORTCUTS
" create new vsplit, and switch to it.
noremap <leader>v <C-w>v
noremap <leader>n :NERDTreeToggle<CR>
" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <leader><space> :let @/=''<cr> " clear search

" Copy Paste
vnoremap <C-c> "+y
" map <C-> "+P
autocmd vimenter * nested colorscheme gruvbox
" colorscheme gruvbox

" Call the .vimrc.plug file
" if filereadable(expand(".vimrc.plug"))
"    source .vimrc.plug
" endif
" ------------Airline config---------------

" let g:airline_powerline_fonts = 1
" let g:Powerline_symbols = 'fancy'
" set guifont=Liberation_Mono_for_Powerline:h10

" Git Gutter
set updatetime=250
let g:gitgutter_enabled = 1
noremap <leader>hf :GitGutterFold<CR>
noremap <leader>gb :Gblame<CR>
highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff2222 ctermfg=Red

" Block cursor
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
