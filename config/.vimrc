" safeguard for re-sourcing
autocmd!

set ruler
set number
set showcmd
set linebreak
set scrolloff=4
set winminheight=0
set splitbelow
set confirm
set history=2000 " 100x the default

set incsearch
set autoindent
set smartindent
set softtabstop=4
set shiftwidth=4
set textwidth=0
set expandtab
set isfname+=/,.
set backspace=2 " indent,eol,start
set nojoinspaces

map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-Tab> <C-w><C-w>

" current directory follows the file being edited, so long as it's not a remote file
if exists(":lcd")
    autocmd BufEnter * if bufname("") !~ '^[[:alnum:]]*://' | silent! lcd %:p:h | endif
else
    autocmd BufEnter * if bufname("") !~ '^[[:alnum:]]*://' | cd %:p:h | endif
endif

set background=dark
syntax on
set gfn=Monaco:h12
