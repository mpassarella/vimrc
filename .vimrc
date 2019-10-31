" --------------------------------------------------------------------------------------------------------------------------
" VIM settings
" --------------------------------------------------------------------------------------------------------------------------

" Leader key is now Spacebar
let mapleader = "\<SPACE>"

" Pathogen is fired up
execute pathogen#infect()

syntax on

" Startup 
augroup startupVim
autocmd!
autocmd VimEnter * :set colorcolumn=80
augroup END

" Color scheme
set termguicolors
set background=dark
colorscheme edge

" General settings           
set hlsearch                 
set incsearch                
set number                   
set relativenumber           
set cursorline               
set ruler                    
set ignorecase               
set autoindent               
filetype plugin on           
set splitbelow
set splitright
set foldenable             
"set foldmethod=indent      
"set foldcolumn=2
"set foldlevel=1

" Option for GVim
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" --------------------------------------------------------------------------------------------------------------------------
" Remapping keys
" --------------------------------------------------------------------------------------------------------------------------

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Editing and reloading .vimrc
nnoremap <leader>rv :so $MYVIMRC<CR>
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>Ev :tabe $MYVIMRC<CR>

" Handling tabs as spaces
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Cycling through buffers
nnoremap <TAB> :bn<CR>
nnoremap <S-TAB> :bp<CR>

" Managing tabs
nnoremap tt :tabnew<CR>
nnoremap tp :tabprev<CR>
nnoremap tn :tabnext<CR>
nnoremap tf :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap ts :tab sball<CR>
nnoremap T <C-W>T<CR>

" Find files
nnoremap <leader>f :e **/*
nnoremap <leader>F :tabe **/*

" Quick saves
nnoremap <leader>s :w<CR>
nnoremap <leader>S :wq<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>

" Shell mode
nnoremap <leader>t :terminal ++rows=15<CR>
nnoremap <leader>vt :vertical terminal<CR>
nnoremap <leader>ts :shell<CR>

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

" --------------------------------------------------------------------------------------------------------------------------
" Quick functions
" --------------------------------------------------------------------------------------------------------------------------

" Search into files
set wildignore+=*/.svn/*,*/target/*,*/.git/*,*.zip,*.tar.gz,*.jar,*.class,*.o,*.so

nmap <F2> "zyiw:vimgrep /<C-R>z/gj **/*<CR>:copen<CR>
imap <F2> <ESC>"zyiw:vimgrep /<C-R>z/gj **/*<CR>:copen<CR>
vmap <F2> <ESC>"zyiw:vimgrep /<C-R>z/gj **/*<CR>:copen<CR>

" Open file in new tab
nmap <F3> <C-W>gf
imap <F3> <ESC><C-W>gf
vmap <F3> <ESC><C-W>gf

nmap <leader>1 :!mvn clean install<CR>

" Java formatting
nmap <leader>2 :YcmCompleter Format<CR>
vmap <leader>2 :YcmCompleter Format<CR>

" JSON formatting
nmap <leader>3 :%!jq .<CR>
vmap <leader>3 :'<,'>!jq .<CR>

" XML formatting
nmap <leader>4 :%!xmllint --format -<CR>
vmap <leader>4 :'<,'>!xmllint --format -<CR>

" Delete empty lines
nmap <leader>5 :g/^$/d<CR>
vmap <leader>5 <ESC>:'<,'>g/^$/d<CR>

nmap <leader>6 <NOP>
nmap <leader>7 <NOP>
nmap <leader>8 <NOP>
nmap <leader>9 <NOP>
nmap <leader>0 <NOP>

" --------------------------------------------------------------------------------------------------------------------------
" Plugin settings
" --------------------------------------------------------------------------------------------------------------------------

" Lightline
let g:lightline = {
\     'active': {
\         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified'], ['warninglabel', 'javawarnings'], ['errorlabel', 'javaerrors']],
\         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding'], ['gitbranch']]
\     },
\     'component': {
\         'warninglabel' : 'Warnings',
\         'errorlabel' : 'Errors'
\     },
\     'component_function': {
\         'javawarnings' : 'youcompleteme#GetWarningCount',
\         'javaerrors' : 'youcompleteme#GetErrorCount',
\         'gitbranch' : 'fugitive#head'
\     },
\     'colorscheme' : 'edge'
\ }
set noshowmode
set laststatus=2

" NERDTree
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeShowHidden = 1

nmap <leader>o :NERDTreeToggle<CR>
nmap <leader>n :NERDTreeFind<CR>

" Only in the NERDTree buffer
nmap <leader>b :Bookmark<CR>

" You Complete Me (JAVA)
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

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

" Remapping Fugitive commands
nnoremap <leader>vs :G<CR>
nnoremap <leader>vc :Gcommit -m ""
nnoremap <leader>vp :Gpush<CR>
nnoremap <leader>vu :Gpull<CR>
nnoremap <leader>vd :Gdiff<CR>
nnoremap <leader>vl :Glog<CR>
nnoremap <leader>vb :0Gclog<CR>

" Remapping for JDB Java Debugger
nmap <F9> :JDBStepOver<CR>
imap <F9> <ESC>:JDBStepOver<CR>
vmap <F9> <ESC>:JDBStepOver<CR>

nmap <F10> :JDBStepIn<CR>
imap <F10> <ESC>:JDBStepIn<CR>
vmap <F10> <ESC>:JDBStepIn<CR>

nmap <F11> :JDBContinue<CR>
imap <F11> <ESC>:JDBContinue<CR>
vmap <F11> <ESC>:JDBContinue<CR>

nmap <F12> :JDBToggleBreakpointOnLine<CR>
imap <F12> <ESC>:JDBToggleBreakpointOnLine<CR>
vmap <F12> <ESC>:JDBToggleBreakpointOnLinv<CR>

nnoremap <leader>da :JDBAttach localhost:5005
nnoremap <leader>db :JDBToggleBreakpointOnLine<CR>
nnoremap <leader>dc :JDBContinue<CR>
nnoremap <leader>di :JDBStepIn<CR>
nnoremap <leader>du :JDBStepOut<CR>
nnoremap <leader>ds :JDBCommand 

" Move
let g:move_key_modifier = 'C'                              

" Minimap
let g:minimap_show='<leader>ms'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>mc'
let g:minimap_toggle='<leader>mm'

" Fake
" Choose a random element from a list
call fake#define('sex', 'fake#choice(["male", "female"])')

" Get a name of male or female
" fake#int(1) returns 0 or 1
call fake#define('name', 'fake#int(1) ? fake#gen("male_name")'
                                  \ . ' : fake#gen("female_name")')

" Get a full name
call fake#define('fullname', 'fake#gen("name") . " " . fake#gen("surname")')

" Get a nonsense text like Lorem ipsum
call fake#define('sentence', 'fake#capitalize('
                        \ . 'join(map(range(fake#int(3,15)),"fake#gen(\"nonsense\")"))'
                        \ . ' . fake#chars(1,"..............!?"))')

" Get a nonsense paragraph like Lorem ipsum
call fake#define('paragraph', 'join(map(range(fake#int(3,10)),"fake#gen(\"sentence\")"))')

nmap <leader>gp i<C-R>=fake#gen('paragraph')<CR><ESC>
nmap <leader>gn i<C-R>=fake#gen('name')<CR><ESC>
nmap <leader>gs i<C-R>=fake#gen('surname')<CR><ESC>
nmap <leader>gf i<C-R>=fake#gen('fullname')<CR><ESC>
nmap <leader>gc i<C-R>=fake#gen('country')<CR><ESC>

" Calendar
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

nmap <leader>C :tabnew<CR>:Calendar<CR>t

" Code snippets
" --------------------------------------------------------------------------------------------------------------------------

" Java Snippets
nmap <leader>jc ipublic class <C-R>=expand('%:t:r')<CR><SPACE>{<CR>}<ESC>%o<TAB>
nmap <leader>ji ipublic interface <C-R>=expand('%:t:r')<CR><SPACE>{<CR>}<ESC>%o<TAB>

" autocmd FileType java imap syso<TAB> System.out.println(
" autocmd FileType java imap sysr<TAB> System.err.println(
" autocmd FileType java imap class<TAB> public class <C-R>=expand('%:t:r')<CR>{<CR><CR>}
" autocmd FileType java imap interface<TAB> public interface <C-R>=expand('%:t:r')<CR>{<CR><CR>}
" autocmd FileType java imap for<TAB> for(int i=0; i<max; i++)<CR>{<CR><CR>}
" autocmd FileType java imap fore<TAB> for(Object obj : array)<CR>{<CR><CR>}
" autocmd FileType java imap while<TAB> while(true)<CR>{<CR><CR>}
" autocmd FileType java imap switch<TAB> switch(variable)<CR>{<CR><CR>case 1:<CR><CR>break;<CR><CR>case 2:<CR><CR>break;<CR><CR>default:<CR><CR>}
" autocmd FileType java imap try<TAB> try<CR>{<CR><CR>} catch (Exception ex)<CR>{<CR><CR>} finally<CR>{<CR><CR>}
" autocmd FileType java imap if(true)<TAB> if<CR>{<CR><CR>}else<CR>{<CR><CR>}
