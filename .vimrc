execute pathogen#infect()
autocmd FileType java setlocal omnifunc=javacomplete#Complete

syntax on

" Color scheme
set t_Co=256   
set background=dark
colorscheme PaperColor

" General settings
set hlsearch
set relativenumber
set ruler
set ignorecase

" Disable arrow keys 
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Handling tabs as spaces
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Managing tabs
nnoremap tn :tabnew<CR>
nnoremap tp :tabprev<CR>
nnoremap tt :tabnext<CR>
nnoremap tf :tabfirst<CR>
nnoremap tl :tablast<CR>

" Find files
nnoremap <leader>f :e **/*

" Quick saves
nnoremap <leader>s :w<CR>
nnoremap <leader>S :wq<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>

" Shell mode
nnoremap <leader>t :shell<CR>

" XML formatting
nnoremap <leader>x :%!xmllint --format -<CR>

" Hex mode
nnoremap <leader>h :%!xxd<CR>
nnoremap <leader>H :%!xxd -r<CR>

" IDE Commands 
nmap <F2> :!mvn clean install<CR>
imap <F2> <ESC>:!mvn clean install<CR>

" File Explorer
nnoremap <leader>o :Vexplore<CR>
let netrw_browse_split = 4
let netrw_winsize = 25
let netrw_liststyle = 3
let netrw_altv = 1
let netrw_banner = 0
"augroup fileManager
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

" Plugin settings
" Lightline
let g:lightline = {
\     'active': {
\         'left': [['mode', 'paste' ], ['gitbranch', 'readonly', 'filename', 'modified']],
\         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
\     },
\     'component_function': { 
\         'gitbranch' : 'fugitive#head' 
\     }
\ }

" Remapping Git fugitive plugin keys
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -m ""
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gu :Gpull<CR>
nnoremap <leader>gd :Gdiff<CR>

" Convert markdown to PDF
nnoremap <leader>cp :!pandoc -f markdown -t latex -o %.pdf %<CR>
nnoremap <leader>cd :!pandoc -f markdown -t docx -o %.docx %<CR>

" Mapping Omnicompletion and javacomplete2
inoremap <C-@> <C-x><C-o>
