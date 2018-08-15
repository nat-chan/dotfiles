#!/home/N/bin/py
# coding:utf-8
import win32gui
import random

while True:
    win32gui.SetPixelV(win32gui.GetDC(None), random.randint(0,100), random.randint(0,100), 0)
