#!/usr/bin/env python3
# coding:utf-8
import os
import subprocess
from subprocess import PIPE
import sys

x, y = subprocess.getoutput("tmux display-message -p '#{cursor_x} #{cursor_y}'").split()
x, y = int(x), int(y)
proc = subprocess.run("tmux capture-pane -p", stdout=PIPE, shell=True, text=True)
window = proc.stdout.splitlines()
key = window[y][:x].split()[-1]
#print(x,y, len(window[y]), key)

words = " ".join(window)
words = words.split()
words = [w for w in words if w[:len(key)] == key and w != key]
words.reverse()
words = sorted(list(set(words)), key=words.index)
if len(words) == 0:
    os.system("tmux display-message '%s not found'" % key)
elif len(words) == 1:
    keyword = words.pop()
    os.system("tmux send-keys '"+keyword[len(key):]+"'")
else:
    proc = subprocess.run('fzf-tmux -d 20', input="\n".join(words), stdout=PIPE, shell=True, text=True)
    keyword = proc.stdout.strip()
    os.system("tmux send-keys '"+keyword[len(key):]+"'")
