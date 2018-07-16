"system(...)の返り値を判定するときは
"	if v:shell_error

function! s:Escape(src) abort
	"クオート交じりのsrcをコマンド引数に指定できる形にする
	let s = "'"
	let w = '"'
	let d = s . w . s . w . s

	let txt = a:src
	let txt = substitute(txt, s, d, 'g')
	let txt = substitute(txt, '\\', '\\\\', 'g')
	let txt = s . txt . s
	return txt
endfunction

function! s:SendKeys(window, txt) abort range
	"stuffコマンドで送る
	let cmd = 'screen -p ' . a:window . ' -X stuff ' . s:Escape(a:txt)
	call system(cmd)
endfunction

function! s:FindIpython() abort range
	"session内のipythonプロセスを探して$WINDOWを返す
	let pids = system("pgrep ipython")
	let windows = []
	for pid in split(pids, "\n")
		let envs = system('cat /proc/' . pid . '/environ')
		let sty = matchstr(envs,'STY=\zs.\{-1,\}\ze')
		let window = matchstr(envs,'WINDOW=\zs.\{-1,\}\ze')
		if sty == $STY
			call add(windows, window)
		endif
	endfor
	if len(windows) != 1
		throw "session内に1つだけipythonを起動してください"
	endif
	return windows[0]
endfunction

function! g:Send2py() abort range
	"758文字を超えないように数行まとめて送る
	let window = s:FindIpython()
	let list = getline(a:firstline, a:lastline)
	let list = ["%cpaste -q"] + list + ["--"]
	let txt = ''
	for line in list
		"758文字を超えるとRemote comand too long
		if strlen(txt) + strlen(line) + 1 < 758
			let txt .= line . "\n"
		else
			call s:SendKeys(window, txt)
			let txt = line . "\n"
		endif
	endfor
	call s:SendKeys(window, txt)
endfunction

