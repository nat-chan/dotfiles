function! g:Selected_Pos() abort range
	let pos = getpos(".")
	"選択開始位置を記録
	normal `<
	let start = [line("."), col(".")]
	"選択終了位置を記録
	normal `>
	let end = [line("."), col(".")]
	call setpos('.', pos)
	return start + end
endfunction

function! g:Range_Tmux() abort range
	let list = getline(a:firstline, a:lastline)
	echo join(list, "\n")
endfunction

function! g:Escape(src) abort
	let s = "'"
	let w = '"'
	let d = s . w . s . w . s
	return s . substitute(a:src, s, d, 'g') . s
endfunction

function! g:Selected_Str() abort range
	let tmp = @@
	silent normal gvy
	let selected = @@
	let @@ = tmp
	return selected
endfunction

function! g:Send_Keys(pane, str) abort range
	let cmd='tmux send-keys -l -t ' . a:pane .' ' . Escape(a:str)
	call system(cmd)
endfunction

function! g:Tmux() abort range
	let pane = '"{marked}"'
	let str = Selected_Str()
	call Send_Keys(pane, str)
endfunction

function! g:Mebius() abort range
	"xxdviが起動していないなら起動
	if ! exists('s:flag_xdvi')
		echo "初めてプラグインが実行されたのでxdviが起動しているか確かめます"
		if system('pgrep xdvi.bin') == ''
			echo "xdviを起動しました"
			call system('xxdvi')
		endif
		let s:flag_xdvi = 1
	endif
	"vimの下のpaneに
	"{down}"
endfunction
let header = 'platex -halt-on-error && killall -10 xdvi.bin'
