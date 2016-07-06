function! Texas() abort
python << PYTHON
import vim
#import libtmux
import subprocess
def escape(src):
	s = "'"; w = '"'
	d = s+w+s+w+s
	return s+src.replace(s,d)+s

var=''
for i in vim.current.range:
	var+=i

cmd='tmux send-keys -l -t "{marked}" '

print len(escape(var))
subprocess.call(cmd, shell=True)
#ret  =  subprocess.check_output( cmd.split(" ") )
#print ret
#ret  =  subprocess.check_call( cmd.split(" ") )
#print ret == 0
PYTHON
endfunction
