export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
ZSH_THEME="robbyrussell"

# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  sudo
  git
	zsh-syntax-highlighting
	)

source $ZSH/oh-my-zsh.sh

#
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# ALIAS
alias zz="cd ~/.config"
alias vim=nvim
alias v=nvim
alias vcfg="cd ~/.config/nvim/ && nvim init.lua"
alias d="cd && cd Desktop"
alias zr="source ~/.zshrc"
alias -s {html,js,css,py,go,lua}="nvim"
alias clean="cd /var/cache/pacman/pkg/ && sudo rm -rf * && sudo pacman -Scc && cd ~/ && sudo rm -rf ~/.cache/"
alias pro="cd && cd ~/Desktop/proyectos"
