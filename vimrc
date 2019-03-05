execute pathogen#infect()
autocmd FileType java setlocal omnifunc=javacomplete#Complete

syntax on

" Color scheme
set t_Co=256   
set background=dark
colorscheme gummybears

" General settings
set hlsearch
set incsearch
set relativenumber
set ruler
set ignorecase
set autoindent

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

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
vnoremap <leader>x :'<,'>!xmllint --format -<CR>

" Hex mode
nnoremap <leader>h :%!xxd<CR>
nnoremap <leader>H :%!xxd -r<CR>
vnoremap <leader>h :'<,'>!xxd<CR>
vnoremap <leader>H :'<,'>!xxd -r<CR>

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

" Convert markdown to PDF, PPTX and DOCX
nnoremap <leader>cp :!pandoc -f gfm -t latex -o %.pdf %<CR>
nnoremap <leader>cd :!pandoc -f gfm -t docx -o %.docx %<CR>
nnoremap <leader>ck :!pandoc -f gfm -t pptx -o %.pptx %<CR>
nnoremap <leader>ch :!pandoc -f gfm -t html -o %.html %<CR>

" Markdown preview in Google Chrome
nnoremap <leader>p :!google-chrome "%"<CR>

" Mapping Omnicompletion and javacomplete2
inoremap <C-@> <C-x><C-o>
:set completeopt+=noinsert

" Quick functions

" Delete empty lines
nmap <F3> :g/^$/d<CR>
imap <F3> :g/^$/d<CR>
vmap <F3> :g/^$/d<CR>

" Compile with maven 
nmap <F2> :!mvn clean install<CR>
imap <F2> <ESC>:!mvn clean install<CR>
vmap <F2> <ESC>:!mvn clean install<CR>

" Snippets
autocmd FileType java imap syso<TAB> System.out.println(
autocmd FileType java imap sysr<TAB> System.err.println(
autocmd FileType java imap for<TAB> for(int i=0; i<max; i++) {<CR><CR>}
autocmd FileType java imap fore<TAB> for(Object obj : array) {<CR><CR>}
autocmd FileType java imap while<TAB> while(true) {<CR><CR>}
autocmd FileType java imap switch<TAB> switch(variable) {<CR><CR>case 1:<CR><CR>break;<CR><CR>case 2:<CR><CR>break;<CR><CR>default:<CR><CR>}
autocmd FileType java imap try<TAB> try {<CR><CR>} catch (Exception ex) {<CR><CR>} finally {<CR><CR>}
autocmd FileType java imap if<TAB> if {<CR><CR>} else {<CR><CR>}
