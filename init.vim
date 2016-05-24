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
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('VundleVim/Vundle.vim')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('pkukulak/idle')
call dein#add('tpope/vim-surround')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('jiangmiao/auto-pairs')
call dein#add('jpalardy/spacehi.vim')
call dein#add('moll/vim-bbye')
call dein#add('fatih/vim-go')
call dein#add('Shougo/deoplete.nvim')
call dein#add('zchee/deoplete-go', {'build': 'make'})
call dein#add('fatih/molokai')

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
colorscheme molokai

" + Stops vim from throwing errors when changing from an unsaved buffer
set hidden

" + allow backspacing over everything in insert mode
set backspace=indent,eol,start

" + Tab settings
" Set tabs to size 2
set tabstop=2 softtabstop=0 noexpandtab shiftwidth=2

" + Split configs
" Remaps ctrl-w h/j/k/l to just ctrl-h/j/k/l
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" + Turn on line numbers
set number

set backup		" keep a backup file (restore to previous version)
set undofile		" keep an undo file (undo changes after closing)
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

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

" + Vim-auto-save
" Turn on autosave by default
let g:auto_save = 1
" Do not save in insert-mode
let g:auto_save_in_insert_mode = 0
" Silence display on status line
" let g:auto_save_silent = 1

" + Deoplete 
" Enable at startup
let g:deoplete#enable_at_startup = 1
