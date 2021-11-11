#!/usr/bin/env bash
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew and install if needed
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # add linuxbrew to path for remainder of install script
  test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# linux detected, installing some linux specific dependencies
if command -v apt-get &> /dev/null; then
  echo "  Linux detected, installing dependencies"
  sudo apt-get -y install build-essential bc
fi

# Install Brewfile packages
echo "  Installing homebrew packages"
brew bundle --file=script/Brewfile

# Install Caskfile packages
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "  Mac OS detected, installing casks"
  brew bundle --file=script/Caskfile
fi

# Complete fzf install
$(brew --prefix)/opt/fzf/install --completion --key-bindings --no-update-rc --no-bash --no-fish

# make homebrew zsh the default shell
if ! grep -q "$(which zsh)" /etc/shells; then
  echo "  Adding homebrew zsh to /etc/shells"
  echo "$(which zsh)" | sudo tee -a /etc/shells >/dev/null
fi
sudo chsh -s "$(which zsh)"

exit 0
