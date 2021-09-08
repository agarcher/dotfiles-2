#!/bin/bash

# make homebrew zsh the default shell
if ! grep -q "$(which zsh)" /etc/shells; then
  echo "$(which zsh)" | sudo tee /etc/shells -a
fi
chsh -s /usr/local/bin/zsh

exit 0