export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
ZSH_THEME="robbyrussell"

# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  sudo
  git
	zsh-syntax-highlighting
  zsh-autosuggestions
	)

source $ZSH/oh-my-zsh.sh

# ALIAS
alias zz="cd ~/.config"
alias vim=nvim
alias v=nvim
alias vcfg="cd ~/.config/nvim/ && nvim init.lua"
alias d="cd && cd Desktop"
alias zr="source ~/.zshrc"
alias -s {html,js,css,py,go,lua}="nvim"
alias clean="cd /var/cache/pacman/pkg/ && sudo rm -rf * && sudo pacman -Scc && cd ~/ && sudo rm -rf ~/.cache/"
alias pro="cd && cd /home/rxtsel/Desktop/proyects"

export LS_COLORS="ow=01;36;40"
# remove background color for autosuggestions with tab
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
