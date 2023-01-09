set encoding=utf-8

syntax on

set autoread
set updatetime=1000
au CursorHold,CursorHoldI * checktime

set path+=.,** "for go file
set exrc "read .vimrc in projects root
set secure

set wrap linebreak nolist

let mapleader=","
let maplocalleader=","

"autocmd BufWritePost *.py call Flake8()   " run Flake8 on every :w in *.py
"
"let g:jedi#force_py_version = 3
"let jedi#force_py_version=3.8
"let g:jedi#environment_path = "" "path virtualenv

"Black python formatter
"nnoremap <leader>B :Black<CR>
"autocmd BufWritePost *.py silent! execute ':Black'

"let g:vimtex_view_method = 'skim'


" automatically leave insert mode after 'updatetime' milliseconds of inaction
"au CursorHoldI * stopinsert
"
" set 'updatetime' to 15 seconds when in insert mode
"au InsertEnter * let updaterestore=&updatetime | set updatetime=1000
"au InsertLeave * let &updatetime=updaterestore


nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>


set number relativenumber          " show line number
set showmatch       " hightlight matching braces
nnoremap <leader>h :nohls<CR>
"show trailing spaces
nnoremap <leader>t<space> /\s\+$<CR>
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/


" tabs and spaces
set tabstop=4       " redefine tab as 4 spaces
set shiftwidth=4    " how many cols text is intented with reindent
set expandtab       " tab will produce appropriate number of spaces
set shiftround      " tab goes to multiple of shiftwidth
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

set mouse=a  " r
set background=dark

set splitbelow      " new split panel to bottom
set splitright      " new split panel to right
set backspace=2     " Backspace deletes like most programs in insert mode

" test abbreviation
iab hw hello world!


"open NERDTree
nnoremap <leader>t :NERDTree<CR>


" convenience mappings
nnoremap ' `
nnoremap <leader>yy viw"+y
nnoremap <leader>Y 0v$h"+y
nnoremap <tab> gt
nnoremap <S-tab> gT
nnoremap <leader>mr :set mouse=r<CR>
nnoremap <leader>ma :set mouse=a<CR>
nnoremap <leader>ya viw"ay
nnoremap <leader>yb viw"by
nnoremap <leader>pa viw"ap
nnoremap <leader>pb viw"bp



" noremap Q !!sh<CR>        "run line as shell command. output pasted below
" noremap Q !!$SHELL<CR>    "run line as shell command. output pasted below
"run line as shell command
nnoremap Q :.w !$SHELL<CR>
" nnoremap <leader>r :.w !$SHELL<CR> "WHY IS THIS NOT WORKING????


"excecute register r in shell " register r is filled based on FileType
nnoremap <leader>q :!<C-R>r<CR>

" fill register r automatically " prepare for execution using <leader>q
autocmd FileType python let @r='python3 %'    " run python as default in register r
autocmd FileType clojure let @r='clojure %'
autocmd FileType cpp let @r='g++ % -o mmmain -O0 -Wall -Wextra -std=c++17; ./mmmain; rm mmmain'
autocmd FileType tcl let @r='tclsh %'
autocmd FileType cuda let @r='nvcc % -o mmmain -std=c++11; ./mmmain; rm mmmain'
autocmd FileType text let @r='test text yanked'        " test
autocmd FileType tex let @r='pdflatex %; bibtex %:r.aux; pdflatex %; pdflatex %;'

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
