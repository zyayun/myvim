syntax on
set background=dark
set number
set nocompatible
set relativenumber
set nolist
" 在当前光标显示一条线
set cursorline
set wrap
" 显示打印了什么
set showcmd
" 按tab键有菜单的功能
set wildmenu
"结尾显示美元符号
"set list
set encoding=utf-8
let g:rehash256 = 1
let g:molokai_original = 1
set term=ansi

"==========" 
" search   "
"==========" 
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

" 编辑器可以使用鼠标
set mouse=a
set encoding=utf-8
let &t_ut=''
" 关闭响铃
set vb t_vb=

"==========" 
"    缩进  "
"==========" 
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
"==========" 
"  Path    "
"==========" 
set path+=**

" 改键位 noremap n h    n建等于h键 "
noremap U 5k
noremap E 5j

" 键位映射 {
"==========" 
"   KeyMap  "
"==========" 
let mapleader=";"
map s <nop>
map <leader>w   :w<CR>
map <leader>q   :q<CR>
map <leader>Q   :wq<CR>
map <leader>R   :source $MYVIMRC<CR>
map <leader>tt  :NERDTreeToggle<CR>

"==========" 
" Split  "
"==========" 
map <leader>v   :vs<CR>
"}

"==========" 
" 跳转到上次编辑的位置
"==========" 
autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

"==========" 
"  Plugins "
"==========" 
call plug#begin()

" 显示状态栏 {
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"}

" 配色 {
Plug 'connorholyday/vim-snazzy'
let g:SnazzyTransparent = 0
"}

" 文件树 {
Plug 'preservim/nerdtree'
"}

" git风格文件树 {
Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
"}

" 代码补全 {
"Plug 'ycm-core/YouCompleteMe'
"Plug 'davidhalter/jedi-vim'
Plug 'github/copilot.vim'
"}

" 代码错误检查  {
Plug 'dense-analysis/ale'
"}

" 右侧显示函数列表  {
Plug 'preservim/tagbar'
"}

" 显示文件历史 {
Plug 'mbbill/undotree'
"}

" 完整路径搜索 {
"Plug 'kien/ctrlp'
"}

" 代码段 {
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
" }
"

" unknow {
Plug 'tpope/vim-pathogen'
Plug 'klen/python-mode'
"}

call plug#end()

" 配色 {
colorscheme snazzy
"}