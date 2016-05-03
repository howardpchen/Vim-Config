filetype plugin on
filetype indent on
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4


set fileformats=unix,mac,dos
set directory=.,$TEMP
set encoding=utf-8
set background=dark  " will be overwritten by gvimrc
set t_Co=256

"set regexpengine=1
syntax enable
set nocompatible
set grepprg=grep\ -nH\ $*
set ts=4
set shiftwidth=4
set nu
set lbr
set autoindent
set smartindent
set backspace=indent,eol,start whichwrap+=<,>,[,]
set showmatch
set ignorecase smartcase
set incsearch
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
set mouse=a
set expandtab
set tw=0  " Set to 0 for softwrap, and for hardwrap set to 72 because standard editor width is 80 and I like having line numbers on the left side, so this way gqip command will not create strange soft wrap on top of hard wrap.


"""""""""""""""""""""""""""""""
" Syntastic Setups
"""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:user_emmet_leader_key='<C-X>'

exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
let g:indentLine_char = '│'
let g:indentLine_first_char = '│'
let g:indentLine_showFirstIndentLevel = 1
set wrap linebreak nolist

map <ESC><ESC> :w<CR>
map <C-J>      gj
map <C-K>      gk
imap <C-F>     <Space>{<CR><C-O>O

nmap g=        ^/><<CR>a<CR><ESC>
imap g=        <ESC>^/><<CR>a<CR>

imap <C-L>     <RIGHT>
imap <C-J>     <ESC>gja
imap <C-K>     <ESC>gka
imap <C-H>     <LEFT>
imap <C-E>     <ESC>ldwi
vmap j gj
vmap k gk

nmap <C-M-O>      :MRU<CR>
nmap <C-O>        :NERDTree<CR>
nmap <Leader>s    :source $MYVIMRC<CR>
nmap <Leader>v    :e! $MYVIMRC<CR>
nmap <SPACE> zz
nnoremap <Leader>q <C-V>

""""""""""""""""""""""""""""""
"Hotkey for languages
""""""""""""""""""""""""""""""
nmap <Leader>S    :set filetype=scala<CR>
nmap <Leader>a    :set filetype=lua<CR>

vmap <C-C> "+y
vmap <C-V> "+p
vmap <C-M-V> S]%a(<ESC>"+pa)<ESC>

let g:NERDTreeDirArrows=1
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"====Instantly Better Vim Plugin ====

"let g:DVB_TrimWS = 1
"vmap  <expr>  <LEFT>   DVB_Drag('left')  
"vmap  <expr>  <RIGHT>  DVB_Drag('right')
"vmap  <expr>  <DOWN>   DVB_Drag('down')
"vmap  <expr>  <UP>     DVB_Drag('up')  
"vmap  <expr>  D        DVB_Duplicate() 

"======== Shortcuts for Vim-Blog ========

"nnoremap <C-M-S> :BlogSave draft<CR>
"inoremap <C-M-S> <ESC>:BlogSave draft<CR>a
"nnoremap <C-M-P> :BlogPreview draft<CR>
"inoremap <C-M-P> <ESC>:BlogPreview draft<CR>a

" =======Set up for Pencil and prose stuff======
"Set to text filetype if not otherwise specified

"autocmd BufEnter * if &filetype == "" | setlocal ft=markdown | endif
"let g:pencil#wrapModeDefault = 'soft' " default is 'hard'
"augroup pencil
"  autocmd!
"  autocmd FileType text,markdown,mkd call pencil#init()
"                            \ | call textobj#sentence#init()
"augroup END

" ==============================================
" 
" Setup for Goyo and Limelight
"
" ==============================================

function! s:goyo_enter()
  silent !tmux set status off
  set noshowmode
  set noshowcmd
  set guioptions-=r
  set guioptions-=L
  set scrolloff=999
  Limelight
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  set showmode
  set showcmd
  set guioptions+=r
  set guioptions+=L
  set scrolloff=5
  Limelight!
  " ...
endfunction

autocmd! User GoyoEnter
autocmd! User GoyoLeave
autocmd  User GoyoEnter nested call <SID>goyo_enter()
autocmd  User GoyoLeave nested call <SID>goyo_leave()
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" ================= END GOYO SETUP ===============

" ========== Begin Large File Management Options =========

" file is large from 10mb
let g:LargeFile = 1024 * 1024 * 10
augroup LargeFile 
 autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function! LargeFile()
 " no syntax highlighting etc
 set eventignore+=FileType
 " save memory when other file is viewed
 setlocal bufhidden=unload
 " is read-only (write with :w new_filename)
 setlocal buftype=nowrite
 " no undo possible
 setlocal undolevels=-1
 " display message
 autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."
endfunction

"=========================================================

execute pathogen#infect()
source $VIMRUNTIME/mswin.vim
behave mswin

colorscheme wombat256i
