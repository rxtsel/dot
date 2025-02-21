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

alias pro="cd ~/Projects"
alias zr="source ~/.zshrc"
alias v="nvim"
alias vim="nvim"
alias zz="cd ~/.config"
alias vcfg="cd ~/.config/nvim/ && nvim init.lua"
alias clean="sudo pacman -Rns \$(pacman -Qtdq) && sudo pacman -Sc && yay -Yc && sudo rm -rf ~/.cache/ || true && find ~/.cache -type f -print -delete || true && rm -rf ~/.local/share/Trash || true"
alias z="zellij"
alias zd="zellij delete-all-sessions"
alias zk="zellij kill-all-sessions"
alias za="zellij a"
alias zl="zellij list-sessions"
alias ls='exa -la --icons'
alias cat='bat --paging=never'


# fnm
FNM_PATH="/home/rxtsel/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/rxtsel/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi
export PATH=$HOME/.local/bin:$PATH

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# pnpm
export PNPM_HOME="/home/rxtsel/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Bat theme
export BAT_THEME="Solarized (dark)"
