" -----------------------------------
"|nat-chanのvimrc                    |
"|debian/ubuntu/macos/に対応         |
" -----------------------------------
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

"一行のコードが長くならないように80行目に縦線を引く
set colorcolumn=80 
"行番号を表示
set number
"タブはハードタブ
set noexpandtab
"タブ幅
set tabstop=2
set shiftwidth=2
"自動インデントの設定
set smartindent
set autoindent
"改行、タブ等を可視化
set list
set listchars=tab:\|-,trail:-,nbsp:%,extends:>,precedes:<,eol:·
"自動的に作られるうざいバックアップを消す
set noswapfile
set nobackup
let loaded_matchparen = 1

"clipboardの設定os依存強し
if has('unix')
	set clipboard=unnamedplus
endif
if has('mac')
	set clipboard=unnamed,autoselect
endif
"set cursorline

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.vim/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
	if !isdirectory(s:dein_repo_dir)
		execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
	endif
	execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

	" プラグインリストを収めた TOML ファイル
	" 予め TOML ファイル（後述）を用意しておく
	let g:rc_dir    = expand('~/.vim/rc')
	let s:toml      = g:rc_dir . '/dein.toml'
	let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

	" TOML を読み込み、キャッシュしておく
	call dein#load_toml(s:toml,      {'lazy': 0})
	call dein#load_toml(s:lazy_toml, {'lazy': 1})

	" 設定終了
	call dein#end()
	call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
	call dein#install()
endif

"スニペット用マッピング
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/'
" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

"vimrc最後にすべき設定
filetype plugin indent on
set t_Co=256
syntax on
colorscheme molokai

