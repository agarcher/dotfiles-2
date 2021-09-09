#!/bin/bash

# make homebrew zsh the default shell
if ! grep -q "$(which zsh)" /etc/shells; then
  echo "$(which zsh)" | sudo tee -a /etc/shells
fi
chsh -s /usr/local/bin/zsh

exit 0