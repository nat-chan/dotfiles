#!/usr/bin/env python
# coding:utf-8
#説明{{{
#capture-pane [-aepPq] [-b buffer-name] [-E end-line] [-S start-line] [-t target-pane]
#(alias: capturep)
#tmux capturep -p で見えてる部分だけ標準出力
#If -p is given, the output goes to stdout, otherwise to the buffer specified with -b or a new buffer if omitted. 
#If -a is given, the alternate screen is used, and the history is not accessible.  If no alternate screen exists, an error will be returned unless -q is given.  
#If -e is given, the output includes escape sequences for text and background attributes.  
#-C also escapes non-printable characters as octal \xxx.  
#-J joins wrapped lines and preserves trailing spaces at each line's end. 
#-P captures only any output that the pane has received that is the beginning of an as-yet incomplete escape sequence.
#-S and -E specify the starting and ending line numbers, zero is the first line of the visible pane and negative
#numbers are lines in the history.  ‘-’ to -S is the start of the history and to -E the end of the visible pane.
#The default is to capture only the visible contents of the pane.
#}}}
import commands

words = commands.getoutput('tmux capture-pane -p').split()
key = words[-1]
greped = {w for w in words if w[:len(key)] == key}
greped.remove(key)
if len(greped) == 1:
	keyword = greped.pop()
	commands.getoutput("tmux send-keys '"+keyword[len(key):]+"'")
else:
	commands.getoutput("tmux display-message '"+' '.join(greped)+"'")

