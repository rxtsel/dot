export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
	git
       	sudo
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

alias dot="cd ~/dot"
alias pro="cd ~/Desktop/Proyects"
alias zr="source ~/.zshrc"
alias v="nvim"
alias vim="nvim"
alias zz="cd ~/.config"
alias vcfg="cd ~/.config/nvim/ && nvim init.lua"
alias d="cd && cd Desktop"
alias -s {html,js,css,py,go,lua}="nvim"
alias clean="cd /var/cache/pacman/pkg/ && sudo rm -rf * && sudo pacman -Scc && yay -Scc && cd ~/ && sudo rm -rf ~/.cache/ && cd"
alias D="cd ~/Downloads"
alias t="tmux"
alias tpro="cd ~/Desktop/Proyects && tmux"

# envs
fpath+=${ZDOTDIR:-~}/.zsh_functions

# fnm
export PATH="/home/rxtsel/.local/share/fnm:$PATH"
eval "`fnm env`"
