"  _      _ _        _
" (_)_ _ (_) |_ __ _(_)_ __
" | | ' \| |  _|\ V / | '  \
" |_|_||_|_|\__(_)_/|_|_|_|_|
"


""""""""""""""
""""PLUGIN""""
""""""""""""""

if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin("~/.local/share/nvim/plugged")
" Themes
" gruvbox8 is a gruvbox evolution
Plug 'lifepillar/vim-gruvbox8'
Plug 'itchyny/lightline.vim'

" Focus
Plug 'junegunn/goyo.vim' " Distract-free mode
Plug 'junegunn/limelight.vim' " Focus on current block

" Tools
Plug 'junegunn/vim-easy-align' " Explicit, right? EDIT : Actually, no so TODO: comment.
Plug 'farmergreg/vim-lastplace' " Go to last position in file
Plug 'gko/vim-coloresque' " TODO: same as vim-easy-align
call plug#end()

""""""""""""
""""LOOK""""
""""""""""""

"" Syntax
"""""""""

syntax on
autocmd FileType python let python_highlight_all = 1

"" Invisible character
""""""""""""""""""""""

"set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¤,precedes:«,extends:»
set listchars=tab:→\ ,nbsp:␣,trail:•,eol:¤,precedes:«,extends:»
set list


"" Colorscheme
""""""""""""""
"let g:gruvbox_italics = 0
"let g:gruvbox_italicize_strings = 0
colorscheme gruvbox8
"set background=dark
hi Normal guibg=NONE ctermbg=NONE
set cursorline
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
"let g:limelight_conceal_ctermfg = 'white'

"""""""""""""""""
""""BEHAVIOUR""""
"""""""""""""""""

"" Allow to use mouse
"""""""""""""""""""""
set mouse=a

"" Scroll when active line is X lines away from buffer top/bottom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=10

"" Number
"""""""""
set number relativenumber
" Define when no toggle relative number
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * if !exists("t:goyo_master") | set relativenumber | endif
    autocmd BufLeave,FocusLost,InsertEnter   * if !exists("t:goyo_master") | set norelativenumber | endif
augroup END

"" Tabs
"""""""

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set autoindent

"" Spelling settings
""""""""""""""""""""
syn spell toplevel
set spelllang=fr,en

"" Goyo
"""""""
augroup goyolook
    autocmd!
    autocmd User GoyoEnter Limelight
    autocmd User GoyoEnter :set nolist
    autocmd User GoyoLeave Limelight!
    autocmd User GoyoLeave :set list
augroup END


"" Clean files
""""""""""""""
"autocmd BufWritePre * %s/\s\+$//e

"" Search
"""""""""
set ignorecase
set smartcase


""""""""""""
""""KEYS""""
""""""""""""

"" Leader
"""""""""

let mapleader=" "
nnoremap <Space> <Nop>

"" Normal mode remap
""""""""""""""""""""

" Enter insert line under cursor
nmap <Enter> o<Esc>k
" Shift-Enter insert line above cursor (not working on console)
nmap <S-Enter> O<Esc>j
" Move between windows
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>

nmap <silent> <Leader>f :Goyo 100<CR>

" Move between tabs
nmap <silent> <Leader>l :tabnext<CR>
nmap <silent> <Leader>h :tabNext<CR>

" easy read/copy
nmap <silent> <Leader>c :set list!<CR>:set relativenumber!<CR>:set number!<CR>

"" ???
"""""""""""""""""""""

"" Remap
noremap <silent> <F2> :set spell!<Enter>:set spell?<Enter>

" remove spaces at EOL
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

nnoremap , .


""""""""""""""""""""""""
"""VIM COMPATAIBILITY"""
""""""""""""""""""""""""

if !has('nvim')
    set nocompatible
    set wrap
    set ruler
    set autoindent
    set noshowmode
endif

