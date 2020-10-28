" Common
set noswapfile
set smartcase
set nocompatible
set number " 设置绝对行号
"set relativenumber " 设置相对行号
"set cursorline "突出显示当前行
" set cursorcolumn " 突出显示当前列
set showmatch " 显示括号匹配

set numberwidth=5
set history=1000
set encoding=utf-8
"set fileencodings=ucs-bom,gb2312,utf-8,utf-16,gb18030,gbk,iso-8859,iso-8859-1,big5,cp936,latin1
set fileencodings=ucs-bom,utf-8,gb2312,utf-16,gb18030,gbk,iso-8859,iso-8859-1,big5,cp936,latin1
set fileencoding=utf-8
set termencoding=utf-8

let mapleader=";"
nmap <Leader>nu :set relativenumber<CR>
nmap <Leader>nn :set norelativenumber<CR>

"开启实时搜索
set incsearch
" 搜索时大小写不敏感
set ignorecase


" 解决HOME END键失效的问题
map <esc>OH <home>
imap <esc>OH <home>
cmap <esc>OH <home>
map <esc>OF <end>
imap <esc>OF <end>
cmap <esc>OF <end>

" status bar; how to disable: set laststatus=0
set statusline=%<[%n]\%F\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]<%{&ff}>[ASCII=\%03.3b]\ %-10.(%l,%c%V%)\ %P
set laststatus=2

" switch windows
map <A-Down> <C-W>j
map <A-Up> <C-W>k
map <A-Left> <C-W>h
map <A-Right> <C-W>l

" Tab
set list
set lcs=tab:\|\ 
set expandtab
" set noexpandtab
set tabstop=4 " 设置Tab长度为4空格
set softtabstop=4
set shiftwidth=4 " 设置自动缩进长度为4空格
set autoindent " 继承前一行的缩进方式，适用于多行注释

" 自动添加配对符号
"inoremap ( ()<LEFT>
"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>

" Using cscope easily
source ~/.vim/nowarn.vim
if has ("cscope")
	set cscopetag
	set csto=0
	set csverb
	set cscopequickfix=
	nmap cs :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap cg :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap cc :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap ct :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap ce :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap cf :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap ci :cs find i <C-R>=expand("<cfile>")<CR><CR>
	nmap cd :cs find d <C-R>=expand("<cword>")<CR><CR>
endif

" =====================================
" 方便使用shell的颜色
" Format: \033[${define}${foreground};${background};${effect}m
" foreGround (3x)
" backGround (4x)
" [1: red, 2: green, 3: yellow, 9: default]
" effect [0:default, 1:bold, 2:亮度降低, 3:斜体, 4:下划线, 5:闪烁, 7m:反向图像]
" =====================================
let @r='a\033[31;49;1m'
let @g='a\033[32;49;1m'
let @y='a\033[33;49;1m'
let @n='a\033[39;49;0m'


" xyj
" 插件开始的位置
call plug#begin('~/.vim/plugged')
Plug 'ervandew/supertab'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/winmanager'
Plug 'octol/vim-cpp-enhanced-highlight'

" Vim 中文文档
Plug 'yianwillis/vimcdoc'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" 可以快速对齐的插件
Plug 'junegunn/vim-easy-align'
" 用来提供一个导航目录的侧边栏
Plug 'scrooloose/nerdtree'
" 可以使 nerdtree Tab 标签的名称更友好些
Plug 'jistr/vim-nerdtree-tabs'
" 可以在导航目录中看到 git 版本信息
Plug 'Xuyuanp/nerdtree-git-plugin'
" 查看当前代码文件中的变量和函数列表的插件，
" 可以切换和跳转到代码中对应的变量和函数的位置
" 大纲式导航, Go 需要 https://github.com/jstemmer/gotags 支持
Plug 'majutsushi/tagbar'
" 自动补全括号的插件，包括小括号，中括号，以及花括号
Plug 'jiangmiao/auto-pairs'
" Vim状态栏插件，包括显示行号，列号，文件类型，文件名，以及Git状态
"Plug 'vim-airline/vim-airline'
" 代码自动完成，安装完插件还需要额外配置才可以使用
"Plug 'Valloric/YouCompleteMe'
" 可以在文档中显示 git 信息
Plug 'airblade/vim-gitgutter'
" 配色方案
" colorscheme gruvbox
Plug 'morhetz/gruvbox'
" colorscheme one
Plug 'rakr/vim-one'
Plug 'altercation/vim-colors-solarized'
" go 主要插件
Plug 'fatih/vim-go', { 'tag': '*' }
" 自动生成注释的插件
Plug 'scrooloose/nerdcommenter'
" 强大的文件搜索插件
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" 格式化代码插件
" 这个插件特定语言需要额外支持， 比如格式化 json， 需要 js-beautify
" 安装可以 yay -S js-beautify(archlinux) 或者 npm install -g js-beautify
" 更多支持参考： https://github.com/Chiel92/vim-autoformat#default-formatprograms
Plug 'Chiel92/vim-autoformat'
" 插件结束的位置，插件全部放在此行上面
call plug#end()

" ----------
" WindowsManager
" ----------
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
nmap tl :Tlist<cr>
let g:winManagerWidth = 36
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

" ----------
" SuperTab
" ----------
filetype plugin indent on    " 启用自动补全
set completeopt=longest,menu
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"


" color
syntax enable
syntax on                    " 开启文件类型侦测
colorscheme desert
"colorscheme gruvbox " 主题
"set background=light " 主题背景 dark-深色; light-浅色

"==============================================================================
" vim-go 插件
"==============================================================================
nmap gd :GoDef <CR>
nmap gi :GoImplements <CR>
nmap gc :GoCallees <CR>
nmap gr :GoReferrers <CR>

let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1

let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_def_mapping_enabled = 1
let g:go_code_completion_enabled = 1


" 直接通过 go run 执行当前文件
autocmd FileType go nmap <leader>r :GoRun %<CR>


"==============================================================================
" NERDTree 插件
"==============================================================================

" 打开和关闭NERDTree快捷键
map <F10> :NERDTreeToggle<CR>
nmap <M-m> :NERDTreeFind<CR>

" 显示行号
let NERDTreeShowLineNumbers=1
" 打开文件时是否显示目录
let NERDTreeAutoCenter=0
" 是否显示隐藏文件
let NERDTreeShowHidden=0
" 设置宽度
" let NERDTreeWinSize=31
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 打开 vim 文件及显示书签列表
let NERDTreeShowBookmarks=2

" 在终端启动vim时，共享NERDTree
" let g:nerdtree_tabs_open_on_console_startup=1
let g:NERDTree_title='NERD Tree'


"==============================================================================
"  majutsushi/tagbar 插件
"==============================================================================

" majutsushi/tagbar 插件打开关闭快捷键
nmap <F9> :TagbarToggle<CR>

let g:tagbar_type_go = {
			\ 'ctagstype' : 'go',
			\ 'kinds'     : [
			\ 'p:package',
			\ 'i:imports:1',
			\ 'c:constants',
			\ 'v:variables',
			\ 't:types',
			\ 'n:interfaces',
			\ 'w:fields',
			\ 'e:embedded',
			\ 'm:methods',
			\ 'r:constructor',
			\ 'f:functions'
			\ ],
			\ 'sro' : '.',
			\ 'kind2scope' : {
			\ 't' : 'ctype',
			\ 'n' : 'ntype'
			\ },
			\ 'scope2kind' : {
			\ 'ctype' : 't',
			\ 'ntype' : 'n'
			\ },
			\ 'ctagsbin'  : 'gotags',
			\ 'ctagsargs' : '-sort -silent'
			\ }


"==============================================================================
"  nerdtree-git-plugin 插件
"==============================================================================
let g:NERDTreeGitStatusIndicatorMapCustom = {
			\ "Modified"  : "✹",
			\ "Staged"    : "✚",
			\ "Untracked" : "✭",
			\ "Renamed"   : "➜",
			\ "Unmerged"  : "═",
			\ "Deleted"   : "✖",
			\ "Dirty"     : "✗",
			\ "Clean"     : "✔︎",
			\ 'Ignored'   : '☒',
			\ "Unknown"   : "?"
			\ }

let g:NERDTreeGitStatusShowIgnoredStatus = 1
nmap <Leader>pwd :NERDTreeCWD<CR>

"==============================================================================
"  其他插件配置
"==============================================================================

" tab 标签页切换快捷键
:nn <Leader>1 1gt
:nn <Leader>2 2gt
:nn <Leader>3 3gt
:nn <Leader>4 4gt
:nn <Leader>5 5gt
:nn <Leader>6 6gt
:nn <Leader>7 7gt
:nn <Leader>8 8gt
:nn <Leader>9 8gt
:nn <Leader>0 :tablast<CR>

:nn <M-1> 1gt
:nn <M-2> 2gt
:nn <M-3> 3gt
:nn <M-4> 4gt
:nn <M-5> 5gt
:nn <M-6> 6gt
:nn <M-7> 7gt
:nn <M-8> 8gt
:nn <M-9> 9gt
:nn <M-0> :tablast<CR>

" 自动注释的时候添加空格
let g:NERDSpaceDelims=1

"==============================================================================
" 自定义的额外配置 
"==============================================================================
"
" 自动保存 session
"autocmd VimLeave * mks! ~/.vim/session.vim
" 加载 session 的快捷键
"nmap <Leader>his :source ~/.vim/session.vim<CR>

"nnoremap <silent> <C-p> :Files<CR>
"nnoremap <silent> <C-S-i> :Autoformat<CR>
