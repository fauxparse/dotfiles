setopt EXTENDED_GLOB

# Customize to your needs...
export PATH="$HOME/.bin:$PATH"

export PATH="$PATH:`yarn global bin`"

unsetopt nomatch
unsetopt correct
unsetopt correct_all

# aliases
eval "$(rbenv init - --no-rehash)"
# eval "$(thefuck --alias)"
fuck () {
  TF_HISTORY=$(fc -ln -10 | tail -n 1)
  TF_CMD=$(
      TF_ALIAS=fuck
      TF_SHELL_ALIASES=$(alias)
      TF_HISTORY=$TF_HISTORY
      PYTHONIOENCODING=utf-8
      thefuck THEFUCK_ARGUMENT_PLACEHOLDER $TF_HISTORY
  ) && eval $TF_CMD
  test -n "$TF_CMD" && print -s $TF_CMD
}

alias be="bundle exec"
alias r="rails"
alias ssh="TERM=xterm-256color ssh"

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]='fg=blue'
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'
ZSH_HIGHLIGHT_STYLES[path_approx]='none'
