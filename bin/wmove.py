#!/home/N/bin/py
# coding:utf-8
import win32gui

def enumHandler(hwnd, lParam):
    if win32gui.IsWindowVisible(hwnd):
        if 'mlterm' in win32gui.GetWindowText(hwnd):
            win32gui.MoveWindow(hwnd, 0, 0, 760, 500, True)
            win32gui.ShowWindow(hwnd, 5)
            win32gui.SetForegroundWindow(hwnd)

win32gui.EnumWindows(enumHandler, None)

