```bash
git config --global core.editor $(which nvim) &&
git config --global pull.rebase true &&
git config --global init.defaultBranch main &&
git config --global user.email "yourmail@hotmail.com" &&
git config --global user.name "Cristhian Melo" &&
git config --global alias.s "status -sb" &&
git config --global alias.a "add" &&
git config --global alias.c "commit" &&
git config --global alias.aco '!git add -A && git commit -m' &&
git config --global alias.p push &&
git config --global alias.pll pull &&
git config --global alias.b 'branch' &&
git config --global alias.l "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all" &&
git config --global alias.conf "config --global -l" &&
git config --global alias.cl "clone" &&
git config --global alias.m 'merge' &&
git config --global alias.ch "checkout" &&
git config --global alias.nb "checkout -b" &&
git config --global alias.db "checkout -D" &&
git config --global alias.t "tag" &&
git config --global alias.sta "stash save --include-untracked --keep-index" &&
git config --global alias.stats "shortlog -sn --all --no-merges"
```