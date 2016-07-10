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

function! g:Escape(src) abort range
	let s = "'"
	let w = '"'
	let d = s . w . s . w . s
	return s . substitute(a:src, s, d, 'g') . s
endfunction

function! g:Tmux() abort range
	let cmd='tmux send-keys -l -t "{marked}" '
	let s = Selected_Pos()
	echo s
"call system("mkdir")
endfunction
