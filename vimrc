call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set nocompatible

set hidden

set wrap

"set nowrap        " don't wrap lines
set tabstop=2     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacinsv over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set noshowmatch   " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,

                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type


set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set novisualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile

" set filetype stuff to on
filetype on
filetype plugin on
filetype indent on

if has("gui_running")
   colorscheme railscasts
   syntax on
endif

" Set font according to system
if has("mac")
  set gfn=Monaco:h12
  set shell=/bin/bash
  set nocursorline
elseif has("win32")
  set gfn=Bitstream\ Vera\ Sans\ Mono:h10
  set nocursorline
elseif has("unix")
  set gfn=Droid\ Sans\ Mono\ 16
"  set shell=/bin/bash
  set nocursorline
endif

set list
set listchars=tab:>-,trail:- " show tabs and trailing

set pastetoggle=<F2>
set mouse=a

syntax on
filetype plugin indent on


" Quickly edit/reload the vimrc file
let mapleader=","
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

nmap <F2> :RT
imap <F2> <esc> :RT

nmap <F3> :RS
imap <F3> <esc> :RS

nmap <F4> :RV
imap <F4> <esc> :RV

" nmap <silent> <C-t> :CommandTFlush<CR>:CommandT<CR>
" nmap <silent> <C-p> :Project<CR>

imap <silent> <C-s> <esc> :w <CR>
nmap <silent> <C-s> :w <CR>

" nmap <silent> <F4> :NERDTreeToggle <CR>
" imap <silent> <F4> :NERDTreeToggle <CR>

" nmap <silent> <F4> :RT
" imap <silent> <F4> <esc> :RT

imap <silent> <F5> <esc> :w<CR>:! ruby main.rb<CR>
nmap <silent> <F5> <esc> :w<CR>:! ruby main.rb<CR>

" nmap <silent> <F3> :tab ball <CR>
imap <silent> <C-z> <esc>:tabprevious <CR>
nmap <silent> <C-z> :tabprevious <CR>
imap <silent> <C-x> <esc>:tabnext <CR>
nmap <silent> <C-x> :tabnext <CR>
imap <silent> <C-a> <esc>:bdelete<CR>
nmap <silent> <C-a> :bdelete<CR>

nmap <silent> :e :tabe

" Copy from clipboard
nmap <silent> <A-p> "+p
imap <silent> <A-p> <esc> "+p

set ts=2 sts=2 sw=2 expandtab

" Turn off blinking for the n, v, & c states:
let &guicursor = substitute(&guicursor, "n-v-c:", "n-v-c:blinkon0-", "")
" NOTE: To stop all blinking:
" let &guicursor = &guicursor . ",a:blinkon0

set guioptions-=T
set guioptions-=m

" Syntastic
" set statusline+=%{SyntasticStatuslineFlag()}
let g:syntastic_enable_signs=1

" Retirando espaços no fim das linhas ao salvar o arquivo
autocmd BufWritePre * :%s/\s\+$//e
