" Common
set noswapfile
set ignorecase
set smartcase
set nocompatible
set number
set numberwidth=5
set history=1000
set encoding=utf-8
"set fileencodings=ucs-bom,gb2312,utf-8,utf-16,gb18030,gbk,iso-8859,iso-8859-1,big5,cp936,latin1
set fileencodings=ucs-bom,utf-8,gb2312,utf-16,gb18030,gbk,iso-8859,iso-8859-1,big5,cp936,latin1
set fileencoding=utf-8
set termencoding=utf-8


" color
syntax enable
syntax on
colorscheme desert

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
set tabstop=4
set shiftwidth=4
set softtabstop=4

" 自动添加配对符号
"inoremap ( ()<LEFT>
"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>

" Using cscope easily
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


" vundle 环境设置
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'tomasr/molokai'
"Plugin 'vim-scripts/phd'
"Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
"Plugin 'kshenoy/vim-signature'
"Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
"Plugin 'majutsushi/tagbar'
"Plugin 'vim-scripts/indexer.tar.gz'
"Plugin 'vim-scripts/DfrankUtil'
"Plugin 'vim-scripts/vimprj'
"Plugin 'dyng/ctrlsf.vim'
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'vim-scripts/DrawIt'
"Plugin 'SirVer/ultisnips'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'derekwyatt/vim-protodef'
Plugin 'scrooloose/nerdtree'
"Plugin 'fholgado/minibufexpl.vim'
"Plugin 'gcmt/wildfire.vim'
"Plugin 'sjl/gundo.vim'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'suan/vim-instant-markdown'
"Plugin 'lilydjwg/fcitx.vim'
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/winmanager'
" 插件列表结束
call vundle#end()

call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
call plug#end()

" ----------
" NERDTree
" ----------
let g:NERDTree_title='NERD Tree'

function! NERDTree_Start()
	exec 'NERDTree'
endfunction
function! NERDTree_IsValid()
	return 1
endfunction
nmap <F5> :NERDTreeToggle<cr>

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
filetype plugin indent on
set completeopt=longest,menu
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

" ----------
" NERD_Commenter
" ----------
let mapleader=","

" ----------
" vim-fswitch
" ----------
au! BufEnter *.cc  let b:fswitchdst = 'h,hpp'
au! BufEnter *.h  let b:fswitchdst = 'cc,cpp,c'
map fs :FSHere<cr>
