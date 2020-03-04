#!/usr/bin/env python3
# coding:utf-8
import os
import subprocess
import sys

#x,y = subprocess.getoutput("tmux display-message -p '#{cursor_x} #{cursor_y}'").split()
#print(x,y)
words = subprocess.getoutput('tmux capture-pane -p').split()
key = words[-1]
words = [w for w in words if w[:len(key)] == key and w != key]
words.reverse()
words = sorted(list(set(words)),key=words.index)
if len(words) == 1:
    keyword = words.pop()
    os.system("tmux send-keys '"+keyword[len(key):]+"'")
else:
    subprocess.Popen
    os.system("tmux display-message '"+' '.join(words)+"'")

