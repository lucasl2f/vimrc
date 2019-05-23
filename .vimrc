" tab to be 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab
set number

set colorcolumn=100

set incsearch
set hlsearch

set noswapfile

" turn mouse on for all modes
set mouse=a

" highlight active line
set cursorline

call plug#begin('~/.vim/plugged')

" Themes
" ===================================================================
Plug 'KKPMW/sacredforest-vim'
Plug 'phanviet/vim-monokai-pro'
Plug 'BrainDeath0/Hypsteria'
Plug 'aradunovic/perun.vim'
Plug 'vim-scripts/greenvision'
Plug 'rakr/vim-two-firewatch'
Plug 'dracula/vim', { 'as': 'dracula' }


" Comment / Uncomment (visual selection + gc, gc<movement> or gcc (1 line)
"====================================================================
Plug 'tomtom/tcomment_vim'


" Fuzzy search
" ==================================================================
" Plug 'kien/ctrlp.vim'
" CtrlP needs ag to work:
" pacman -S the_silver_searcher
Plug 'ctrlpvim/ctrlp.vim'
" set wildignore+=node_modules/*
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching=0


" NerdTree + git
" =================================================================
" Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" autocmd vimenter * NERDTree


" Lightline
" =================================================================
Plug 'itchyny/lightline.vim'
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
       \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
Plug 'tpope/vim-fugitive'


" Code formatters
"====================================================================
Plug 'w0rp/ale'
let g:airline#extensions#ale#enabled = 0

let g:ale_linters = {}
let g:ale_fixers = {}
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 0
" Javascript and jsx (React)
Plug 'chemzqm/vim-jsx-improve', { 'for': 'javascript' }
let g:ale_linters['javascript'] = ['eslint']
" let g:ale_fixers['javascript'] = ['prettier']
"===================================================================


" JSX syntax
" =================================================================
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'


" Python
" =================================================================
Plug 'andviro/flake8-vim', { 'for': 'python'}
" Stoq settings http://termbin.com/jg23
let g:PyFlakeCheckers = 'pep8,frosted'
" Remover em breve: E713
" E731: do not assign a lambda expression, use a def [pep8]
" E265: block comment should start with "# " [pep8]
let g:PyFlakeDisabledMessages = 'E266,E309,E713,E731,E265'
" This is not really working
let g:PyFlakeMaxLineLength=100
let g:PyFlakeSignStart=6000
" Disable ale for python, since I already have pyflakes
let g:ale_linters['python'] = []


" Navigation
" =================================================================
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>


call plug#end()
set termguicolors
" colorscheme two-firewatch
colorscheme dracula
