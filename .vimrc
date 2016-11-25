" Settings {{{
set nocompatible
set relativenumber                 " By default, show line numbers relative to the cursor
set encoding=utf-8                 " UTF-8
set tabstop=2                      " Tab Width
colorscheme desert

syntax on                          " Show syntax colors
set showcmd                        " Show typed commands
set cursorline                     " Highlight the current line
set showmode                       " Shows when in paste mode
set showmatch                      " Highlight matching braces
set wildmenu                       " Shows a menu when using Tab in command paths

" set list                           " Show whitespace
" Set showbreak to '↪ '
" let &showbreak="\u21aa "
" Set listchars to '›', '·', '↲'
" let &listchars="tab:\u203a\ ,trail:\u00b7,extends:\u21b2"
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
" }}}

" Folding {{{
set foldlevelstart=99              " Open folds by default
" }}}

" Vim Behavior Settings {{{
set backspace=indent,eol,start     " Allow backspace on autoindent
set nobackup                       " Prevents creating <filename>~ files
set nowritebackup                  " Prevents creating <filename>~ files
set nolazyredraw                   " Avoids redrawing when running macros
" }}}
 :vsp
" Keyboard Mappings {{{
" Leaders {{{
let mapleader = "\<Space>"
" }}}

" Leader shortcuts {{{
nnoremap <silent> <leader>n :noh<CR>
nnoremap <leader>evimrc :e $HOME/.vimrc<CR>
nnoremap <leader>svimrc :source $HOME/.vimrc<CR>
nnoremap <leader>y gg"+yG
nnoremap <leader>json :%!python -m json.tool<CR>
" }}}

" }}}
