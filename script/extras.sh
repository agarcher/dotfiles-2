#!/usr/bin/env bash

# make homebrew zsh the default shell
if ! grep -q "$(which zsh)" /etc/shells; then
  echo "adding homebrew zsh to /etc/shells"
  echo "$(which zsh)" | sudo tee -a /etc/shells >/dev/null
fi
chsh -s /usr/local/bin/zsh

exit 0