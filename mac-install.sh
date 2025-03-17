#!/bin/bash

./install-helpers-scripts/shared/rename-root.sh

if command -v brew >/dev/null 2>&1; then
  echo "✅ Homebrew is installed."
else
  echo "❌ Homebrew is not installed."
k
  echo "🛠️ Installing homebrew now..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if command -v bat >/dev/null 2>&1; then
  echo "✅ bat is installed."
else
  echo "❌ bat is not installed."
  echo "🛠️ Installing bat now..."
  brew install bat
fi

if command -v tmux >/dev/null 2>&1; then
  echo "✅ tmux is installed."
else
  echo "❌ tmux is not installed."
  echo "🛠️ Installing tmux now..."
  brew install tmux
fi


if command -v nvim >/dev/null 2>&1; then
  echo "✅ neovim is installed."
else
  echo "❌ neovim is not installed."
  echo "🛠️ Installing neovim now..."
  brew install neovim
fi

if test -d "$HOME/.config"; then 
  echo "✅ config folder exists"
else
  echo "❌ config folder does not exists"
  echo "🛠️ creating config folder"
  mkdir "$HOME/.config"
fi

# Linkers
echo "🛠️ linking neovim config"
ln -s "$HOME/.dotfiles/nvim" "$HOME/.config/nvim"

echo "🛠️ linking gitconfig config"
ln -s "$HOME/.dotfiles/.gitconfig" "$HOME/.gitconfig"

echo "🛠️ linking tmux config"
ln -s "$HOME/.dotfiles/.tmux.conf" "$HOME/.tmux.conf"
ln -s "$HOME/.dotfiles/.tmux" "$HOME/.tmux"


echo "🛠️ Getting latest tmux plugin manager"
rm -rf .tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

mkdir -p "$HOME/.config/tmux/plugins/catppuccin"
git clone -b v2.1.2 https://github.com/catppuccin/tmux.git "$HOME/.config/tmux/plugins/catppuccin/tmux"

tmux source "$HOME/.tmux.conf"
