" =================================================================================================
" Pathongen stuff =================================================================================
" =================================================================================================

call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" =================================================================================================
" Behavior ========================================================================================
" =================================================================================================

set nocompatible
set nobackup
set noswapfile
let mapleader=","
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildmode=list:longest,list:full
set wildignore=*.o,*.obj,.git,*.rbc,*.swp,*.bak,*.pyc,*.class
set encoding=utf-8

" =================================================================================================
" Appearence ======================================================================================
" =================================================================================================

set number        " always show line numbers
set ruler
set noshowmatch   " set show matching parenthesis
set title                " change the terminal's title
set novisualbell           " don't beep
set noerrorbells         " don't beep
set list
set listchars=tab:>-,trail:- " show tabs and trailing
set laststatus=2
set cursorline

" Set font according to system
if has("mac")
  set gfn=Monaco:h12
  set shell=/bin/bash
  set nocursorline
elseif has("win32")
  set gfn=Bitstream\ Vera\ Sans\ Mono:h10
elseif has("unix")
  set gfn=Droid\ Sans\ Mono\ 10
"  set shell=/bin/bash
  set nocursorline
endif

if has("gui_running")
  colorscheme github
endif

set guioptions-=T
" set guioptions-=m

" =================================================================================================
" Editing =========================================================================================
" =================================================================================================

set nowrap        " don't wrap lines
set tabstop=2     " a tab is four spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set backspace=indent,eol,start " allow backspacinsv over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop

" Retirando espaços no fim das linhas ao salvar o arquivo
autocmd BufWritePre * :%s/\s\+$//e

" Folding
"set foldmethod=syntax
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zO')<CR>
"set fdl=1

" =================================================================================================
" Searching =======================================================================================
" =================================================================================================

set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

" =================================================================================================
" Filetype ========================================================================================
" =================================================================================================

filetype plugin indent on
syntax on

au FileType make set noexpandtab
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
au BufRead,BufNewFile *.txt call s:setupWrapping()
au FileType python  set tabstop=4 textwidth=79
set backspace=indent,eol,start
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>



" =================================================================================================
" Unclear =========================================================================================
" =================================================================================================

set pastetoggle=<F2>
set mouse=a
set hidden

" =================================================================================================
" Shortcuts =======================================================================================
" =================================================================================================

imap <silent> <C-j> <esc>:tabprevious <CR>
nmap <silent> <C-j> :tabprevious <CR>
imap <silent> <C-k> <esc>:tabnext <CR>
nmap <silent> <C-k> :tabnext <CR>
imap <silent> <C-a> <esc>:bdelete<CR>
nmap <silent> <C-a> :bdelete<CR>

nmap <silent> :e :tabe

nmap <silent> <F5> :!ruby %<CR>
imap <silent> <esc><F5> :!ruby %<CR>

nnoremap ; :

" =================================================================================================
" Plugins config and shortcuts ====================================================================
" =================================================================================================

" CommandT
nmap <silent> <C-t> :CommandTFlush<CR>:CommandT<CR>

" Project
" nmap <silent> <C-p> :Project<CR>

" NERDTree
" nmap <silent> <F4> :NERDTreeToggle <CR>
" imap <silent> <F4> :NERDTreeToggle <CR>
nmap <silent> <leader>n :NERDTreeToggle <CR>
imap <silent> <leader>n :NERDTreeToggle <CR>

" Syntastic
" set statusline+=%{SyntasticStatuslineFlag()}
" let g:syntastic_enable_signs=1
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" =================================================================================================
" Quickly edit/reload the vimrc file ==============================================================
" =================================================================================================

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
