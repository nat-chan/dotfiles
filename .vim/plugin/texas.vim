function! Texas() abort
python << PYTHON
import vim
import libtmux
var=""
for i in vim.current.range:
	var+=i
	print var

PYTHON
endfunction
