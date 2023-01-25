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
