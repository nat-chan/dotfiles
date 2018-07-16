autocmd BufNewFile,BufRead *.conf setf conf
autocmd BufNewFile,BufRead .zshrc set foldmethod=marker
autocmd BufNewFile,BufRead .vimrc set foldmethod=marker
autocmd BufNewFile,BufRead *.m set filetype=mma


"autocmd BufNewFile,BufRead *.py,*.pyx setlocal tabstop=2 | setlocal shiftwidth=2 | setlocal softtabstop=2 | setlocal noexpandtab | let g:did_indent_on = 1
autocmd BufWritePre *.py call system('chmod +x '.expand('%'))

"augroup SetShebang
"	autocmd! SetShebang
"	autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\"|$ | 1put =\"# coding:utf-8\"|$
"augroup END

autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\"|$ |
\                       1put =\"# coding:utf-8\"|$ |
\                       3put =\"if __name__ == \'__main__\':\"|$

autocmd BufNewFile,BufRead *.java inoremap . .<c-x><c-u>

autocmd TextChanged,TextChangedI *.vlt !redraw
