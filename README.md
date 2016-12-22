# NVIM
## What is this?
This is a config file for NeoVim.

## How to install
1. Make sure NeoVim is installed with python3 support.
2. Open `.profile` and add the line `export NVIM=$HOME/.config/nvim`, then log out and in of Ubuntu.
3. Go to config folder `cd $HOME/.config/`.
3. Run `git clone https://github.com/holwech/nvim/`.
4. `cd nvim` and delete the repo folder by calling `rm -rf repos`.
5. Make backup folder
```
mkdir temp
cd temp
mkdir swp backup
```
6. Run the install script for Dein `sh ./installer.sh $NVIM`.
7. Open Neovim to install the addons.
8. That's all!

## Adding clipboard support
Install xsel `sudo apt-get install xsel`.
