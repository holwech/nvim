set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()




" ---- Plugins go here ----
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'pkukulak/idle'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jpalardy/spacehi.vim'
Plugin 'moll/vim-bbye'
Plugin 'vim-scripts/vim-auto-save'
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required





" ---- General configs ----

" + Turn off highlighting for search
set nohlsearch

" +  Auto update buffers on file change, ex. branch-change
set autoread

" + Initialize colorscheme
colorscheme idle

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

" + vim-auto-save
" Turn on autosave by default
let g:auto_save = 1
" Do not save in insert-mode
let g:auto_save_in_insert_mode = 0
" Silence display on status line
" let g:auto_save_silent = 1
