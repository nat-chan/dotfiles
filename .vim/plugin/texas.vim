function! Texas() abort range
python << PYTHON
import vim
import subprocess

def escape(src):
	s = "'"; w = '"'
	d = s+w+s+w+s
	return s+src.replace(s,d)+s

var=''
print vim.current.range

cmd='tmux send-keys -l -t "{marked}" '+ escape(var)

#subprocess.call(cmd, shell=True)
PYTHON
endfunction
