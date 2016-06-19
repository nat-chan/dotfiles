function! Texas() range abort
":let pos = getpos(".")
":normal `<
":echo line(".")
":echo col(".")
":normal `>
":echo line(".")
":echo col(".")
":call setpos('.', pos)
	let l:s="'"
	let l:w='"'
	let l:line=""
	for n in range(a:firstline, a:lastline)
		let line=line.s.substitute(getline(n), s, s.w.s.w.s, 'g').s.' Enter '
	endfor
	call system('tmux send-key -t 1 '.line)
endfunction

vnoremap q :<C-u>'<,'>call Texas()<CR>
