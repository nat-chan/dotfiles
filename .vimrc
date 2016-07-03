"{{{コーディング規約
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
"}}}
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
"lightlineを常に表示
set laststatus=2
"clipboardの設定os依存強し
if has('unix')
	set clipboard=unnamedplus
endif
if has('mac')
	set clipboard=unnamed,autoselect
endif
"set cursorline

"{{{
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
"
" 設定開始
if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)
"
	" プラグインリストを収めた TOML ファイル
	" 予め TOML ファイル（後述）を用意しておく
	let g:rc_dir    = expand('~/.vim/rc')
	let s:toml      = g:rc_dir . '/dein.toml'
	let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
"
	" TOML を読み込み、キャッシュしておく
	call dein#load_toml(s:toml,      {'lazy': 0})
	call dein#load_toml(s:lazy_toml, {'lazy': 1})
"
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

"スニペット用マッピング
let g:neosnippet#snippets_directory='~/.vim/neosnippets'
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

nnoremap [unite]    <Nop>
nmap     <Space>u [unite]
nnoremap <silent> [unite]b   :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]f   :<C-u>Unite file<CR>
nnoremap <silent> [unite]y   :<C-u>Unite history/yank<CR>
nnoremap <silent> [unite]g   :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]r   :<C-u>Unite -buffer-name=register register<CR> nnoremap <silent> [unite]u   :<C-u>Unite file_mru buffer<CR>

nnoremap [vimfilter]    <Nop>
nmap     <Space>v [vimfilter]
nnoremap <silent> [vimfilter]v   :<C-u>VimFiler -split -simple -winwidth=20 -no-quit<CR>
nnoremap <silent> [vimfilter]<Space>   :<C-u>VimFiler<CR>

inoremap <silent> jj <ESC>
let g:vimfiler_as_default_explorer = 1

let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-f2)
"vimrc最後にすべき設定
filetype plugin indent on
set t_Co=256
syntax on
"hi Comment ctermfg=102
colorscheme molokai
hi Visual ctermbg=236
