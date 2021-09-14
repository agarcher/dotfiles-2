#!/bin/sh

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add "/System/Applications/Mail.app"
dockutil --no-restart --add "/Applications/Fantastical.app"
dockutil --no-restart --add "/Applications/Obsidian.app"
dockutil --no-restart --add "/Applications/Firefox.app"
dockutil --no-restart --add "/Applications/Visual Studio Code.app"
dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/Applications/WireGuard.app"
dockutil --no-restart --add "/Applications/Bitwarden.app"
dockutil --no-restart --add "/Applications/Spotify.app"
dockutil --no-restart --add "/Applications/Loopback.app"
dockutil --no-restart --add "/Applications/Farrago.app"
dockutil --no-restart --add "/System/Applications/Utilities/Audio MIDI Setup.app"
dockutil --no-restart --add "/System/Applications/Utilities/Activity Monitor.app"
dockutil --no-restart --add "/Applications/Ecamm Live.app"

killall Dock
