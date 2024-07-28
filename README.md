My personal system setup.
Install via the following commands:

```
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim zsh ranger ripgrep fd-find fasd python3-venv highlight unzip flake8 exuberant-ctags command-not-found clang-format python-is-python3 -y

python3 -m venv ~/venv
~/venv/bin/pip install thefuck grip tldr

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.vim/spell

ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit"
mkdir -p "$ZINIT_HOME"
git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

git clone https://github.com/kazhala/dotbare.git ~/.dotbare
source ~/.dotbare/dotbare.plugin.bash
dotbare finit -y
dotbare remote add origin https://github.com/D4KU/dotfiles.git

mv ~/.bashrc ~/.bashrc_old
dotbare pull origin master
rm -fr ~/.dotbare

vim -i NONE -c "PlugUpdate" -c "qa!"
tmux source ~/.tmux.conf
~/.tmux/plugins/tpm/bin/install_plugins

chsh -s $(which zsh)
```
