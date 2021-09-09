# shortcut to this dotfiles path is $ZSH
export DOTFILES_DIR=$HOME/.dotfiles

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

if [ -z "$TMUX" ]
then
  tmux attach -t default || tmux new -s default
fi
