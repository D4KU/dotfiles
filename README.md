My personal system setup.
Install via the following commands:

```
sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get update
sudo apt-get install vim zsh ripgrep fasd python3-pip highlight unzip -y
pip3 install ranger-fm thefuck grip

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p $HOME/.vim/spell

ZINIT_HOME="${XDG_DATA_HOME:-u/.local/share}/zinit"
mkdir -p "$ZINIT_HOME"
git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

git clone https://github.com/kazhala/dotbare.git $HOME/.dotbare
source $HOME/.dotbare/dotbare.plugin.bash
dotbare finit -y
dotbare remote add origin https://github.com/D4KU/dotfiles.git

mv $HOME/.bashrc $HOME/.bashrc_old
dotbare pull origin master
rm -fr $HOME/.dotbare

vim -i NONE -c "PlugUpdate" -c "qa!"
$HOME/.tmux/plugins/tpm/bin/install_plugins
tmux source $HOME/.tmux.conf

chsh -s $(which zsh)
```
