" Appearances
set number
syntax on
colorscheme elflord

set expandtab
set tabstop=4
set shiftwidth=2
set smarttab

map <C-w> db
map <CR> i<CR>
map ' i<CR><ESC>
" For PPH lines<80
"if exists('+colorcolumn')
"    set colorcolumn=80
"else
"    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"endif