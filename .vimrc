set encoding=utf-8

syntax on

set autoread
set updatetime=1000
au CursorHold,CursorHoldI * checktime

"autocmd BufWritePost *.py call Flake8()   " run Flake8 on every :w in *.py
"
"let g:jedi#force_py_version = 3  
"let jedi#force_py_version=3.8
let g:vimtex_view_method = 'skim'


let mapleader=","
let maplocalleader=","

"Black python formatter
nnoremap <leader>B :Black<CR>

" automatically leave insert mode after 'updatetime' milliseconds of inaction
"au CursorHoldI * stopinsert
"
" set 'updatetime' to 15 seconds when in insert mode
"au InsertEnter * let updaterestore=&updatetime | set updatetime=1000
"au InsertLeave * let &updatetime=updaterestore



set number relativenumber          " show line number
set showmatch       " hightlight matching braces
nnoremap <leader>h :nohls<CR>
"show trailing spaces
nnoremap <leader>t<space> /\s\+$<CR>


" tabs and spaces
set tabstop=4       " redefine tab as 4 spaces
set shiftwidth=4    " how many cols text is intented with reindent
set expandtab       " tab will produce appropriate number of spaces
set shiftround      " tab goes to multiple of shiftwidth


set splitbelow      " new split panel to bottom
set splitright      " new split panel to right
set backspace=2     " Backspace deletes like most programs in insert mode

" test
"inoremap <leader>c huuhworks! 
" use abbreviation instead
iab hw hello world!

" noremap Q !!sh<CR>        "run line as shell command. output pasted below
" noremap Q !!$SHELL<CR>    "run line as shell command. output pasted below
"run line as shell command
nnoremap Q :.w !$SHELL<CR>
" nnoremap <leader>r :.w !$SHELL<CR> "WHY IS THIS NOT WORKING????

"excecute register r in shell
nnoremap <leader>q :!<C-R>r<CR>

"open NERDTree
nnoremap <leader>t :NERDTree<CR>


" convenience mappings
nnoremap ' `

" fill register automatically
autocmd FileType python let @r='python3 %'    " run python as default in register r
autocmd FileType text let @r='it works!'        " test
autocmd FileType tex let @p='ggf.v$"ry'         " yank first line into register r

" highligt column 80
set colorcolumn=80
"highlight ColorColumn ctermbg=7
highlight ColorColumn ctermbg=236

set hlsearch incsearch  " highlight all search matches while typing
set wildmenu            " show file options above the command line

" quicker window movement
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
inoremap <c-j> <c-\><c-n><c-w>j
inoremap <c-k> <c-\><c-n><c-w>k
inoremap <c-h> <c-\><c-n><c-w>h
inoremap <c-l> <c-\><c-n><c-w>l
tnoremap <c-j> <c-w>j
tnoremap <c-k> <c-w>k
tnoremap <c-h> <c-w>h
tnoremap <c-l> <c-w>l
"tnoremap <c-j> <c-\><c-n><c-w>j
"tnoremap <c-k> <c-\><c-n><c-w>k
"tnoremap <c-h> <c-\><c-n><c-w>h
"tnoremap <c-l> <c-\><c-n><c-w>l

" insert only one character
"nnoremap <C-i> i_<Esc>r

tnoremap <ESC> <C-\><C-n>


nnoremap <leader>vr :e $MYVIMRC<cr>
nnoremap <leader>br :e ~/.bash_profile<cr>
nnoremap <leader>ut :tabedit<cr>:e<space>~/Dev/usefullthings/<cr>


""""""folds for python
" fold docstring - curser must be in the docstring
nnoremap <leader>zd ?"""<CR>V/"""<CR>zf:nohls<CR>

""""vimlatex
" remove warnings buffer
nnoremap <leader>lr <c-w>j:q<CR><c-w>l

filetype plugin indent on
