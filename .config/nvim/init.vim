set encoding=utf-8 "このvimrcのエンコーディング
"Vi互換モードをなくす
set nocompatible
"NERDTreeやバッファの選択をマウスでもできるようにする
set mouse=a

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

"au VimResized * wincmd =
au FileType netrw setl bufhidden=delete

"ターミナルモードは行番号なし、終了時即消去
au TermOpen * setlocal nonumber
au TermOpen * setlocal signcolumn=no
"au TermOpen * setlocal nohidden

" Vimであいまいな幅の文字の論理幅を1にする
set ambiwidth=single

"マーカーで折りたたむzaで畳み込みをトグル
set foldmethod=marker

"置換プレビュー
set inccommand=nosplit

set wildoptions=pum
set pumblend=10
set winblend=10

"Vim の外部プロセス呼び出しがPOSIX互換シェルを前提としている
"そのためfishをデフォルトシェルにしている時次の設定が必要
set shell=bash

"ターミナルモードをEscで抜けられるようにする
"ただしターミナル内のプログラムにEscを送信できなくなる
tnoremap <silent> <ESC> <C-\><C-n>

"コマンドライン行でC-a,C-eで行頭、行末
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

"undo永続化
"set undodir=~/.vim/undo
set undofile

" Better display for messages
set cmdheight=3

"貼り付け先のインデントにあわせる
nnoremap p ]p

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

"{{{ Appearance
    Plug 'tomasr/molokai'
    Plug 'Xuyuanp/nerdtree-git-plugin' "{{{
        let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "",
        \ "Staged"    : "",
        \ "Untracked" : "",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "",
        \ "Dirty"     : "",
        \ "Clean"     : "",
        \ 'Ignored'   : '',
        \ "Unknown"   : "?"
        \ }
    "}}}
"    Plug 'itchyny/lightline.vim' "{{{
""        \ 'separator': { 'left': '⮀', 'right': '⮂' },
""        \ 'subseparator': { 'left': '⮁', 'right': '⮃' },
"    set laststatus=2
"    let g:lightline = {
"        \ 'separator': { 'left': '', 'right': '' },
"        \ 'subseparator': { 'left': '', 'right': '' },
"        \ 'colorscheme': 'powerline',
"        \ 'mode_map': {'c': 'NORMAL'},
"        \ 'active': {
"        \   'left': [ [ 'mode', 'paste' ], ['fugitive', 'absolutepath' , 'modified', 'cocstatus'] ]
"        \ },
"        \ 'component_function': {
"        \   'modified': 'LightlineModified',
"        \   'readonly': 'LightlineReadonly',
"        \   'fugitive': 'LightlineFugitive',
"        \   'filename': 'LightlineFilename',
"        \   'fileformat': 'LightlineFileformat',
"        \   'filetype': 'LightlineFiletype',
"        \   'fileencoding': 'LightlineFileencoding',
"        \   'mode': 'LightlineMode',
"        \   'cocstatus': 'coc#status',
"        \ }
"        \ }
"    function! LightlineModified()
"        return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
"    endfunction
"    function! LightlineReadonly()
"        return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
"    endfunction
"    function! LightlineFilename()
"        return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
"              \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
"              \  &ft == 'unite' ? unite#get_status_string() :
"              \  &ft == 'vimshell' ? vimshell#get_status_string() :
"              \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
"              \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
"    endfunction
"    function! LightlineFugitive()
"        if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
"            return fugitive#head()
"        else
"            return ''
"        endif
"    endfunction
"    function! LightlineFileformat()
"        return winwidth(0) > 70 ? &fileformat : ''
"    endfunction
"    function! LightlineFiletype()
"        return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
"    endfunction
"    function! LightlineFileencoding()
"        return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
"    endfunction
"    function! LightlineMode()
"        return winwidth(0) > 60 ? lightline#mode() : ''
"    endfunction
"    "}}}
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
    \} "}}}
    Plug 'powerman/vim-plugin-AnsiEsc'
    Plug 'nathanaelkane/vim-indent-guides' "{{{
        let g:indent_guides_enable_on_vim_startup = 1
        let g:indent_guides_auto_colors = 0
        let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'startify', '']
        au VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=gray13 guifg=#455354
        au VimEnter,Colorscheme * :hi IndentGuidesEven guibg=gray16 guifg=#455354
        au TermEnter * IndentGuidesDisable
        au TermLeave * IndentGuidesEnable
"        let g:indent_guides_guide_size = 1
"        au TermOpen * IndentGuidesDisable
    "}}}
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline' "{{{
        nmap <C-p> <Plug>AirlineSelectPrevTab
        nmap <C-n> <Plug>AirlineSelectNextTab
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
    "}}}
    Plug 'mhinz/vim-startify' "{{{
        let g:webdevicons_enable_startify = 1
        let g:startify_custom_header = []
    "}}}
    Plug 'airblade/vim-gitgutter'
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
    "autocmd DirChanged * :NERDTreeCWD | :wincmd p
    "}}}
    Plug 'h1mesuke/vim-alignta'
    Plug 'tyru/capture.vim'
    Plug 'vim-jp/vimdoc-ja' "{{{
    set helplang=ja,en
    "}}}
    Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'tpope/vim-fugitive'
    Plug '~/.zplug/repos/junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'yuki-ycino/fzf-preview.vim'
    Plug 'mbbill/undotree'
"}}} Common

"{{{ Python
"    Plug 'SkyLeach/pudb.vim' "{{{
"    autocmd Filetype python nnoremap <Leader>t :<C-u>PUDBToggleBreakPoint<CR>
"    autocmd Filetype python nnoremap <Leader>l :<C-u>w<CR>:PUDBLaunchDebuggerTab<CR>
"    autocmd Filetype python nnoremap <Leader>c :<C-u>PUDBClearAllBreakpoints<CR>:ALEToggle<CR>:ALEToggle<CR>
"    "}}}
    Plug 'goerz/jupytext.vim' "{{{
    let g:jupytext_fmt = 'py'
    "}}}
"}}} Python

"{{{ LSP
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " if hidden is not set, TextEdit might fail.
    set hidden
    " Some servers have issues with backup files, see #649
    set nobackup
    set nowritebackup
    " Better display for messages
    set cmdheight=2
    " You will have bad experience for diagnostic messages when it's default 4000.
    set updatetime=300
    " don't give |ins-completion-menu| messages.
    set shortmess+=c
    " always show signcolumns
    set signcolumn=yes
    " Use tab for trigger completion with characters ahead and navigate.
    " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    " Or use `complete_info` if your vim support it, like:
    " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

    " Use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Remap for rename current word
    nmap <leader>rn <Plug>(coc-rename)

    " Remap for format selected region
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap for do codeAction of current line
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Fix autofix problem of current line
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Create mappings for function text object, requires document symbols feature of languageserver.
    xmap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap if <Plug>(coc-funcobj-i)
    omap af <Plug>(coc-funcobj-a)

    " Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
    "nmap <silent> <C-d> <Plug>(coc-range-select)
    "xmap <silent> <C-d> <Plug>(coc-range-select)

    " Use `:Format` to format current buffer
    command! -nargs=0 Format :call CocAction('format')
    " Use `:Fold` to fold current buffer
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)
    " use `:OR` for organize import of current buffer
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
    " Add status line support, for integration with other plugin, checkout `:h coc-status`
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Using CocList
    " Show all diagnostics
    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    " Show commands
    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document
    nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
    autocmd InsertEnter,CursorMovedI * silent! call CocActionAsync('showSignatureHelp')
    Plug 'liuchengxu/vista.vim'
    nnoremap <space>v  :<C-u>Vista coc<CR>
    Plug 'neoclide/coc-denite'
"}}}

call plug#end()

"{{{ denite
" Change denite default options
call denite#custom#option('default', {'split': 'floating'})
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
"  inoremap <silent><buffer>       <C-o>   <Plug>(denite_filter_quit)
  inoremap <silent><buffer><expr> <C-c>   denite#do_map('quit')
  nnoremap <silent><buffer><expr> <C-c>   denite#do_map('quit')
endfunction
nnoremap D :Denite 
"}}}

"{{{ debug
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

"vimrc最後にすべき設定
filetype plugin indent on
set t_Co=256
syntax on
set termguicolors
colorscheme molokai
