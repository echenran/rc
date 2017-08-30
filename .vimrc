set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Appearances
set number
set hlsearch
set backup
set backupdir=/tmp
set paste
syntax on
colorscheme elflord
hi SpellBad ctermfg=015 ctermbg=017
hi SpellCap ctermfg=015 ctermbg=023
hi Search ctermfg=015 ctermbg=053
hi CursorLine cterm=NONE ctermbg=235
hi CursorColumn cterm=NONE ctermbg=235

set smarttab autoindent shiftwidth=2 tabstop=2 noexpandtab
set wrap linebreak nolist
set backspace=indent,eol,start
set textwidth=0 wrapmargin=0

set spelllang=en
set spell
set mouse=a
set cursorline cursorcolumn

" Detect filetype
filetype on
filetype plugin indent on
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'

" Keymaps
"map <C-w> db
map <CR> i<CR>
map ' i<CR><ESC>
map <C-f> :set nohlsearch<CR><ESC>
nmap <Tab> i<Tab><ESC>l
map fm vipgq
map r0 :%s/’/'/g<CR><ESC>:w<CR>[[
map r9 :%s/[”\|“]/"/g<CR><ESC>:w<CR>[[
map e :w<CR>
map x :q!<CR>
map q :wq<CR>
"map cp :w<CR>:!cat % |vipe| !pbcopy TODO
inoremap { {<Esc>A<CR>}<Esc>ko<Tab>
inoremap ( ()<Esc>i

" For split panes
map <C-w> <C-w><C-w>
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k

" 80th column marker
if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" for pydiction tab autocomplete
filetype plugin on
let g:pydiction_location = '~/.vim/complete-dict'
" let g:pydiction_menu_height = 3
