if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=/home/joachim/.config/nvim/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('/home/joachim/.config/nvim/'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('VundleVim/Vundle.vim')
" File folder search
call dein#add('ctrlpvim/ctrlp.vim')
" Left side file manager
call dein#add('scrooloose/nerdtree')
" Surrounding tool for surrounding things with things
call dein#add('tpope/vim-surround')
" Multicursor tool
call dein#add('terryma/vim-multiple-cursors')
" Insert or delete brackets, parens, quotes in pair
call dein#add('jiangmiao/auto-pairs')
" Highlights white space
call dein#add('jpalardy/spacehi.vim')
" Adds the Bdelete command. Closes files without closing/messing up windows
call dein#add('moll/vim-bbye')
" Go dev-tools
call dein#add('fatih/vim-go')
" Autocomplete suggestion window (?)
call dein#add('Shougo/deoplete.nvim')
" Autocomlete plugin for C/C++
call dein#add('zchee/deoplete-clang')
"Autocomplete for Go
call dein#add('zchee/deoplete-go', {'build': 'make'})
" Adds colorscheme to Vue files
call dein#add('posva/vim-vue')
" Colorscheme
call dein#add('arakashic/nvim-colors-solarized')

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif





" ---- General configs ----

" + Turn off highlighting for search
set nohlsearch

" +  Auto update buffers on file change, ex. branch-change
set autoread

" + Initialize colorscheme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=light " or dark
colorscheme solarized

" + Stops vim from throwing errors when changing from an unsaved buffer
set hidden

" + allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Set relative line numbering
set relativenumber

" Maps "+y to copy to system clipboard
set clipboard+=unnamedplus

" + Tab settings
" Set tabs to size 2
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" + Turn on line numbers
set number

" keep a backup file (restore to previous version)
set backup		

" File placement for backup files
set backupdir=$NVIM/temp/backup//

" File placement for swap files 
set dir=$NVIM/temp/swp//

" keep an undo file (undo changes after closing)
set undofile		

" File placement for undo files
set undodir=$NVIM/temp/undo//

" keep 50 lines of command line history
set history=50		

" show the cursor position all the time
set ruler		

" display incomplete commands
set showcmd		

" do incremental searching
set incsearch		

" Auto-saves everything on loss of focus
au FocusLost * :wa

" Disable mouse
set mouse=c

" Display tabs and trailing spaces
set list listchars=trail:·,tab:┊\ ,extends:>,precedes:<,nbsp:·

" Automatic scroll when 8 lines away from bottom
set scrolloff=8
set sidescrolloff=15
set sidescroll=1


" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif


" Automatically enters insert mode when going to the terminal buffer
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" Closes scratch window when exiting insert mode
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif

" ---- Non-plugin mappings ----

" Don't use Ex mode, use Q for formatting
map Q gq

" Split configs
" Remaps ctrl-w h/j/k/l to just ctrl-h/j/k/l
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Makes navigation work in terminal
:tnoremap <C-h> <C-\><C-n><C-w>h
:tnoremap <C-j> <C-\><C-n><C-w>j
:tnoremap <C-k> <C-\><C-n><C-w>k
:tnoremap <C-l> <C-\><C-n><C-w>l
:nnoremap <C-h> <C-w>h
:nnoremap <C-j> <C-w>j
:nnoremap <C-k> <C-w>k
:nnoremap <C-l> <C-w>l



" ---- Plugin configs ----


" + NerdTree configs 
" Make NerdTree automatically start at vim-startup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Change open-nerdtree short-cut
map <C-m> :NERDTreeToggle<CR>
" Close vim if NT is the only buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" + Surround
" Map surround to s instead of S
xmap s <Plug>VSurround

" + Deoplete 
" Enable at startup
let g:deoplete#enable_at_startup = 1
" To close preview window of deoplete automatically
autocmd CompleteDone * pclose
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" + Yapf
" Remap for the yapf python autocomplete
autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>

" + CtrlP
" Ignore node_module folder
let g:ctrlp_custom_ignore = {
	\ 'dir': 'node_module',
	\}

" + deoplete-clang
let g:deoplete#sources#clang#libclang_path = "/usr/lib/x86_64-linux-gnu/libclang-3.9.so.1"
let g:deoplete#sources#clang#clang_header ="/usr/include/clang/3.9.1/include/"
