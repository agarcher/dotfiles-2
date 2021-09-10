#!/usr/bin/env bash

# install vscode extensions from codefile
for EXT in "$(cat Codefile)"
do
  code --install-extension "$EXT"
done

exit 0