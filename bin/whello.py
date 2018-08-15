#!/home/N/bin/py
# coding:utf-8
import win32gui

handle = win32gui.FindWindow(0, "mlterm")
if handle != 0:
    win32gui.SetForegroundWindow(handle)
