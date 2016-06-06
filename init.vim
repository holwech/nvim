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
call dein#add('mattn/emmet-vim')

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

" Set relative line numbering
set relativenumber

" Maps "+y to copy to system clipboard
set clipboard+=unnamedplus

" + Tab settings
" Set tabs to size 2
set tabstop=2 softtabstop=0 noexpandtab shiftwidth=2


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

" Remap exit terminal to Esc-key
tnoremap <Esc> <C-\><C-n>




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

" + Neosnippet
" Plugin key-mappings
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
" Adds SuperTab behavior
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    neosnippet#mappings#expand_or_jump_impl() : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" Conceals markers
if has('conceal')
	set conceallevel=2 concealcursor=niv
endif

" + Emmet
" Enable just for html, css and js
let g:user_emmet_install_global = 0
autocmd FileType html,css,js EmmetInstall
