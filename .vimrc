set encoding=utf-8 "このvimrcのエンコーディング
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac
set nowrap
set number "行番号を表示
set expandtab "タブはスペースに変換
set tabstop=4 "ハードタブの表示幅
set shiftwidth=4 "ソフトタブのインデント幅
set smartindent "自動インデントの設定
set autoindent
set nosmarttab "同じインデントにコメントを書きたいとき、#を入力すると行頭に行ってしまうので
set guicursor= "カーソル形状を変えない
set cursorline "カーソル行ハイライト カーソル移動が遅くなる可能性あり
autocmd FileType help wincmd H "ヘルプを横に開く
set cmdheight=2
au Colorscheme * hi Folded ctermfg=229 guifg=#E6DB74 
au Colorscheme * hi Normal ctermbg=None guibg=black
au ColorScheme * hi ColorColumn ctermbg=234 guibg=gray10
au ColorScheme * hi MatchParen ctermfg=15 guifg=white
set noswapfile
set nobackup
set nowritebackup
let loaded_matchparen = 1 "カーソルを見失うので対応するかっこのハイライトを消す
set noshowmatch
set backspace=indent,eol,start "バックスペースで行を跨いで文字を消せるようにする
set hidden "新しいbufferを開くときに編集を保存するか聞かない
set nofixeol "文末に自動で改行をつけない
set shortmess=A "スワップファイルが発見されたときに "注意" しない
set ambiwidth=single " Vimであいまいな幅の文字の論理幅を1にする
set foldmethod=marker
set undodir=~/.vim/undo
set undofile
set clipboard=unnamedplus
set fillchars=fold:\ 
function! Myfold()
    return substitute(getline(v:foldstart), ".{{"."{", '', '')
endfunction
set foldtext=Myfold()
set foldopen=
 "ターミナルモードをEscで抜けられるようにする
tnoremap <silent> <ESC> <C-\><C-n>
 "コマンドライン行でC-a,C-eで行頭、行末
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
let mapleader = "\<Space>"
command! V exe "silent !code --goto '" . expand("%") . ":" . line(".") . ":" . col(".") . "'" | redraw!

call plug#begin('~/.vim/plugged_vim')
Plug 'tomasr/molokai'
Plug 'h1mesuke/vim-alignta'
Plug 'tyru/capture.vim'

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
    \		'nerdtree': 0,
    \	}
    \}
"}}}

Plug 'dstein64/vim-startuptime'
Plug 'tpope/vim-fugitive' "{{{
    "fugitiveのdiffを垂直分割する
    set diffopt+=vertical
"}}}
"Plug 'airblade/vim-gitgutter' "{{{
"    set updatetime=100
"    au Colorscheme * hi GitGutterAdd    guifg=green guibg=#232526
"    au Colorscheme * hi GitGutterChange guifg=yellow guibg=#232526
"    au Colorscheme * hi GitGutterDelete guifg=red guibg=#232526
""}}}
Plug 'vim-jp/vimdoc-ja' "{{{
    set helplang=ja,en
"}}}
Plug 'mbbill/undotree' "{{{
    let g:undotree_ShortIndicators = 1
    let g:undotree_WindowLayout = 2
"}}}
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'tpope/vim-surround'

Plug 'christoomey/vim-tmux-navigator' "{{{
    let g:tmux_navigator_no_mappings = 1
    nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
    nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
    nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
    nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
    nnoremap <silent> <M-\> :TmuxNavigatePrevious<cr>
    tnoremap <silent> <M-h> <C-\><C-n>:TmuxNavigateLeft<cr>
    tnoremap <silent> <M-j> <C-\><C-n>:TmuxNavigateDown<cr>
    tnoremap <silent> <M-k> <C-\><C-n>:TmuxNavigateUp<cr>
    tnoremap <silent> <M-l> <C-\><C-n>:TmuxNavigateRight<cr>
    tnoremap <silent> <M-\> <C-\><C-n>:TmuxNavigatePrevious<cr>
    inoremap <silent> <M-h> <C-\><C-n>:TmuxNavigateLeft<cr>
    inoremap <silent> <M-j> <C-\><C-n>:TmuxNavigateDown<cr>
    inoremap <silent> <M-k> <C-\><C-n>:TmuxNavigateUp<cr>
    inoremap <silent> <M-l> <C-\><C-n>:TmuxNavigateRight<cr>
    inoremap <silent> <M-\> <C-\><C-n>:TmuxNavigatePrevious<cr>
    vnoremap <silent> <M-h> <C-\><C-n>:TmuxNavigateLeft<cr>
    vnoremap <silent> <M-j> <C-\><C-n>:TmuxNavigateDown<cr>
    vnoremap <silent> <M-k> <C-\><C-n>:TmuxNavigateUp<cr>
    vnoremap <silent> <M-l> <C-\><C-n>:TmuxNavigateRight<cr>
    vnoremap <silent> <M-\> <C-\><C-n>:TmuxNavigatePrevious<cr>
    cnoremap <silent> <M-h> <C-\><C-n>:TmuxNavigateLeft<cr>
    cnoremap <silent> <M-j> <C-\><C-n>:TmuxNavigateDown<cr>
    cnoremap <silent> <M-k> <C-\><C-n>:TmuxNavigateUp<cr>
    cnoremap <silent> <M-l> <C-\><C-n>:TmuxNavigateRight<cr>
    cnoremap <silent> <M-\> <C-\><C-n>:TmuxNavigatePrevious<cr>

    let g:previous_window = -1
    function SmartInsert()
        if &buftype == 'terminal'
            if g:previous_window != winnr()
                startinsert
            endif
                let g:previous_window = winnr()
        else
             let g:previous_window = -1
        endif
    endfunction

    au BufEnter * call SmartInsert()
"}}}
Plug 'tmux-plugins/vim-tmux-focus-events'

Plug 'jpalardy/vim-slime' "{{{
    let g:slime_no_mappings = 1
    xmap <C-j> <Plug>SlimeRegionSend
    nmap <C-j> <Plug>SlimeParagraphSend
    let g:slime_target = "tmux"
    ""{marked}"
    ""{right-of}"
    let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}
    let g:slime_python_ipython = 1
    let g:slime_dont_ask_default = 1
"}}}

call plug#end()
filetype plugin indent on
set t_Co=256
syntax on
set termguicolors
silent! colorscheme molokai
