# デュアルブートのUbuntu18.04
pyenvの廃止、試験的にvenvに移行
venvのほうがjediがconflictしない

多分以下でインストールできる
```bash
ln -s dotfiles/.zshrc ~/
ln -s dotfiles/.zpreztorc ~/
ln -s dotfiles/.vimrc ~/
ln -s dotfiles/.vim ~/
ln -s dotfiles/.tmux.conf ~/
ln -s dotfiles/.tmuxinator ~/
ln -s dotfiles/.tmux ~/
ln -s dotfiles/bin ~/
ln -s ~/.vimrc dotfiles/.vim/init.vim
ln -s dotfiles/prompt_N_setup ~/.zprezto/modules/prompt/functions
```
