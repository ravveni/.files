export ZSH="$HOME/.oh-my-zsh"
export LIBRARY_PATH="$LIBRARY_PATH:/opt/local/lib/"
export PATH="/opt/homebrew/bin:$PATH"

ZSH_THEME="fox"

# Plugins
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Aliases
## Configs
alias kconf="nvim ~/.config/kitty/kitty.conf"
alias nconf="nvim ~/.config/nvim/init.lua"
alias zconf="nvim ~/.zshrc"
alias ez="source ~/.zshrc"

## Git
alias gst="git status"
alias gaa="git add -A"
alias gpl="git pull"
alias gpu="git push"
alias gci="git commit -m"
alias gbl="git branch --list"
alias gbr="git checkout -b"
alias grn="git branch -m main"
alias gsm="git switch main"
alias gsw="git switch"
alias gmm="git merge origin/main"
alias gmr="git merge"
alias gbDA="git switch main; git branch | grep -v "main" | xargs git branch -D"

## Navigation
alias dev="cd ~/_dev"

## Python
alias python="python3"
alias pip="pip3"

## Rust
alias rbook="rustup doc"

