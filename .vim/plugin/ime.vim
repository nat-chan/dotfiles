" 日本語入力をした後にinsert modeを離れるとIMEをオフにしてくれる
" 次にinsert modeに入ったときに前回のIMEの状態に戻してくれる TODO
" Tmuxの中でVimを立ち上げるとエスケープシーケンスがTmuxに食べられてしまうので一番外側のttyに投げる

function! s:Init() abort
	let s:client_tty = system('[ -z "$TMUX" ]&&readlink -f /proc/$PPID/fd/0||tmux display-message -p "#{client_tty}"')
endfunction

function! g:OnIME() abort
	call system('echo -ne "\e[<1t" >> ' . s:client_tty)
endfunction

function! g:OffIME() abort
	call system('echo -ne "\e[<0t" >> ' . s:client_tty)
endfunction

function! g:RestoreIME() abort
	call system('echo -ne "\e[<r" >> ' . s:client_tty)
endfunction

function! g:SaveIME() abort
	call system('echo -ne "\e[<s\e[<0t" >> ' . s:client_tty)
endfunction

function! g:IME() abort
	echo split(&commentstring, '%s')[0]
endfunction

"autocmd InsertLeave * call g:SaveIME()
"autocmd InsertEnter * call g:RestoreIME()

autocmd InsertLeave * call g:OffIME()

call s:Init()
