```bash
git config --global core.editor $(which nvim) &&
git config --global init.defaultBranch main &&
git config --global user.email "yourmail@hotmail.com" &&
git config --global user.name "Cristhian Melo" &&
git config --global alias.s "status -sb" &&
git config --global alias.a "add" &&
git config --global alias.c "commit" &&
git config --global alias.aco '!git add -A && git commit -m' &&
git config --global alias.p "push origin" &&
git config --global alias.l "log --pretty=format:\"%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(reset)\" --graph --date=relative --decorate --all"
git config --global alias.llog "log --graph --name-status --pretty=format:\"%C(red)%h %C(reset)(%cd) %C(green)%an %Creset%s %C(yellow)%d%Creset\" --date=relative"
git config --global alias.conf "config --global -l" &&
git config --global alias.cl "clone" &&
git config --global alias.ch "checkout" &&
```
