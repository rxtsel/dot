export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"
ZSH_THEME="robbyrussell"

plugins=(
  sudo
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

alias dot="cd ~/dot"
alias pro="cd ~/Projects"
alias zr="source ~/.zshrc"
alias v="nvim"
alias vim="nvim"
alias zz="cd ~/.config"
alias vcfg="cd ~/.config/nvim/ && nvim init.lua"
alias clean="sudo pacman -Rns \$(pacman -Qtdq) && sudo pacman -Sc && yay -Yc && sudo rm -rf ~/.cache/ || true && find ~/.cache -type f -print -delete || true && rm -rf ~/.local/share/Trash || true"
alias z="zellij"
