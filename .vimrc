set nocompatible
set mouse=a

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

let mapleader = "\\"

Bundle 'gmarik/vundle'

" Statusline utilities
Bundle 'Lokaltog/vim-powerline'
set laststatus=2
let g:Powerline_symbols = 'unicode'"

Bundle 'tpope/vim-fugitive'
nmap <leader>gst :Gstatus<CR>
nmap <leader>gdi :Gdiff<CR>
nmap <leader>ta :diffget //2<CR>
nmap <leader>me :diffget //3<CR>
nmap <leader>gci :Gcommit<CR>
nmap <leader>gco :Gread<CR>
nmap <leader>gad :Gwrite<CR>
nmap <leader>gup :Git push<CR>
nmap <leader>gdo :Git pull<CR>

Bundle 'tpope/vim-unimpaired'

Bundle 'tpope/vim-surround'

Bundle 'tpope/vim-repeat'

Bundle 'skammer/vim-css-color'

Bundle 'mutewinter/vim-indent-guides'

Bundle 'ervandew/supertab'
""let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
"let g:SuperTabClosePreviewOnPopupClose = 1
""let g:SuperTabMappingForward = "<c-space>"
""let g:SuperTabMappingBackward = "<s-c-space>"

Bundle 'scrooloose/nerdcommenter'

Bundle 'scrooloose/nerdtree'
let NERDTreeIgnore = ['^bin$','^build$','^target$','\~$']

Bundle 'jistr/vim-nerdtree-tabs'
map <Leader>n :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_gui_startup=0

Bundle 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/](\.git|\.hg|\.svn|build|bin)$',
\ 'file': '\.class$\|\.so$\|\.db$\|\.swp$',
\ }

let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files && git ls-files --others --exclude-standard'],
        \ },
    \ 'fallback': 'find %s -type f'
    \ }

Bundle 'majutsushi/tagbar'
set updatetime=500
map <leader>tb :TagbarToggle<CR>

" Snipmate with Dependencies
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"
Bundle "garbas/vim-snipmate"

Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'

" Close delimiters
"Bundle 'jiangmiao/auto-pairs'
Bundle 'Raimondi/delimitMate'

" Themes
Bundle 'mrtazz/molokai.vim'

syn on " colored syntax

set number " line numbers
"set clipboard=unnamedplus " tries to use system clipboard

if has("gui_running")
    colorscheme molokai
else
    colorscheme delek
endif

filetype plugin indent on

" keep pasted content in buffer
""xnoremap p pgvy

" if a line is splitted between two lines, 'j' and 'k' move through its parts
nnoremap j gj
nnoremap k gk

" window movement
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" tab openning and closing
map <leader>tc :tabclose<CR>
map <leader>tn :tabnew<CR>

" tab navigation
if has("gui_running")
    nmap <C-Tab> gt
    nmap <C-S-Tab> gT
else
    nmap <Tab> gt
    nmap <S-Tab> gT
endif

" W also saves
command! W w

" Q also quits
command! Q q

" autocompletion with a menu
set wildmenu
set wildmode=list:longest,full

" Search options
set ignorecase
set smartcase " considers case when it is used, on the contrary don't
set incsearch " search while typing
set hlsearch "highlight all ocurrences of a pattern

" clean last search results
nnoremap <leader>lr <esc>:let @/ = ""<cr>:<esc>

" Java specifics
" Eclim
""au FileType java map <leader>mi :JavaImportMissing<cr>:JavaImportClean<cr>:JavaImportSort<cr>
""au FileType java map <leader>co :JavaCorrect<cr>
""au FileType java map <leader>fo :JavaFormat<cr>
""au FileType java map <leader>get :JavaGet<cr>
""au FileType java map <leader>set :JavaSet<cr>

set tabstop=2 shiftwidth=2 softtabstop=2 backspace=indent,eol,start expandtab

" Scala indent with 3 spaces
au FileType scala set tabstop=3 shiftwidth=3 softtabstop=3
au FileType java set tabstop=4 shiftwidth=4 softtabstop=4

if has("gui_running")
    " set guioptions-=T " turn off toolbar
    " set guioptions-=r " turn off right scrollbar
    " set guioptions-=l " turn off left scrollbar
    " set guioptions=m " turn on menu bar
    set guioptions= " turn off all
endif

" Disable arrow keys
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>

" Disable home and end keys
""map <home> <nop>
""map <end> <nop>

" Display extra whitespace
set list listchars=tab:»…,trail:…

" Remove trailling white spaces on saving
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
au BufWrite * :call DeleteTrailingWS()

""au BufReadPre * setlocal foldmethod=indent

au BufNewFile,BufRead *.gradle setf groovy
au BufNewFile,BufRead *.json setf javascript
au BufNewFile,BufRead *.md setfiletype markdown

" Resource .vimrc
nnoremap <leader>so :source ~/.vimrc<cr>
" Edit .vimrc
nnoremap <leader>rc :tabnew ~/.vimrc<cr>
"No backups
set nobackup
set noswapfile

map <leader>q3 :!open "/Applications/ioquake3/ioquake3-1.36.app"<cr>
" 80 columns
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%>80v.\+/
set cursorline
