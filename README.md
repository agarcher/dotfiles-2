# dotfiles

These are my dotfiles. Take what you want, but at your own risk.

## Background

Parts of this repo are not my own and has been taken from others. My [original dotfiles](https://github.com/agarcher/dotfiles) were based on a fork from https://github.com/holman/dotfiles. I re-wrote because I found the structure of it added more complexity than I needed. I also re-wrote because the first time, I setup dotfiles with an already established install of Mac OS and, as a result the install scripts weren't very well battle tested, or complete. When I got a new macbook, and had years of experience with my existing dotfiles, I decided to re-write.

I took heavy inspiration from https://github.com/webpro/dotfiles and https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789 and ultimately decided to use https://github.com/anishathalye/dotbot as a foundation, mostly because it seemed widely accepted and because it would do a lot of the things I needed to do without putting a bunch of code in my dotfiles repo that I would need to maintain.

What came from the rewrite is a combination of ideas https://github.com/holman/, https://github.com/webpro/, https://github.com/anishathalye/, and many others, as well as my own customizations.

## Usage

The structure and install scripts are all based on https://github.com/anishathalye/dotbot.

These scripts have only been tested on macos, but they are not far off from being usable on some linux distrobutions. It hasn't been a priority for me to date, but the repo is architected with this is mind.

On a fresh install of mac OS:
```
git clone https://github.com/agarcher/dotfiles-2 ~/.dotfiles
cd ~/.dotfiles
./install
```

From there, you can use all the normal `dot` commands. See `dot help` for more info. Don't forget to `dot dock` to setup the macos dock properly.
