set encoding=utf-8 "このvimrcのエンコーディング
"Vi互換モードをなくす
set nocompatible
"NERDTreeやバッファの選択をマウスでもできるようにする
set mouse=a

"Ubuntuでのクリップボード共有
set clipboard=unnamedplus

"改行コードを判別
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac

"一行のコードが長くならないように130行目に縦線を引く
"set colorcolumn=130
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

"カーソル形状を変えない
set guicursor=

"ヘルプを横に開く
autocmd FileType help wincmd H

set cmdheight=2

set signcolumn=auto:3
"マーカーで折りたたむzaで畳み込みをトグル
set foldmethod=marker
set fillchars=fold:\ 
function Myfold()
    return substitute(getline(v:foldstart), ".{{"."{", '', '')
endfunction
set foldtext=Myfold()
set foldopen=
"au Colorscheme * hi Folded guifg=#E6DB74
"au Colorscheme * hi Normal guibg=black
"au ColorScheme * hi ColorColumn guibg=gray10
"au ColorScheme * hi MatchParen guifg=white

"自動的に作られるうざいバックアップを消す
set noswapfile
set nobackup
set nowritebackup
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

"au VimResized * wincmd =
au FileType netrw setl bufhidden=delete

"ターミナルモードは行番号なし、終了時即消去
au TermOpen * setlocal nonumber
au TermOpen * setlocal signcolumn=no
"au TermOpen * setlocal nohidden

" Vimであいまいな幅の文字の論理幅を1にする
set ambiwidth=single

"置換プレビュー
set inccommand=nosplit

set wildoptions=pum
set pumblend=0
set winblend=0

"Vim の外部プロセス呼び出しがPOSIX互換シェルを前提としている
"そのためfishをデフォルトシェルにしている時次の設定が必要
"set shell=bash

"ターミナルモードをEscで抜けられるようにする
"ただしターミナル内のプログラムにEscを送信できなくなる
tnoremap <silent> <ESC> <C-\><C-n>

"コマンドライン行でC-a,C-eで行頭、行末
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

"undo永続化
"set undodir=~/.vim/undo
set undofile

let mapleader = "\<Space>"

"プラグインをここに追記
"Plug リポジトリ名
"新しいプラグインをインストールするときは
":source ~/.vimrc
":PlugInstall
call plug#begin('~/.vim/plugged')

Plug 'tomasr/molokai'
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
    "autocmd DirChanged * :NERDTreeCWD | :wincmd p
"}}}
Plug 'Xuyuanp/nerdtree-git-plugin' "{{{
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "",
    \ "Staged"    : "",
    \ "Untracked" : "",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "",
    \ "Dirty"     : "",
    \ "Clean"     : "",
    \ 'Ignored'   : '',
    \ "Unknown"   : "?"
    \ }
"}}}
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
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
Plug 'powerman/vim-plugin-AnsiEsc'
"Plug 'nathanaelkane/vim-indent-guides' "{{{
"    let g:indent_guides_enable_on_vim_startup = 1
"    let g:indent_guides_auto_colors = 0
"    let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'startify', 'man']
"    au VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=gray13 guifg=#455354
"    au VimEnter,Colorscheme * :hi IndentGuidesEven guibg=gray16 guifg=#455354
"    au TermEnter * IndentGuidesDisable
"    au TermLeave * IndentGuidesEnable
""    let g:indent_guides_guide_size = 1
""    au TermOpen * IndentGuidesDisable
""}}}
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline' "{{{
    nmap <C-n> <Plug>AirlineSelectPrevTab
    nmap <C-p> <Plug>AirlineSelectNextTab
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''
    let g:airline#extensions#tabline#right_sep = ''
    let g:airline#extensions#tabline#right_alt_sep = ''
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:NERDTreeDirArrowExpandable = ''
    let g:NERDTreeDirArrowCollapsible = ''
    let g:airline_symbols = {'space': ' ', 'paste': 'PASTE', 'maxlinenr': ' ㏑', 'dirty': '!', 'crypt': '🔒', 'linenr': '☰ ', 'readonly': '', 'spell': 'SPELL', 'modified': '+', 'notexists': 'ﳺ', 'keymap': 'Keymap:', 'ellipsis': '...', 'branch': 'ᚠ', 'whitespace': '☲'}
    Plug 'vim-airline/vim-airline-themes'
    let g:airline_theme='murmur'
    "luna
    "murmur
    "serene
    "base16_spacemacs
    "jellybeans
    "ravenpower
    "behelit
    "murmur
    "kolor
    "jet
    "base16_apathy
"}}}
"Plug 'mhinz/vim-startify' "{{{
"    let g:webdevicons_enable_startify = 1
"    let g:startify_custom_header = []
""}}}
Plug 'airblade/vim-gitgutter' "{{{
    set updatetime=100
    au Colorscheme * hi GitGutterAdd    guifg=green guibg=#232526
    au Colorscheme * hi GitGutterChange guifg=yellow guibg=#232526
    au Colorscheme * hi GitGutterDelete guifg=red guibg=#232526
"}}}

Plug 'w0rp/ale', {'for':['python']} "{{{
    let g:ale_sign_column_always = 1
    let g:ale_linters = {'python': ['pylint'], 'javascript': ['eslint']}
    let g:ale_fixers = {'python': ['yapf']}
    let g:ale_python_pylint_use_msg_id = 1
    let g:ale_python_pylint_options = '--disable=C0103,C0301,C0114'
    let g:ale_virtualtext_cursor=1
    let g:ale_sign_error = 'E'
    let g:ale_sign_warning = 'W'
    au Filetype python map <buffer> [g <Plug>(ale_previous)
    au Filetype python map <buffer> ]g <Plug>(ale_next)
    au Colorscheme * hi ALEVirtualTextError guifg=red
    au Colorscheme * hi ALEVirtualTextWarning guifg=orange
    au Colorscheme * hi ALEErrorSign guifg=red guibg=#232526
    au Colorscheme * hi ALEWarningSign guifg=orange guibg=#232526
"}}}

Plug 'h1mesuke/vim-alignta'
Plug 'tyru/capture.vim'
Plug 'vim-jp/vimdoc-ja' "{{{
    set helplang=ja,en
"}}}
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fugitive' "{{{
    "fugitiveのdiffを垂直分割する
    set diffopt+=vertical
"}}}
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'yuki-ycino/fzf-preview.vim'
Plug 'nat-chan/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'ifreund/skim-preview.vim' "{{{
    let g:fzf_preview_use_dev_icons = 1
"}}}
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neoyank.vim'
Plug 'mbbill/undotree' "{{{
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
"let g:undotree_TreeNodeShape = 'o'
"}}}
Plug 'scrooloose/nerdcommenter'
Plug 'andymass/vim-matchup'
Plug 't9md/vim-surround_custom_mapping' "{{{
    let g:surround_custom_mapping = {}
    let g:surround_custom_mapping._ = {
    \ 'p':  "<pre> \r </pre>",
    \ 'w':  "%w(\r)",
    \ }
    let g:surround_custom_mapping.help = {
    \ 'p':  "> \r <",
    \ }
    let g:surround_custom_mapping.ruby = {
    \ '-':  "<% \r %>",
    \ '=':  "<%= \r %>",
    \ '9':  "(\r)",
    \ '5':  "%(\r)",
    \ '%':  "%(\r)",
    \ 'w':  "%w(\r)",
    \ '#':  "#{\r}",
    \ '3':  "#{\r}",
    \ 'e':  "begin \r end",
    \ 'E':  "<<EOS \r EOS",
    \ 'i':  "if \1if\1 \r end",
    \ 'u':  "unless \1unless\1 \r end",
    \ 'c':  "class \1class\1 \r end",
    \ 'm':  "module \1module\1 \r end",
    \ 'd':  "def \1def\1\2args\r..*\r(&)\2 \r end",
    \ 'p':  "\1method\1 do \2args\r..*\r|&| \2\r end",
    \ 'P':  "\1method\1 {\2args\r..*\r|&|\2 \r }",
    \ }
    let g:surround_custom_mapping.javascript = {
    \ 'f':  "function(){ \r }"
    \ }
    let g:surround_custom_mapping.lua = {
    \ 'f':  "function(){ \r }"
    \ }
    let g:surround_custom_mapping.python = {
    \ 'p':  "print( \r)",
    \ '[':  "[\r]",
    \ }
    let g:surround_custom_mapping.vim= {
    \'f':  "function! \r endfunction",
    \'m':  "\"{{{ \r \"}}}",
    \ }
"}}}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'chrisbra/Colorizer'
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
Plug 'blueyed/vim-diminactive' "{{{
    let g:diminactive_enable_focus = 1
    "let g:diminactive_filetype_whitelist = ['dirvish','nerdtree','startify','vista']
"}}}
Plug 'roxma/vim-tmux-clipboard'
Plug 'benmills/vimux' "{{{
vnoremap <silent> <C-j> "vy :<C-u>call VimuxSendText(@v)<CR>
nnoremap <silent> <C-j> :<C-u>echo VimuxSendText(getline('.')) && call VimuxSendKeys('Enter')<CR>j
"}}}

Plug 'nat-chan/vim-pudb' "{{{
    nnoremap <space>b :TogglePudbBreakPoint<CR>
"}}}
"Plug 'goerz/jupytext.vim' "{{{
"    let g:jupytext_fmt = 'py'
""}}}

"Plug 'liuchengxu/vista.vim' "{{{
"    nnoremap <space>v  :<C-u>Vista!!<CR>
"    au FileType vista_kind map  <buffer> <silent> <2-LeftMouse> :<C-u>call  vista#cursor#FoldOrJump()<CR>
"    let g:vista_icon_indent=['└ ', '├ ']
""    let g:vista_sidebar_position = 'vertical topleft'
""    let g:vista_default_executive = 'vim_lsp'
"    let g:vista_executive_for = {
"    \ 'python': 'vim_lsp',
"    \ 'vim': 'vim_lsp',
"    \ 'javascript': 'vim_lsp',
"    \ }
""}}}
"Plug 'ervandew/supertab' "{{{
"    let g:SuperTabDefaultCompletionType = "<c-n>"
""}}}
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp' "{{{
set omnifunc=lsp#complete   " オムニ補完を有効化
nnoremap <C-k> :<C-u>LspDefinition<CR>
nnoremap gd :<C-u>LspDefinition<CR>
nnoremap gr :<C-u>LspReferences<CR>
nnoremap gs :<C-u>LspDocumentSymbol<CR>
nnoremap ge :<C-u>LspDocumentDiagnostics<CR>
nnoremap K :<C-u>LspHover<CR>
let g:lsp_diagnostics_enabled = 0  " 警告やエラーの表示はALEに任せるのでOFFにする
"let g:lsp_virtual_text_enabled = 0 "常時表示はうざいので消す
"let g:lsp_highlight_references_enabled = 1 "カーソル下のエラーは表示
""let g:lsp_signs_enabled = 1         " enable signs
"let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
"let g:lsp_signs_error = {'text': 'E'}
"let g:lsp_signs_warning = {'text': 'W'}
"let g:lsp_signs_info = {'text': 'I'}
"let g:lsp_signs_hint = {'text': 'H'}
"au Colorscheme * hi LspErrorText       guibg=#232526 guifg=red
"au Colorscheme * hi LspWarningText     guibg=#232526 guifg=orange
"au Colorscheme * hi LspInformationText guibg=#232526 guifg=white
"au Colorscheme * hi LspHintText        guibg=#232526 guifg=white
"map [g <plug>(lsp-previous-diagnostic)
"map ]g <plug>(lsp-next-diagnostic)
"}}}
Plug 'mattn/vim-lsp-settings'
Plug 'Shougo/deoplete.nvim', {'do':':UpdateRemotePlugins'} "{{{
    let g:deoplete#enable_at_startup = 1
"}}}
Plug 'lighttiger2505/deoplete-vim-lsp'
Plug 'ncm2/float-preview.nvim' "{{{
    let g:float_preview#docked = 0
    set completeopt-=preview
"}}}
"Plug 'tbodt/deoplete-tabnine', {'do': './install.sh'}

Plug 'davidhalter/jedi-vim', {'for':['python']} "{{{
    let g:jedi#auto_initialization = 0
    "let g:jedi#completions_enabled = 0
    autocmd Filetype python nnoremap <space>rn :call jedi#rename()<CR>
"}}}

Plug 'ronakg/quickr-preview.vim' "{{{
    let g:quickr_preview_keymaps = 0
    let g:quickr_preview_on_cursor = 1
    let g:quickr_preview_exit_on_enter = 1
    au Filetype qf nnoremap <silent> <buffer> q :<C-u>q<CR>
"}}}

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

Plug 'tlvince/vim-compiler-python'

" Track the engine.
"Plug 'SirVer/ultisnips' "{{{
"
"" Snippets are separated from the engine. Add this if you want them:
"Plug 'honza/vim-snippets'
"
"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-z>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
"}}}

Plug 'Shougo/neosnippet.vim' "{{{
Plug 'Shougo/neosnippet-snippets'
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
"}}}

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'microsoft/vscode-python'
Plug 'vahidk/tensorflow-snippets'
Plug 'SvenBecker/vscode-pytorch'
" You can use other key to expand snippet.
imap <expr> <C-j>   vsnip#available(1)  ? '<Plug>(vsnip-expand)'         : '<C-j>'
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
imap <expr> <Tab>   vsnip#available(1)  ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#available(1)  ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

Plug 'tamago324/gtrans.nvim'

"Plug '/home/natsuki/executor.nvim'

Plug 'fisadev/vim-isort'

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'dstein64/vim-startuptime'

call plug#end()

call deoplete#custom#source('lsp', 'rank', 2000)
"call deoplete#custom#source('neosnippet', 'rank', 3000)
call deoplete#custom#source('denite', 'rank', 5000)
"{{{denite
" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>    denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d       denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p       denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q       denite#do_map('quit')
  nnoremap <silent><buffer><expr> i       denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
  inoremap <silent><buffer><expr> <C-c>   denite#do_map('quit')
  nnoremap <silent><buffer><expr> <C-c>   denite#do_map('quit')
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  inoremap <silent><buffer><expr> <C-c>   denite#do_map('quit')
  nnoremap <silent><buffer><expr> <C-c>   denite#do_map('quit')
endfunction

set wildcharm=<tab>
nnoremap          DD :<C-u>Denite <Tab><C-p>
nnoremap <silent> DB :<C-u>Denite buffer -auto-action=preview -vertical-preview<CR>
nnoremap <silent> DF :<C-u>Denite command -start-filter -input=FzfPreview<CR>
nnoremap <silent> DL :<C-u>Denite command -start-filter -input=Lsp<CR>

" Change denite default options
call denite#custom#option('default', {
    \ 'split': 'floating',
    \ 'auto_resize': 1,
    \ 'winrow': 2,
    \ 'reversed': 1,
    \ })

"let s:denite_win_width_percent = 0.85
"let s:denite_win_height_percent = 0.5
"    \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
"    \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
"    \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
"    \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
"let g:webdevicons_enable_denite = 1
"call denite#custom#source('change,buffer,file,file/rec,file_mru,file/old,file/point', 'converters', ['devicons_denite_converter'])

call denite#custom#source('buffer,change,directory_rec,grep,jump,line,mark,menu,outline,output,spell,tag,file,file/old,file/point,file/rec,directory_mru,file_mru', 'converters', ['devicons_denite_converter'])
"}}}

"{{{debug
function! g:OnExit(job_id, code, event) abort
"    execute 'buffer' g:file
    call feedkeys(' ')
endfun

function! T(...) abort
    write
    if exists('g:cmd')
        let l:cmd = g:cmd
    else
        let l:cmd = 'bb.py '.expand('%:p')
    endif
    enew
    call termopen(l:cmd, {'on_exit': 'g:OnExit'})
    startinsert
endfun

command! -nargs=? T call T(<f-args>)
nnoremap ! :call T()<CR>
"}}}

"{{{カーソル下のhighlight情報を表示する
function! s:get_syn_id(transparent)
    let synid = synID(line('.'), col('.'), 1)
    return a:transparent ? synIDtrans(synid) : synid
endfunction
function! s:get_syn_name(synid)
    return synIDattr(a:synid, 'name')
endfunction
function! s:get_highlight_info()
    execute "highlight " . s:get_syn_name(s:get_syn_id(0))
    execute "highlight " . s:get_syn_name(s:get_syn_id(1))
endfunction
command! HighlightInfo call s:get_highlight_info()
"}}}

"vimrc最後にすべき設定
filetype plugin indent on
set t_Co=256
syntax on
set termguicolors
silent! colorscheme molokai
source /home/natsuki/.vim/plugged/vim-airline/autoload/airline/extensions/vista.vim
