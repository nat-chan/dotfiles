set encoding=utf-8 "このvimrcのエンコーディング
"Vi互換モードをなくす
set nocompatible
"NERDTreeやバッファの選択をマウスでもできるようにする
"set mouse=a
"ターミナル上からコピペできるようにする
set mouse=

"改行コードを判別
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac

"一行のコードが長くならないように130行目に縦線を引く
set colorcolumn=130
set nowrap
"行番号を表示
set number
"タブはスペースに変換
set expandtab
"ハードタブの表示幅
set tabstop=4
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
"行末の空白とタブを可視化
"set listchars=tab:\|-,trail:-

set fillchars=fold:\ 
set foldtext=getline(v:foldstart)
set foldopen=

"自動的に作られるうざいバックアップを消す
set noswapfile
set nobackup
"カーソルを見失うので対応するかっこのハイライトを消す
"rainbowプラグインを入れてるので十分わかるはず。
"ノーマルモードで%を入力することで対応するかっこにジャンプできる
let loaded_matchparen = 1
set noshowmatch
"バックスペースで行を跨いで文字を消せるようにする
set backspace=indent,eol,start
"新しいbufferを開くときに編集を保存するか聞かない
set hidden

"文末に自動で改行をつけない
set nofixeol
"スワップファイルが発見されたときに "注意" しない
set shortmess=A

au VimResized * wincmd =
au FileType netrw setl bufhidden=delete
au TermOpen * setlocal nonumber

set nosplitbelow
set nosplitright
" Vimであいまいな幅の文字の論理幅を1にする
set ambiwidth=single

"マーカーで折りたたむzaで畳み込みをトグル
set foldmethod=marker

"置換プレビュー
set inccommand=nosplit

set wildoptions=pum
set pumblend=20

"Vim の外部プロセス呼び出しがPOSIX互換シェルを前提としている
"そのためfishをデフォルトシェルにしている時次の設定が必要
if $SHELL =~ '/fish$'
	set shell=bash
endif

"ターミナルモードをEscで抜けられるようにする
"ただしターミナル内のプログラムにEscを送信できなくなる
tnoremap <silent> <ESC> <C-\><C-n>

"コマンドライン行でC-a,C-eで行頭、行末
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

let mapleader = "\<Space>"

if filereadable($PYENV_ROOT . '/shims/python3')
    let g:python3_host_prog = expand($PYENV_ROOT . '/shims/python3')
endif

"プラグインをここに追記
"Plug リポジトリ名
"新しいプラグインをインストールするときは
":source ~/.vimrc
":PlugInstall
call plug#begin('~/.vim/plugged')

"{{{ NyaoVim
if exists('g:nyaovim_version') && !exists('g:nyaovim_loaded')
    let g:nyaovim_loaded = 1
"    let loaded_netrwPlugin = 1
"    let g:NERDTreeHijackNetrw=0
    cd $HOME
    bdelete nyaovim
    Plug 'Nymphium/nyaovim-dynfont' "{{{
    nnoremap <silent> <C-+> :IncrNyaovimFontSize<CR>
    nnoremap <silent> <C-;> :IncrNyaovimFontSize<CR>
    nnoremap <silent> <C-_> :DecrNyaovimFontSize<CR>
    "}}}
endif "}}}

"{{{ Appearance
    Plug 'tomasr/molokai'
    Plug 'itchyny/lightline.vim' "{{{
    "        \ 'separator': { 'left': '⮀', 'right': '⮂' },
    "        \ 'subseparator': { 'left': '⮁', 'right': '⮃' },
    set laststatus=2
    let g:lightline = {
            \ 'colorscheme': 'powerline',
            \ 'mode_map': {'c': 'NORMAL'},
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ], ['fugitive', 'absolutepath' , 'modified'] ]
            \ },
            \ 'component_function': {
            \   'modified': 'LightlineModified',
            \   'readonly': 'LightlineReadonly',
            \   'fugitive': 'LightlineFugitive',
            \   'filename': 'LightlineFilename',
            \   'fileformat': 'LightlineFileformat',
            \   'filetype': 'LightlineFiletype',
            \   'fileencoding': 'LightlineFileencoding',
            \   'mode': 'LightlineMode'
            \ }
            \ }
    function! LightlineModified()
      return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
    endfunction
    function! LightlineReadonly()
      return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
    endfunction
    function! LightlineFilename()
      return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
            \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
            \  &ft == 'unite' ? unite#get_status_string() :
            \  &ft == 'vimshell' ? vimshell#get_status_string() :
            \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
            \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
    endfunction
    function! LightlineFugitive()
      if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
        return fugitive#head()
      else
        return ''
      endif
    endfunction
    function! LightlineFileformat()
      return winwidth(0) > 70 ? &fileformat : ''
    endfunction
    function! LightlineFiletype()
      return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
    endfunction
    function! LightlineFileencoding()
      return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
    endfunction
    function! LightlineMode()
      return winwidth(0) > 60 ? lightline#mode() : ''
    endfunction
    "}}}
    Plug 'luochen1990/rainbow' "{{{
    let g:rainbow_active = 1
    let g:rainbow_conf = {
    \	'guifgs': [
    \		'cyan',
    \		'magenta',
    \		'yellow',
    \		'red',
    \		'green',
    \		'blue',
    \	],
    \	'ctermfgs': [
    \		'cyan',
    \		'magenta',
    \		'yellow',
    \		'red',
    \		'green',
    \		'blue',
    \	],
    \	'operators': '_,_',
    \	'parentheses': [
    \		'start=/(/ end=/)/ fold',
    \		'start=/\[/ end=/\]/ fold',
    \		'start=/{/ end=/}/ fold'
    \	],
    \	'separately': {
    \		'*': {},
    \		'tex': {
    \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \		},
    \		'lisp': {
    \			'guifgs': [
    \				'royalblue3',
    \				'darkorange3',
    \				'seagreen3',
    \				'firebrick',
    \				'darkorchid3'
    \			],
    \		},
    \		'vim': {
    \			'parentheses': [
    \				'start=/(/ end=/)/',
    \				'start=/\[/ end=/\]/',
    \				'start=/{/ end=/}/ fold',
    \				'start=/(/ end=/)/ containedin=vimFuncBody',
    \				'start=/\[/ end=/\]/ containedin=vimFuncBody',
    \				'start=/{/ end=/}/ fold containedin=vimFuncBody'
    \			],
    \		},
    \		'html': {
    \			'parentheses': [
    \				'start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|'.
    \				'menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)'.
    \				'(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".
    \				'"><=`]*))?)*\>/ end=#</\z1># fold'
    \			],
    \		},
    \		'css': 0,
    \	}
    \} "}}}
    Plug 'powerman/vim-plugin-AnsiEsc'
"}}} Appearance

"{{{ Common
    Plug 'scrooloose/nerdtree' "{{{
    let g:NERDTreeMouseMode=3 "シングルクリックで開く
    function! MyNERDTreeToggle() abort
        :NERDTreeToggle
        if &ft == 'nerdtree'
            call b:NERDTree.root.refresh()
            call b:NERDTree.render()
            :wincmd p
        endif
    endfunction
    "nnoremap <silent> <C-b> :NERDTreeToggle<CR>:execute (&ft == 'nerdtree' ? ':wincmd p' : '')<CR>
    nnoremap <silent> <C-b> :call MyNERDTreeToggle()<CR>
    autocmd DirChanged * :NERDTreeCWD | :wincmd p
    "}}}
    Plug 'h1mesuke/vim-alignta'
    Plug 'nat-chan/ksm.vim'
    Plug 'tyru/capture.vim'
    Plug 'vim-jp/vimdoc-ja' "{{{
    set helplang=ja,en
    "}}}
    Plug 'Shougo/denite.nvim'
    Plug 'Shougo/neco-vim'
    Plug 'tpope/vim-fugitive'
    Plug 'thinca/vim-quickrun'
    Plug 'Shougo/context_filetype.vim', {'for':'vim'}
    Plug 'osyo-manga/vim-precious'    , {'for':'vim'}
    Plug 'gorodinskiy/vim-coloresque' , {'for':'vim'}
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
"}}} Common

"{{{ Python
    Plug 'Shougo/deoplete.nvim'   , {'do':':UpdateRemotePlugins'} " 非同期補完 キーなしでも{{{
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#sources#jedi#show_docstring = 1              " 1にしないと関数のparamしかpreviewされない
    "}}}
    Plug 'w0rp/ale'               , {'for':['python', 'ipynb']}              " 非同期チェック         {{{
    let g:ale_linters = {'python': ['mypy']}
    "}}}
    Plug 'davidhalter/jedi-vim'   , {'for':['python', 'ipynb']}              "                        {{{
    let g:jedi#auto_initialization = 0                          " デフォルトのキーマップをしない(deopleteを使用)
    autocmd InsertEnter *.py call g:jedi#show_call_signatures()
    autocmd InsertLeave *.py call g:jedi#clear_call_signatures()
    autocmd Filetype python nnoremap <Leader>g :call jedi#goto()<CR>
    autocmd Filetype python nnoremap <Leader>u :call jedi#usages()<CR>
    autocmd Filetype python nnoremap <Leader>r :call jedi#rename()<CR>
    autocmd Filetype python nnoremap <Leader>d :call jedi#show_documentation()<CR>
    autocmd Filetype python nnoremap <C-k> :call jedi#goto()<CR>
    "}}}
    Plug 'zchee/deoplete-jedi'    , {'for':['python', 'ipynb']}
    Plug 'lambdalisue/doctest.vim', {'for':['python', 'ipynb']}
    Plug 'SkyLeach/pudb.vim' "{{{
    autocmd Filetype python nnoremap <Leader>t :PUDBToggleBreakPoint<CR>
    autocmd Filetype python nnoremap <Leader>l :w<CR>:PUDBLaunchDebuggerTab<CR>
    autocmd Filetype python nnoremap <Leader>c :PUDBClearAllBreakpoints<CR>:ALEToggle<CR>:ALEToggle<CR>
    "}}}
    Plug 'goerz/jupytext.vim' "{{{
    let g:jupytext_fmt = 'py'
    "}}}
"}}} Python

"{{{ Javascript
"    Plug 'emmet-vim'
"    Plug 'Valloric/YouCompleteMe', { 'do': '/usr/bin/python3 install.py' }
    Plug 'ternjs/tern_for_vim', {'do': 'npm install tern'}
"}}} Javascript

call plug#end()

"vimrc最後にすべき設定
filetype plugin indent on
set t_Co=256
syntax on
set termguicolors
silent! colorscheme molokai
