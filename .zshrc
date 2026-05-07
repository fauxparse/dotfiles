# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git 1password zsh-autosuggestions zsh-completions)

[ -f ~/src/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ] && source ~/src/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

source $ZSH/oh-my-zsh.sh

# Load p10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

gch() {
  git checkout "$(git branch --all | fzf | tr -d '[:space:]')"
}

alias be="bundle exec"
alias bpm='bundle install && pnpm install && ./dev/bin/syncdotenv && r db:migrate && gco db/structure.sql'
alias c="cursor ."
alias g="git"
alias ga='git add'
alias gaa='git add .'
alias gbc='git checkout -b'
alias gco="git checkout"
alias gra='git rebase --abort'
alias gram='git rebase -i --autosquash origin/main'
alias grc='git rebase --continue'
alias orw='overmind restart web'
alias os='overmind start -f Procfile.dev'
alias r='bundle exec rails'
alias rs='bundle exec rspec'

