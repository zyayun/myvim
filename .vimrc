syntax on
set background=dark
set number
set nocompatible
"set relativenumber 
"" 在当前光标显示一条线 set cursorline set wrap " 显示打印了什么 set showcmd " 按tab键有菜单的功能 set wildmenu "结尾显示美元符号
set cursorline
set nolist
"set list
set encoding=utf-8
"let g:rehash256 = 1
"let g:molokai_original = 1
"回退不能使用
set backspace=indent,eol,start

set t_Co=256
"  volue
"  term            | t_Co
"  -----------------+------ 
"  xterm           | 8
"  xterm-256color  | 256
"  screen          | 8
"  screen-256color | 256


set filetype=on

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
" 代码折叠 "
"==========" 
set foldmethod=indent
set foldlevel=0
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
nmap s <nop>
nmap <leader>w   :w<CR>
nmap <leader>q   :q<CR>
nmap <leader>Q   :wq<CR>
nmap <leader>R   :source $MYVIMRC<CR>
nmap <leader>t   :NERDTreeToggle<CR>
nmap <leader>f   :TagbarToggle<CR>
nmap <leader>b   :buffers<CR>:buffer<Space>


"==========" 
" Neovim   "
"==========" 
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
endif

"==========" 
" Split  "
"==========" 
nmap <leader>v :set splitright<CR>:vsplit<CR>::NERDTreeToggle<CR>
nmap <up> :res +2<CR>
nmap <down> :res -2<CR>
nmap <left> :vertical resize-2<CR>
nmap <right> :vertical resize+2<CR>
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

" cursorline {
Plug 'sstallion/vim-cursorline'
" }

" 显示状态栏 {
Plug 'vim-airline/vim-airline'

  " goto tab number
  nmap <leader>1 1gt
  nmap <leader>2 2gt
  nmap <leader>3 3gt
  nmap <leader>4 4gt
  nmap <leader>5 5gt

  let g:airline#extensions#tabline#enabled = 1
  let g:airline_left_sep='▶'
  let g:airline_right_sep='|'

Plug 'vim-airline/vim-airline-themes'
  let g:airline_theme='raven'
  let g:airline#extensions#tabline#enabled = 1
  "let g:airline#extensions#tabline#left_sep = ' '
  "let g:airline#extensions#tabline#left_alt_sep = '|'
"}

" 配色 {
Plug 'morhetz/gruvbox'
autocmd vimenter * nested colorscheme gruvbox

"Plug 'itchyny/lightline.vim'
"let g:lightline = {
"      \ 'colorscheme': 'snazzy',
"      \ }
"}

" 文件树 {
Plug 'preservim/nerdtree'
" gt: go to next tab
" nnn gt : go to specified tab
" gT: go to priview tab
"  T: open file new tab,keep current menu
"}

" commenter{
Plug 'preservim/nerdcommenter'
" <leader>cc       NERDCommenterComment
" <leader>cy       NERDCommenterYank
" <leader>cu       NERDCommenterUncomment
" <leader>c<space> NERDCommenterToggle
" }

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

" Python {
" Don't support python2
if !has('python') && has('python3')
  Plug 'davidhalter/jedi-vim' | Plug 'ervandew/supertab'
  
  autocmd FileType python setlocal expandtab tabstop=4 softtabstop=4

    let g:jedi#environment_path = "venv"
    let g:jedi#environment_path = "/Users/yayun/workspace/venv"
    let g:jedi#completions_enabled = 1
    let g:jedi#use_tabs_not_buffers = 1
  
    "Key
    let g:jedi#goto_command = "<leader>d"
    let g:jedi#goto_assignments_command = "<leader>g"
    let g:jedi#goto_stubs_command = "<leader>s"
    let g:jedi#goto_definitions_command = ""
    let g:jedi#documentation_command = "K"
    let g:jedi#usages_command = "<leader>n"
    let g:jedi#completions_command = "<C-Space>"
    let g:jedi#rename_command = "<leader>r"
    let g:jedi#rename_command_keep_name = "<leader>R"

    "Complete bgcolor
    hi Pmenu ctermbg=gray guibg=gray
  "}
  
  " 代码错误检查  {
  Plug 'dense-analysis/ale'
    map <C-e> :ALENext<CR>
    map <C-u> :ALEPrevious<CR>
    let b:ale_linters = {'python': ['ruff']}
    let b:ale_fixers= {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \  'python': ['black','ruff']
    \}
    let b:ale_warn_about_trailing_whitespace = 0
    let g:airline#extensions#ale#enabled = 1
  
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
    let g:ale_sign_error = '✘'
    let g:ale_sign_warning = '⚠'
    let g:ale_lint_on_text_changed = 'never'
  "}
  
  " Python Mode {
  "Plug 'klen/python-mode'
  "  "  " <leader> r Run code"
  "
  " }
endif

" goLang {
Plug 'buoto/gotests-vim'
let g:gotests_bin = '/Users/yayun/go/bin/gotests'
let g:gotests_template_dir = '/Users/yayun/templates/'

Plug 'fatih/vim-go'
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <Leader>gi  <Plug>(go-imports)
autocmd FileType go nmap <leader>gft <Plug>(go-test-func)
autocmd FileType go nmap <Leader>ge  <Plug>(go-err-check)
autocmd FileType go nmap <Leader>gv  <Plug>(go-vet)
autocmd FileType go nmap <Leader>gr  <Plug>(go-referrers)
autocmd FileType go nmap <Leader>gc  <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>gl  <Plug>(go-lint)
autocmd FileType go nmap <leader>gs  <Plug>(go-rename)
autocmd FileType go nmap <leader>gd  <Plug>(go-doc)
autocmd FileType go nmap <leader>gp  <Plug>(go-play)

autocmd FileType go nmap <Leader>ds  <Plug>(go-debug-start)
autocmd FileType go nmap <leader>da  <Plug>(go-debug-attach)
autocmd FileType go nmap <leader>dt  <Plug>(go-debug-test)
autocmd FileType go nmap <leader>dc  <Plug>(go-debug-continue)
autocmd FileType go nmap <leader>db  <Plug>(go-debug-breakpoint)
autocmd FileType go nmap <leader>de  <Plug>(go-debug-stop)
autocmd FileType go nmap <leader>n   <Plug>(go-debug-next)
autocmd FileType go nmap <leader>s   <Plug>(go-debug-step)

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <C-c> :cclose<CR>

let g:go_fmt_command = "goimports"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let go_fold=0
" }

" 右侧显示函数列表  {
Plug 'preservim/tagbar'
  if !exists('/opt/homebrew/Cellar/ctags/5.8_2/bin/ctags')
    let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
  endif
"}

" 显示文件历史 {
Plug 'mbbill/undotree'
"}

" 完整路径搜索 {
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
"}

" 代码段 {
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#enable_camel_case_completion = 1
  let g:neocomplete#enable_recursive_forward_search = 1
  let g:neocomplete#popup_menu_height = 10

" }

" tagList {
Plug 'preservim/tagbar'
" }

" vimgit {
Plug 'tpope/vim-fugitive'
  "color
  "highlight DiffAdd    cterm=NONE ctermbg=22 ctermfg=15 guifg=#FFFFFF guibg=#4E9A06
  "highlight DiffChange cterm=NONE ctermbg=88 ctermfg=15 guifg=#FFFFFF guibg=#F57900
  "highlight DiffDelete cterm=NONE ctermbg=196 ctermfg=15 guifg=#FFFFFF guibg=#EF2929
" }

" yaml {
" brew install yamllint
"
Plug 'stephpy/vim-yaml'
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
  let g:indentLine_char = '⦙'

Plug 'pedrohdz/vim-yaml-folds'
  set foldlevelstart=20

"}

" Format {
" install python-autopep8
"Plug 'chiel92/vim-autoformat'
"  autocmd FileType python setlocal ts=2 sts=2 sw=2 expandtab
"  map <leader>F  :Autoformat<CR>
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
nmap <leader>F :FormatCode<CR>
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer black
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
  autocmd FileType swift AutoFormatBuffer swift-format
augroup END

" }

" any-jump{
Plug 'git@github.com:itchyny/lightline.vim.git'
" }

" 括号补全{
Plug 'Raimondi/delimitMate'
"}
"
call plug#end()

" modeline
" 1. ts tabstop
" 2. sw shiftwidth
" 3. sts softtabstop,每次backbreak删除X个字符
" 4. et expandtab
