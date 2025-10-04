#!/bin/bash

./install-helpers-scripts/shared/rename-root.sh

if command -v brew >/dev/null 2>&1; then
  echo "✅ Homebrew is installed."
else
  echo "❌ Homebrew is not installed."
k
  echo "🛠️ Installing homebrew now..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo >> /Users/ajsteinhauser/.zprofile
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/ajsteinhauser/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if command -v bat >/dev/null 2>&1; then
  echo "✅ bat is installed."
else
  echo "❌ bat is not installed."
  echo "🛠️ Installing bat now..."
  brew install bat
fi

if command -v tms >/dev/null 2>&1; then
  echo "✅ tmux-sessionizer is installed."
else
  echo "❌ tmux-sessionizer is not installed."
  echo "🛠️ Installing tms now..."
  brew install tmux-sessionizer
fi

if command -v rg >/dev/null 2>&1; then
  echo "✅ ripgrep is installed."
else
  echo "❌ ripgrep is not installed."
  echo "🛠️ Installing ripgrep now..."
  brew install ripgrep
fi

if command -v cloc >/dev/null 2>&1; then
  echo "✅ cloc is installed."
else
  echo "❌ cloc is not installed."
  echo "🛠️ Installing cloc now..."
  brew install cloc
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

if command -v ghostty >/dev/null 2>&1; then
  echo "✅ ghostty is installed."
else
  echo "❌ ghostty is not installed."
  echo "🛠️ Installing ghostty now..."
  brew install --cask ghostty
fi

if command -v zsh >/dev/null 2>&1; then
  echo "✅ zsh is installed."
else
  echo "❌ zsh is not installed."
  echo "🛠️ Installing zsh now..."
  brew install zsh
fi


if command -v node >/dev/null 2>&1; then
  echo "✅ node is installed."
else
  echo "❌ node is not installed."
  echo "🛠️ Installing node now..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
  \. "$HOME/.nvm/nvm.sh"
  nvm install 22
  node -v 
  nvm current 
  npm -v 
fi

echo "🛠️ insalling oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Linkers
echo "🛠️ linking neovim config"
ln -s "$HOME/.dotfiles/nvim" "$HOME/.config/nvim"

echo "🛠️ linking gitconfig config"
ln -s "$HOME/.dotfiles/.gitconfig" "$HOME/.gitconfig"

echo "🛠️ linking tmux config"
ln -s "$HOME/.dotfiles/.tmux.conf" "$HOME/.tmux.conf"
ln -s "$HOME/.dotfiles/.tmux" "$HOME/.tmux"


echo "🛠️ Getting latest tmux plugin manager"
rm -rf $HOME/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

rm -rf $HOME/.config/tmux/plugins/catppuccin
mkdir -p "$HOME/.config/tmux/plugins/catppuccin"
git clone -b v2.1.2 https://github.com/catppuccin/tmux.git "$HOME/.config/tmux/plugins/catppuccin/tmux"

tmux new-session -s tmp "tmux source '$HOME/.tmux.conf' &&  ~/.tmux/plugins/tpm/bin/install_plugins && exit"

exit
