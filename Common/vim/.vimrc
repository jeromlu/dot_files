"Plugins
"source "$HOME~/.vim/vim-plug/plugins.vim"
"
"
" .vimrc
"
"
"*****************Initial settings*****************************
"
" Use .vim folder instead of vimfiles on Windows.
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

"*****************Plugins**************************************
"
"
"
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
call plug#end()

"Use VIM settings, rather than Vi settings
set nocompatible

"set bigger history
set history=1000

" menu language
set langmenu=en_GB

"Always show cursor position
"set ruler

"Highlight current line
set cursorline

"Display command line's tab completion options as a menu
set wildmenu
set wildmode=longest,list,full

" Set the leader key, (two options how to map)
let mapleader = " "

" Set encoding
set encoding=utf-8
"filetype plugin

" Mark change of mode with the change in the cursor.
"autocmd InsertEnter * set cul
"autocmd InsertLeave * set nocul

" Source .vimrc if present in working directory it enables project specific vim
" settings.
set exrc

" Restrict some command in non-default .vimrc.
set secure

" When exiting, raise a dialogue asking you wish to save changed files.
set confirm

" Vim does not redraw the screen all the time, especially beneficial with
" complicated plugins
"set lazyredraw

" Enables bash aliases from vim shell.
set shell=bash

" Show partial commands in the last line of the screen.
set showcmd

" Spell checks the comments.
set spell
set spelllang=en

" To enable screen size restore.
let g:screen_size_restore_ps = 1

" Automatic reloading of .vimrc settings every time I save .vimrc file.
" I could replace % with $MYVIMRC variable.
autocmd! bufwritepost .vimrc source %

set listchars=tab:▸\ ,eol:¬
" Insert any unicode character into the text editor.
" When in insert mode prest ctrl-v followed by:
" u<number of character>, e.g. u25b8 for ▸ and u00ac for ¬


" Set fonts and character height for GUI version.
set guifont=Consolas:h12
set tw=79   " width of document (used by gd)

" Enable soft wrapping (breaks lines only visually).
"set wrap
set nowrap

" Not to break words when wrapping. (It doesn't work if I use :set list - invisible
" characters.
"set linebreak

"" Set indent wrapped lines to match start.
"if has('linebreak')
"	set breakindent
"	if exists('&breakindentopt')
"		set breakindentopt=shift:2 "emphasize broken lines with indent
"	endif
"endif

" Backspace over more than one thing.
set backspace=indent,start,eol

"****************Swap and backup files***********************
" Disabling is not recommended, but reorganization of swap files is a must.
" To disable:
" set noswapfile
set directory=$HOME/.vim/swp//
" To also fix backup files.
"set backupdir=~/.vim/.backup//

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
"if &term =~ "screen."
    "let &t_ti.="\eP\e[1 q\e\\"
    "let &t_SI.="\eP\e[5 q\e\\"
    "let &t_EI.="\eP\e[1 q\e\\"
    "let &t_te.="\eP\e[0 q\e\\"
"else
    "let &t_ti.="\<Esc>[1 q"
    "let &t_SI.="\<Esc>[5 q"
    "let &t_EI.="\<Esc>[1 q"
    "let &t_te.="\<Esc>[0 q"
"endif

"*****************Copy/Paste**********************************
"
" System clipboard becomes VIM's default register
set clipboard=unnamed

"*****************Line numbering******************************
"
" Set numbering with relative line numbers
set number relativenumber

"****************File browsing***********************************
"
" Disable annoying banner.
let g:netrw_banner=0

" Open in prior window.
let g:netrw_browse_split=4

" Open splits to the right
let g:netrw_altv=1

" Tree view.
let g:netrw_liststyle=3

" let g:netrw_list_hide=netrw_gitignore@Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.z\S\+'


"****************Indentation***********************************
"
" Specifies the width of Tab character.
set tabstop=4

" Amount of white spaces to bi inserted.
set softtabstop=4

" For indentation commands in normal mode.
set shiftwidth=4

" Replaces tabs with spaces.
set expandtab

" Indentation depends on the type of the file.
" This command will use indentation scripts located in the indent folder of
" your VIM installation.
filetype plugin indent on

" Enable auto indenting
set autoindent

" Generally, 'smartindent' or 'cindent' should only be set manually if you're
" not satisfied with how file type based indentation works.
"set cindent
"set smartindent

" Set specific settings for python programming. There is better approach to put
" programming language specific settings in the file e.g. python.vim in
" directory: ~/.vim/after/ftplugin/
"au BufNewFile,BufRead *.py, *.pyw
"    \ set tabstop=4 |
"    \ set shiftwidth=4 |
"    \ set textwidth=79 |
"    \ set expandtab |
"    \ set autoindent |
"	"\ set fileformat=unix |
"    \ set softtabstop=4

"**************Navigation between splits*********************
"
" Splits open at the bottom and right, which is more intuitive than VIM
" defaults.
"set splitbelow splitright

" Easier split navigations.
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
" Highlight search results
set hlsearch
" While typing a search command, show where the pattern, as it was typed
" so far, matches.  The matched string is highlighted.  If the pattern
" is invalid or not found, nothing is shown.  The screen will be updated
"often, this is only useful on fast terminals.
set incsearch

" Make search case insensitive,
set ignorecase

" except if I write capital letter into search dialog.
set smartcase

"*****************Finding files*******************************
"
" Search down the folder sub folders structures.
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
let fortran_fold=1


"*****************Build and lunch system**********************
"!!!Comment: this should go to project specific folder!!!!!
"
"Build system for C/C++
"set makeprg=make/ -C ../build\ -j9
"nnoremap <F4> :make!<CR>
"!prevents from vim jumping to first line with error
"Configure lauch system
"prepending ! you can run any shell command
"nnoremap <F5> :!./my_great_program<CR>
"run python from within the VIM
autocmd FileType python nnoremap <buffer> <F9> :update<bar>!python %<CR>

"*****************Formating XML files*******************************
"
"
"for xml files, set path of the formatter (e.g. tidy)
"let g:formatterpath = ['c:/Users/jeromlu2/PortableSoftware/']
"autocmd FileType xml let g:tidy .= '." --indent-attributes 1"'

"to use write :Autoformat
augroup XML
    autocmd!
    autocmd FileType xml setlocal foldmethod=indent foldlevelstart=999 foldminlines=0
augroup END

"*****************Key remapping*******************************
"
" Some remapings are done in lunch and build section.
" Show invisible characters. For settings see General settings.
nmap <leader>l :set list!<CR>

" Generate new vertical split when hitting vv.
nnoremap <silent> vv <C-w>v

" Map sort function to a key
vnoremap <leader>s :sort<CR>

" Swap source (.cpp) or header (.h) files.
noremap <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" Open source (.cpp) or header (.h) file in new vertical split.
noremap <F5> :vs %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" Handling sessions.
noremap <F6> :source ~/.vim/sessions/
noremap <F7> :mks ~/.vim/sessions/%:h.vim

" Keep searching commands in the middle (instead of scrolloff)
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

"BUILD mappings
"noremap <leader>L :! pdflatex %<CR>

"***************Color scheme and syntax highlighting***********
"
"set 256 colors
"set t_Co=256
"Nice color scheme
"colorscheme desert
"Enable syntax highlighting
syntax on
syntax enable
set background=dark
"this changes color a bit (more to the grey colors)
"let g:solarized_termcolors=256
"finaly I set the solarized color theme
"colorscheme solarized
if has('gui_running')
  au VimEnter * colorscheme solarized
else
  au VimEnter * colorscheme flattened_dark
endif
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
"search highlights, I only keep default cterm
hi Search ctermbg=NONE ctermfg=NONE cterm=standout
"only underline bad spelling
hi clear SpellBad
hi SpellBad cterm=underline
" Set style for gVim
hi SpellBad gui=undercurl


"***************C/C++ specific settings*****************************
"
"
autocmd filetype cpp,c inoremap {<CR> {<CR>}<Esc>O

"***************MACROS*****************************************
"
"
"" 'quote' a word
nnoremap <leader>qw :silent! normal mpea'<Esc>bi'<Esc>`pl
" double "quote" a word
nnoremap <leader>qd :silent! normal mpea"<Esc>bi"<Esc>`pl
" remove quotes from a word
nnoremap <leader>wq :silent! normal mpeld bhd `ph<CR>
"

"***************GUI SETTINGS*************************************
"
"
autocmd GUIEnter * set vb t_vb=
if has('gui_running')
    "set lines=999 columns=999
    "set noerrorbells
endif

function! ToggleGUICruft()
  if &guioptions=='i'
    exec('set guioptions=imTrL')
  else
    exec('set guioptions=i')
  endif
endfunction

map <F11> <Esc>:call ToggleGUICruft()<cr>

" by default, hide gui menus
set guioptions=i

" Start full screen
au GUIEnter * simalt ~x

"***************CUDA SETTINGS*************************************
"
"
au BufNewFile,BufRead *.cu set ft=cuda
au BufNewFile,BufRead *.cuh set ft=cuda
