let [plugins, ftplugin] = dein#load_cache_raw(['/home/pi/.vimrc'], 1)
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/pi/.vim/dein'
let g:dein#_runtime_path = '/home/pi/.vim/dein/.dein'
let &runtimepath = '/home/pi/.vim/dein/.dein,/home/pi/.vim/dein/repos/github.com/Shougo/dein.vim/,/home/pi/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,/home/pi/.vim/after,/home/pi/.vim/dein/.dein/after'
