" Common
set noswapfile
set ignorecase
set nocompatible
set number
set numberwidth=5
set history=1000
set fileencodings=utf-8,bg18030,gbk,utf-16,big5

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
set tabstop=4
set shiftwidth=4
set softtabstop=4

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

" Syntax
augroup filetype
au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END

augroup filetype
au! BufRead,BufNewFile *.td     set filetype=tablegen
augroup END

" =====================================
" 自动添加文件描述
" =====================================
function AddTitle()
	call setline(1,"/*")
	call append(1,"* Filename: " . expand("%"))
	call append(2,"* " . "Last modified: " . strftime("%Y-%m-%d %H:%M"))
	call append(3,"* Author: Yongjian Xu -- yongjianchn@gmail.com")
	call append(4,"* Description: ")
	call append(5,"*/")
endf
map myc :call AddTitle():$o
function AddTitle2()
	call setline(1,"#!/usr/bin/env python")
	call append(1,"#-*- coding: utf-8 -*-")
	call append(2,"#Filename: " . expand("%"))
	call append(3,"#" . "Last modified: " . strftime("%Y-%m-%d %H:%M"))
	call append(4,"#Author: Yongjian Xu -- yongjianchn@gmail.com")
	call append(5,"#Description: ")
endf
map myp :call AddTitle2():$o
function AddTitle1()
	call setline(1,"#!/bin/bash")
	call append(1,"#Filename: " . expand("%"))
	call append(2,"#" . "Last modified: " . strftime("%Y-%m-%d %H:%M"))
	call append(3,"#Author: Yongjian Xu -- yongjianchn@gmail.com")
	call append(4,"#Description: ")
endf
map mys :call AddTitle1():$o

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

" ====================
" Plugin
" ====================

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
let g:winManagerWidth = 50
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
