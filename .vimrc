execute pathogen#infect()

syntax on

" Startup 
augroup startupVim
  autocmd!
  autocmd VimEnter * :set colorcolumn=80
augroup END

" Color scheme
set t_Co=256
set background=dark
colorscheme gruvbox

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
nnoremap <leader>t :terminal ++rows=15<CR><C-w><C-r>
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

" Convert markdown to PDF, PPTX and DOCX
nnoremap <leader>cp :!pandoc -f gfm -t latex -o %.pdf %<CR>
nnoremap <leader>cd :!pandoc -f gfm -t docx -o %.docx %<CR>
nnoremap <leader>ck :!pandoc -f gfm -t pptx -o %.pptx %<CR>
nnoremap <leader>ch :!pandoc -f gfm -t html -o %.html %<CR>

" Markdown preview in Google Chrome
nnoremap <leader>p :!google-chrome "%"<CR>

" Spellchecking
nnoremap <leader>sc :set spell spelllang=en_us<CR>
nnoremap <leader>so :set nospell<CR>

" Quick functions

" Search into files
nmap <F2> "zyiw:10new<CR>:read !grep -r --exclude-dir={.svn,target,.git} <C-r>z .<CR><C-w><C-r>
imap <F2> <ESC>"zyiw:10new<CR>:read !grep -r --exclude-dir={.svn,target,.git} <C-r>z .<CR><C-w><C-r>
vmap <F2> <ESC>"zyiw:10new<CR>:read !grep -r --exclude-dir={.svn,target,.git} <C-r>z .<CR><C-w><C-r>

" Open file in new tab
nmap <F3> <C-w>gf
imap <F3> <ESC><C-w>gf
vmap <F3> <ESC><C-w>gf

" Delete empty lines
nmap <F4> :g/^$/d<CR>
imap <F4> <ESC>:g/^$/d<CR>
vmap <F4> <ESC>:g/^$/d<CR>

" Plugin settings
" --------------------------------------------------------------------------------------------------------------------------
" Lightline
let g:lightline = {
\     'active': {
\         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified'], ['warninglabel', 'javawarnings'], ['errorlabel', 'javaerrors']],
\         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
\     },
\     'component': {
\         'warninglabel' : 'Warnings',
\         'errorlabel' : 'Errors'
\     },
\     'component_function': {
\         'javawarnings' : 'youcompleteme#GetWarningCount',
\         'javaerrors' : 'youcompleteme#GetErrorCount'
\     },
\     'colorscheme' : 'gruvbox'
\ }
set noshowmode
set laststatus=2

" NERDTree
nmap <leader>o :NERDTreeToggle<CR>

" You Complete Me (JAVA)
let g:ycm_autoclose_preview_window_after_completion = 1

nmap <F5> :YcmCompleter GoTo<CR>
imap <F5> <ESC>:YcmCompleter GoTo<CR>
vmap <F5> <ESC>:YcmCompleter GoTo<CR>

nmap <F6> :YcmCompleter RefactorRename
imap <F6> <ESC>:YcmCompleter RefactorRename
vmap <F6> <ESC>:YcmCompleter RefactorRename

nmap <F7> :YcmCompleter FixIt
imap <F7> <ESC>:YcmCompleter FixIt
vmap <F7> <ESC>:YcmCompleter FixIt

nmap <F8> :YcmCompleter GetDoc<CR>
imap <F8> <ESC>:YcmCompleter GetDoc<CR>
vmap <F8> <ESC>:YcmCompleter GetDoc<CR>

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

" Remapping for JDB Java Debugger
nmap <F9> :JDBStepOver<CR>
imap <F9> <ESC>:JDBStepOver<CR>
vmap <F9> <ESC>:JDBStepOver<CR>

nnoremap <leader>da :JDBAttach localhost:5005
nnoremap <leader>db :JDBBreakpointOnLine<CR>
nnoremap <leader>dc :JDBContinue<CR>
nnoremap <leader>di :JDBStepIn<CR>
nnoremap <leader>du :JDBStepOut<CR>
nnoremap <leader>ds :JDBCommand 
