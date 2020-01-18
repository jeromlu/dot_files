"
" .vimrc
"
"
"*****************Initial settings*****************************
"
"Use VIM settings, rather than Vi settings
set nocompatible
"set bigger history
set history=1000
"Always show cursor position
"set ruler
"Display command line's tab completion options as a menu
set wildmenu
set wildmode=longest,list,full
"set the leader key, (two options how to map)
"let mapleader = " "
map leader <space>
"set encoding
set encoding=utf-8
"filetype plugin
"Mark change of mode with the change in the cursor
"autocmd InsertEnter * set cul
"autocmd InsertLeave * set nocul
"source .vimrc if present in working directory it enables project specific vim
set exrc
"restrict some command in non-default .vimrc
set secure
"Raise a dialogue asking ig you wish to save changed files
set confirm
"Vim does not redraw the screen all the time, especially 
"beneficial with complicated plugins
set lazyredraw
"enables bash aliases from vim shell
set shell=bash
"show partial commands in the last ine of the screen
set showcmd
"spell checks the comments
set spell
set spelllang=en
"to enable screen size restore
let g:screen_size_restore_ps = 1
"Automatic reloading of _vimrc
autocmd! bufwritepost _vimrc source %
set guifont=Consolas:h12
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
"" set nobackup
"" set nowritebackup
"" set noswapfile

"****************Some TMUX fixes******************************
"
"Correct the cursor behaviour
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
endif


"****************Some cursor fixes******************************
"
"Correct the cursor behaviour
" Set up vertical vs block cursor for insert/normal mode
if &term =~ "screen."
    let &t_ti.="\eP\e[1 q\e\\"
    let &t_SI.="\eP\e[5 q\e\\"
    let &t_EI.="\eP\e[1 q\e\\"
    let &t_te.="\eP\e[0 q\e\\"
else
    let &t_ti.="\<Esc>[1 q"
    let &t_SI.="\<Esc>[5 q"
    let &t_EI.="\<Esc>[1 q"
    let &t_te.="\<Esc>[0 q"
endif

"*****************Copy/Paste**********************************
"
"better copy paste
set clipboard=unnamed


"*****************Line numbering******************************
"
"set numbering wiht relative line numbers
set number
set relativenumber
"set number relativenumber


"****************Indentation***********************************
"
"Indent by 2 spaces when hitting tab
set softtabstop=2
"Indent by 4 spaces when auto-indenting
set shiftwidth=2
"Show existing tab with 4 spaces
set tabstop=2
"Enable filetype indenting for files
filetype indent on
filetype plugin indent on
"Enable auto indenting
set autoindent
"Still to figure out what this does....
set noexpandtab
set cindent "indentention for C coding
"for python programing
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
"" vnoremap < <gv  " better indentation
"" vnoremap > >gv  " better indentation

"***************Color scheme and syntax highlighting***********
"
"set 256 colors
set t_Co=256
"Nice color scheme
colorscheme desert
"Enable syntax highlighting
syntax on
syntax enable
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized
"mark end line with colors
set colorcolumn=80
highlight ColorColumn ctermbg=darkgray
"flagging unnecesary whitespace
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhiteSpace /\s\+$/
" Show whitespace
" MUST be inserted BEFORE the colorscheme command
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"au InsertLeave * match ExtraWhitespace /\s\+$/
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/
"****Tweak some colors
hi Search ctermbg=52
hi Search ctermfg=white
"only undeline bad spelling
hi clear SpellBad
hi SpellBad cterm=underline
" Set style for gVim
hi SpellBad gui=undercurl

"**************Navigation between splits*********************
"
"Splits open at the bottom and right, awhisc is non-retarded, unlike vim defaults
"set splitbelow splitright
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"*****************Status line**********************************
"
"make status line appear all the time
set laststatus=2

"customize the status line
"PRO
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
"LAME
"set statusline=%t\ 	"tail of the filename and space
"set statusline+=%{&ff}	"file format
"set statusline+=%h	"help file flag
"set statusline+=%m	"modified flag
"set statusline+=%r	"read only flag
"set statusline+=%y	"filetype
"set statusline+=%c,	"cursor column
"set statusline+=%l/%L	"cursor line/total lines
"set statusline+=\ %P	"percent through file

"*****************Search within a file***********************
"
"highlight search results
set hlsearch
set incsearch
"make search case insensitive
set ignorecase
"except if I write capital letter
set smartcase
"if possible at least n lines are visible above and below cursor
"set scrolloff=5


"*****************Finding file*******************************
"
"search down the folder sub folders structures
set path+=**

"*****************Tag jumping*********************************
"
"Create the 'tags' file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack
" No visual list of tags

"*****************Code folding*******************************
"
"
set foldmethod=indent
set foldnestmax=10
"when starting vim up code is not folded
set nofoldenable
set foldlevel=2


"*****************Build and lunch system**********************
"!!!Comment: this should go to project specific folder!!!!!
"
"Build system for C/C++
"set makeprg=make/ -C ../build\ -j9
"nnoremap <F4> :make!<CR>
"!prevents from vim jumping to first line with error
"Configure lunch system
"prepending ! you can run any shell command
"nnoremap <F5> :!./my_great_program<CR>
"run python from within the VIM
autocmd FileType python nnoremap <buffer> <F9> :update<bar>!python %<CR>

"*****************Formatting XML files*******************************
"
"
"for xml files, set path of the formatter (e.g. tidy)
let g:formatterpath = ['c:/Users/jeromlu2/PortableSoftware/']
"autocmd FileType xml let g:tidy .= '." --indent-attributes 1"'

"to use write :Autoformat
augroup XML
    autocmd!
    autocmd FileType xml setlocal foldmethod=indent foldlevelstart=999 foldminlines=0
augroup END

"*****************Key remapping*******************************
"
"some remapping are done in lunch and build section
"first we set the leader key to be space for now
let mapleader = "space" 
"vv to generate new vertical split
nnoremap <silent> vv <C-w>v
"quickly clear highlights
map <leader>n :nohl<CR>
"quickly open new tab
map <leader>t :tabnew<CR>
"regenerate the tags file, including project gems
map <leader>rv :!ctags --tag-relative --exclude=.git<CR>
map <leader>rb :!ctags --tag-relative --exclude=.git<CR>
" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
" to keep searching commands in the middle (instead of scrolloff)
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz


" map sort function to a key
vnoremap <Leader>s :sort<CR>
