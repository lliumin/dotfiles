" Author: yxy
" Email: yan5yang@gmail.com
" this vimrc file based on http://amix.dk/vim/vimrc.html, 
" thks this nice guy :)
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> Misc
"    -> Helper functions
"    -> Plugins config

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=100 " keep track of last commands
set nocp " 禁止兼容模式
set backspace=2 " make backspace work like most other apps
set t_Co=256
" :fixdel

" Enable filetype plugins
filetype plugin on
filetype indent on

" Sets to auto read when a file is changed from the outside
set autoread

" 映射','为前缀，这样可以为我们做一些快捷的操作
let mapleader = ","
let g:mapleader = ","

" 快速保存
nmap <leader>w :w<CR>
" 快速退出
nmap <leader>q :q!<CR>
" quick save and quit
nmap <leader>x :wq!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
" set so=7
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.pyo

" 永远显示当前的光标的位置
set ruler

set cmdheight=2 " Height of the command bar
set hid " A buffer becomes hidden when it is abandoned

set ignorecase " 搜索的时候不区分大小写
set smartcase " When searching try to be smart about cases
set hlsearch " highlight all matches
set showmatch " Show matching braces.
set incsearch " 增量搜索,搜索的时候，如果匹配，光标会自动移动到该字符上

" Don't redraw while executing macros (good performance config)
set lazyredraw " 当执行宏的时候不要重画（优化性能）

" For regular expressions turn magic on
set magic

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile " may dangourse

" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 使用空格代替tabs
set expandtab
" Be smart when using tabs ;)
set smarttab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 78 characters
set linebreak
set textwidth=200

set autoindent "Auto indent
set smartindent "Smart indent
set wrap "Wrap lines, 某行超过textwidth时，移动光标不会水平移动

set clipboard+=unnamed  " Yanks go on clipboard instead.
" Line wrapping on by default
" set number ruler " show line numbers
set wildchar=9 " tab as completion character
set selectmode=key

" display unprintable characters, tab will be `»·` and space will be `·`
" set listchars=tab:»·,trail:·,precedes:<,extends:>
set listchars=tab:▸·,trail:·,precedes:<,extends:>
" set listchars=tab:▸\ ,eol:¬
" display unprintable characters with '^' and put $ after the line
set list
" hidden tab when open html,xml file
autocmd filetype html,xml set listchars-=tab:»·
syntax sync fromstart

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
set number " 显示行数
set laststatus=2 " Always show status line
" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ %p%%\ [%{strlen(&fenc)?&fenc:&enc}]\ #%n

" set clipboard+=unnamed  " Yanks go on clipboard instead.
"  Autocmd
autocmd BufRead,BufNewFile *.html set shiftwidth=2
autocmd BufRead,BufNewFile *.c,*.h set shiftwidth=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" 映射空格为正向搜索
map <space> /
" map <c-space> ? " mac 会跟系统的冲突
"
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
" make ; as :
" nnoremap ; :
" when Wrap lines, makes 
nnoremap j gj
nnoremap k gk
" clear highlight search, instead of type blanwjlwjelwj
nmap <silent> ,/ :nohlsearch<CR>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" 切换当前的目录为所在buffer的目录
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" 打开上回编辑的文件时，自动跳到上回编辑的那一行
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" map kj to <esc>
:map! kj <esc>

" 保存时删除行尾的空白
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType html,xhtml,django.html noremap <C-L> :!open %<CR>
autocmd FileType html,xhtml set filetype=htmldjango

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

call pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TComment
nmap // :TComment<CR>
vmap // :TComment<CR>

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowHidden=1
nmap <leader>T :NERDTreeToggle<CR>
nnoremap <C-M> :NERDTreeToggle<CR>

" Commnad-T
let g:CommandTMaxFiles=200000
let g:CommandTAlwaysShowDotFiles=1
let g:CommandTMaxDepth=5
" let g:CommandTScanDotDirectories=1
let g:CommandTCancelMap='<C-x>'

" Rainbow parentheses
let g:rbpt_max = 16
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Tasklist
map <leader>v <Plug>TaskList
let g:tlTokenList = ['FIXME', 'TODO', 'XXX']
let g:tlRememberPosition = 1

" Tlist
if has("unix")
  " FIXME
  let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
endif
nnoremap <C-T> :TlistToggle<CR>

" Zen-code
let g:user_zen_expandabbr_key='<C-E>'
let g:use_zen_complete_tag=1

" Colorscheme
colorscheme molokai
let g:molokai_original=1

" UltiSnips
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsEditSplit = 'horizontal'
