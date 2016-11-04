" Appearances
set number
set hlsearch
set backup
set backupdir=/tmp
syntax on
colorscheme elflord
hi SpellBad ctermfg=015 ctermbg=017
hi SpellCap ctermfg=015 ctermbg=023
hi Search ctermfg=015 ctermbg=053

set smarttab autoindent shiftwidth=2 tabstop=2 noexpandtab

set spelllang=en
set spell

" Detect filetype
filetype on
filetype plugin indent on

" Keymaps
map <C-w> db
map <CR> i<CR>
map ' i<CR><ESC>
map <C-f> :set nohlsearch<CR><ESC>
nmap <Tab> i<Tab><ESC>l
map fm vipgq
map r0 :%s/’/'/g<CR><ESC>:w<CR>[[
map r9 :%s/[”\|“]/"/g<CR><ESC>:w<CR>[[
map s :w<CR>
map q :wq<CR>
inoremap { {<Esc>A<CR>}<Esc>ko<Tab>
inoremap ( ()<Esc>i

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
