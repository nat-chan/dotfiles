"{{{コーディング規約
"┌──────────────────────────────┐
"│▛▖▐  ▞▖ ▀▜▀▘▄▄ ▞▀▙ ▌ ▐  ▞▖ ▛▖▐│
"│▌▝▟ ▞ ▝▖ ▐     ▚▄▖ ▛▀▜ ▞ ▝▖▌▝▟│
"└──────────────────────────────┘
"if has('unix')
"	" Unix 用設定
"endif
"if has('mac')
"	" Mac 用設定
"endif
"
"if has('unix') || has('mac')
"	" Unix と Mac の共通設定
"endif
"
"if has('win32') || has ('win64')
"	" Windows 32bit, Windows 64bit のどちらか
"endif
"}}}

"改行コードを判別
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac
" TODO
"一行のコードが長くならないように80行目に縦線を引く
set colorcolumn=80
"set nowrap
"行番号を表示
set number
"タブはハードタブ
set noexpandtab
"ハードタブの表示幅
set tabstop=2
"ソフトタブのインデント幅
set shiftwidth=4
"自動インデントの設定
set smartindent
set autoindent
"同じインデントにコメントを書きたいとき、#を入力すると行頭に行ってしまうので
set nosmarttab
"改行、タブ等を可視化
set list
"set listchars=tab:\|-,trail:-,nbsp:%,extends:>,precedes:<,eol:·
set listchars=tab:\|\ ,trail:-
"自動的に作られるうざいバックアップを消す
set noswapfile
set nobackup
"let loaded_matchparen = 1 "対応するかっこのハイライトを消す
set backspace=indent,eol,start
"modifiedでも新しいbufferを開けるようにする
set hidden
"clipboardの設定os依存強し
if has('unix')
	set clipboard=unnamedplus
endif
if has('mac')
	set clipboard=unnamed,autoselect
endif
"set cursorline
"set termguicolors

"文末に自動で改行をつけない
set nofixeol

let mapleader = "\<Space>"

let $PATH = "~/.pyenv/shims:".$PATH

let g:python_host_prog = "/home/N/.pyenv/versions/2.7.13/bin/python"
let g:python3_host_prog = "/home/N/.pyenv/versions/anaconda3-4.3.1/bin/python"

"conceallevel=0
let g:tex_conceal = ''
let g:vim_markdown_folding_disabled=1

" Vimであいまいな幅の文字の論理幅を1にする
set ambiwidth=single

" East Asian Ambiguous Width問題
" 端末側であいまいな幅の文字の論理幅を1にする
"call writefile(["\e[?8428h"], '/dev/tty')
"マーカーで折りたたむ zaで展開
set foldmethod=marker

"{{{ deinプラグイン --------------------------------------------------------
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
"
" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
	if !isdirectory(s:dein_repo_dir)
		execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
	endif
	execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif
" プラグインリストを収めた TOML ファイル
" 予め TOML ファイルを用意しておく
let g:rc_dir    = expand('~/.vim/rc')
let s:toml      = g:rc_dir . '/dein.toml'
let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
" 設定開始
" dien#beginの第二引数に変更があった場合は読み込みなおす
if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir, [$MYVIMRC, s:toml, s:lazy_toml])
	" TOML を読み込み、キャッシュしておく
	call dein#load_toml(s:toml,      {'lazy': 0})
	call dein#load_toml(s:lazy_toml, {'lazy': 1})
	" 設定終了
	call dein#end()
	call dein#save_state()
endif
"
" もし、未インストールものものがあったらインストール
if dein#check_install()
	call dein#install()
endif
"}}}

"Vim の外部プロセス呼び出しがPOSIX互換シェルを前提としている
"そのためfishをデフォルトシェルにしている時次の設定が必要
if $SHELL =~ '/fish$'
	set shell=bash
endif

"自分のマッピング
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>. :<C-u>e .<CR>
nnoremap <Leader>v :<C-u>e ~/.vimrc<CR>
nnoremap <Leader>s :<C-u>source %<CR>

inoremap <silent> jj <ESC>
inoremap <silent> kk <ESC>
inoremap <silent> ¥ \
inoremap <silent> 　 <Space>

cnoremap <C-a> <Home>
cnoremap <C-e> <End>
"cnoremap <C-b> <S-Left>
"cnoremap <C-w> <S-Right>
tnoremap <silent> <ESC> <C-\><C-n>
tnoremap <silent> jj <C-\><C-n>

"vimrc最後にすべき設定
filetype plugin indent on
set t_Co=256
syntax on
