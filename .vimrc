execute pathogen#infect()
autocmd FileType java setlocal omnifunc=javacomplete#Complete

syntax on

" Color scheme
set t_Co=256   
set background=dark
colorscheme plastic

" General settings
set hlsearch
set incsearch
set relativenumber
set ruler
set ignorecase
set autoindent
" set foldenable
" set foldmethod=syntax

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
nnoremap tt :tabnew<CR>
nnoremap tp :tabprev<CR>
nnoremap tn :tabnext<CR>
nnoremap tf :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap T <C-W>T<CR>

" Colocolumn

nnoremap <leader>cc :set colorcolumn=80<CR>
nnoremap <leader>co :set colorcolumn=0<CR>

" Find files
nnoremap <leader>f :e **/*
nnoremap <leader>F :tabe **/*

" Quick saves
nnoremap <leader>s :w<CR>
nnoremap <leader>S :wq<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>

" Shell mode
nnoremap <leader>t :terminal<CR><C-w><C-r><C-w>10-
nnoremap <leader>vt :vertical terminal<CR><C-w><C-r>
nnoremap <leader>ts :shell<CR>

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
augroup startupVim
  autocmd!
  autocmd VimEnter * :set colorcolumn=80
"  autocmd VimEnter * :MinimapToggle
augroup END

" Plugin settings
" Lightline
let g:lightline = {
\     'active': {
\         'left': [['mode', 'paste' ], ['gitbranch', 'readonly', 'filename', 'modified']],
\         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
\     },
\     'component_function': { 
\         'gitbranch' : 'fugitive#head' 
\     },
\     'colorscheme': 'plastic'
\ }

" Remapping VC commands for source code versioning systems
nnoremap <leader>vs :VCStatus<CR>
nnoremap <leader>vc :VCCommit -m ""
nnoremap <leader>vp :VCPush<CR>
nnoremap <leader>vu :VCPull<CR>
nnoremap <leader>vd :VCDiff<CR>
nnoremap <leader>vi :VCIncoming<CR>
nnoremap <leader>vo :VCOutgoing<CR>
nnoremap <leader>vl :VCLog<CR>
nnoremap <leader>vb :VCBrowse<CR>

" Convert markdown to PDF, PPTX and DOCX
nnoremap <leader>cp :!pandoc -f gfm -t latex -o %.pdf %<CR>
nnoremap <leader>cd :!pandoc -f gfm -t docx -o %.docx %<CR>
nnoremap <leader>ck :!pandoc -f gfm -t pptx -o %.pptx %<CR>
nnoremap <leader>ch :!pandoc -f gfm -t html -o %.html %<CR>

" Minimap keybindings
let g:minimap_show='<leader>ms'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>mc'
let g:minimap_toggle='<leader>mt'
let g:minimap_highlight='Visual'

" Spellchecking 
nnoremap <leader>sc :set spell spelllang=en_us<CR>
nnoremap <leader>so :set nospell<CR>

" Markdown preview in Google Chrome
nnoremap <leader>p :!google-chrome "%"<CR>

" Mapping Omnicompletion and javacomplete2
inoremap <C-@> <C-x><C-o>
set completeopt+=noinsert

" Quick functions

" Delete empty lines
nmap <F3> :g/^$/d<CR>
imap <F3> :g/^$/d<CR>
vmap <F3> :g/^$/d<CR>

" Compile with maven 
nmap <F2> :!mvn clean install<CR>
imap <F2> <ESC>:!mvn clean install<CR>
vmap <F2> <ESC>:!mvn clean install<CR>

" Search into java files
nmap <F5> "zyiw:new<CR>:read !grep -r --exclude-dir={.svn,target,.git} --include='*.java' <C-r>z .<CR><C-w><C-r><C-w>10-
imap <F5> <ESC>"zyiw:new<CR>:read !grep -r --exclude-dir={.svn,target,.git} --include='*.java' <C-r>z .<CR><C-w><C-r><C-w>10-
vmap <F5> <ESC>"zyiw:new<CR>:read !grep -r --exclude-dir={.svn,target,.git} --include='*.java' <C-r>z .<CR><C-w><C-r><C-w>10-

" Search into files
nmap <F6> "zyiw:new<CR>:read !grep -r --exclude-dir={.svn,target,.git} <C-r>z .<CR><C-w><C-r><C-w>10-
imap <F6> <ESC>"zyiw:new<CR>:read !grep -r --exclude-dir={.svn,target,.git} <C-r>z .<CR><C-w><C-r><C-w>10-
vmap <F6> <ESC>"zyiw:new<CR>:read !grep -r --exclude-dir={.svn,target,.git} <C-r>z .<CR><C-w><C-r><C-w>10-

" Open Java file from Class name in new tab
nmap <F7> "zyiw:tabe **/<C-r>z.java<CR>
imap <F7> <ESC>"zyiw:tabe **/<C-r>z.java<CR>
vmap <F7> <ESC>"zyiw:tabe **/<C-r>z.java<CR>

" Open file in new tab
nmap <F8> <C-w>gf
imap <F8> <ESC><C-w>gf
vmap <F8> <ESC><C-w>gf

" Snippets
autocmd FileType java imap syso<TAB> System.out.println(
autocmd FileType java imap sysr<TAB> System.err.println(
autocmd FileType java imap class<TAB> public class <C-r>=expand('%:t:r') <CR>{<CR><CR>}
autocmd FileType java imap interface<TAB> public interface <C-r>=expand('%:t:r') <CR>{<CR><CR>}
autocmd FileType java imap for<TAB> for(int i=0; i<max; i++)<CR>{<CR><CR>}
autocmd FileType java imap fore<TAB> for(Object obj : array)<CR>{<CR><CR>}
autocmd FileType java imap while<TAB> while(true)<CR>{<CR><CR>}
autocmd FileType java imap switch<TAB> switch(variable)<CR>{<CR><CR>case 1:<CR><CR>break;<CR><CR>case 2:<CR><CR>break;<CR><CR>default:<CR><CR>}
autocmd FileType java imap try<TAB> try<CR>{<CR><CR>} catch (Exception ex)<CR>{<CR><CR>} finally<CR>{<CR><CR>}
autocmd FileType java imap if<TAB> if<CR>{<CR><CR>}else<CR>{<CR><CR>}
