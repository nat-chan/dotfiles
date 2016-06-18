function! Mypy() range abort
":let pos = getpos(".")
":normal `<
":echo line(".")
":echo col(".")
":normal `>
":echo line(".")
":echo col(".")
":call setpos('.', pos)
python << EOF
import vim
#import os
#s = "'";w = '"'
def normal(str):
	vim.command("normal "+str)
print vim.current.range
normal('`<')
print vim.current.window.cursor
normal('`>')
print vim.current.window.cursor
EOF
endfunction

