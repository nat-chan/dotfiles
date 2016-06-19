function! Mypy() range abort
python << EOF
import vim
#import os
#s = "'";w = '"'
def normal(str):
	vim.command("normal "+str)
def getv():
	pass
print vim.current.range
#normal('`<')
#print vim.current.window.cursor
#normal('`>')
#print vim.current.window.cursor
EOF
endfunction

