set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'christianrondeau/vim-loggly-search'
Plug 'christianrondeau/vim-base64'
if filereadable(expand("~/.vimrc_plugins"))
  source ~/.vimrc_plugins
endif

let g:loggly_account = "mediaclip"
"Loggly plugins {{{
let g:loggly_curl_auth = "--netrc-file C:/Users/dominic.st-jacques/.netrc"
let g:loggly_filter = "call Loggly_filter_mediaclip()"
function! Loggly_filter_mediaclip()
    nnoremap <leader>message :set filetype=text<CR>:v/"message"/d<CR>:%s/^ *"message": "//<CR>:%s/"$//<CR>gg
endfunction
" }}}

" All of your Plugs must be added before the following line
call plug#end()
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
filetype plugin on

"Settings {{{
set relativenumber                 " By default, show line numbers relative to the cursor
set encoding=utf-8                 " UTF-8
set tabstop=2                      " Tab Width
colorscheme desert
set laststatus=2                   " Because vim-airline says so...

syntax on                          " Show syntax colors
set showcmd                        " Show typed commands
set cursorline                     " Highlight the current line
set showmode                       " Shows when in paste mode
set showmatch                      " Highlight matching braces
set wildmenu                       " Shows a menu when using Tab in command paths
set nowrap                         " No line-wrapping

" set list                           " Show whitespace
" Set showbreak to '↪ '
" let &showbreak="\u21aa "
" Set listchars to '›', '·', '↲'
" let &listchars="tab:\u203a\ ,trail:\u00b7,extends:\u21b2"
" }}}
set clipboard=unnamed,unnamedplus  " Use system register

" Terminal Settings {{{
if has("gui_running") 
	" gVim
	au GuiEnter * set visualbell t_vb= " No screen flash (GVim)
	"colors wombat
	set lines=60 columns=180
	set guifont=Hack:h11
	set guioptions-=T " Hide toolbar
	let g:airline_powerline_fonts = 1 " Enables vim-airline pretty separators
elseif stridx(&shell, 'cmd.exe') != -1
	" Vim in Windows Terminal
	"colors noctu
else
	" Vim on Linux
	"colors wombat
	let g:airline_powerline_fonts = 1 " Enables vim-airline pretty separators
  set title 
  set titleold="" 
  set titlestring=VIM:\ %F
	set mouse=a " Allows mouse when using SSH from Termux
endif
" }}}

" Search Settings {{{
set incsearch                      " Show search result as you type
set hlsearch                       " highlight all / search results
set gdefault                       " Use /g by default

" Use very magic regex everywhere
nnoremap / /\v
vnoremap / /\v
cnoremap %s/ %sm/\v
cnoremap \>s/ \>sm/\v
cnoremap g/ g/\v
cnoremap g!/ g!/\v
cnoremap v/ v/\v
cnoremap v!/ v!/\v
" }}}

" Folding {{{
set foldlevelstart=99              " Open folds by default
" }}}

" Vimscript {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal foldlevel=0
augroup END
" }}}

" Vim Behavior Settings {{{
set backspace=indent,eol,start     " Allow backspace on autoindent
set nobackup                       " Prevents creating <filename>~ files
set nowritebackup                  " Prevents creating <filename>~ files
set noswapfile                     " Prevents creating .swp files
set nolazyredraw                   " Avoids redrawing when running macros
" }}}

" Keyboard Mappings {{{
" Leaders {{{
let mapleader = "\<Space>"
" }}}

" Leader shortcuts {{{
nnoremap <silent> <leader>n :nohl<CR>
nnoremap <leader>ev :e $HOME/.vim/.vimrc<CR>
nnoremap <leader>sv :source $HOME/.vim/.vimrc<CR>
nnoremap <leader>y gg"+yG
augroup filetype_json
	autocmd!
	autocmd FileType json nnoremap <buffer> <leader>js :%!python -m json.tool<CR>
augroup END
" }}}

" }}}
