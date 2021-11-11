# shortcut to this dotfiles path is $ZSH
export DOTFILES_DIR=$HOME/.dotfiles

# source the spin default first, if they are present
[[ -x /etc/zsh/zshrc.default.inc.zsh ]] && . /etc/zsh/zshrc.default.inc.zsh

# initialize autocomplete here, otherwise functions won't be loaded
autoload -Uz compinit
compinit

# Make utilities available

PATH="$DOTFILES_DIR/bin:$PATH"

# Source the dotfiles (order matters)

for DOTFILE in "$DOTFILES_DIR"/system/.{function,function_brew,function_fs,function_network,path,env,alias,grep,config,prompt,completion,fix}; do
  [ -f "$DOTFILE" ] && . "$DOTFILE"
done

if is-macos; then
  for DOTFILE in "$DOTFILES_DIR"/system/.{env,alias,function}.macos; do
    [ -f "$DOTFILE" ] && . "$DOTFILE"
  done
fi

# Better history
# Credits to https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# auto launch tmux (only on mac for now)
if is-macos; then
  # once tmux launches, $TERM_PROGRAM = "tmux" and this is bypassed
  if [[ "iTerm.app" = "$TERM_PROGRAM" ]]; then
    iterm-shell && exit
  elif [[ "vscode" = "$TERM_PROGRAM" ]]; then
    code-shell && exit
  fi
fi

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }
if [ -e /Users/agarcher/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/agarcher/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

[[ -x /usr/local/bin/brew ]] && eval $(/usr/local/bin/brew shellenv)
[[ -x /home/linuxbrew/.linuxbrew ]] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
