setopt EXTENDED_GLOB

# Customize to your needs...
export PATH="$HOME/.bin:$PATH"

export PATH="$PATH:`yarn global bin`"

# aliases
eval "$(rbenv init - --no-rehash)"
eval "$(thefuck --alias)"

alias be="bundle exec"
alias r="rails"
alias ssh="TERM=xterm-256color ssh"

unsetopt nomatch

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]='fg=blue'
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'
ZSH_HIGHLIGHT_STYLES[path_approx]='none'
