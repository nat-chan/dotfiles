if has("python3")
python3 << EOF
import os
import sys

path = os.path.expanduser("~/.pyenv/versions/anaconda3-4.3.1/lib/python3.6/site-packages/neovim")
if not path in sys.path:
    sys.path = [path] + sys.path

#path = os.path.expanduser("~/.pyenv/versions/anaconda3-4.3.1/lib/python3.6/site-packages/libsixel_python-0.4.0-py3.6.egg")
#if not path in sys.path:
#    sys.path = [path] + sys.path

#path = os.path.expanduser("~/.pyenv/versions/anaconda3-4.3.1/lib/python3.6/site-packages")
#if not path in sys.path:
#    sys.path = [path] + sys.path

#path = os.path.expanduser("/mnt/c/Program Files/Anaconda3/Lib/site-packages/win32")
#if not path in sys.path:
#    sys.path = [path] + sys.path
EOF
endif
