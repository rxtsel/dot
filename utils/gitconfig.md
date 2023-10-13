```bash
git config --global core.editor $(which nvim) &&
git config --global init.defaultBranch main &&
git config --global user.email "your-email@hotmail.com" &&
git config --global user.name "Cristhian Melo" &&
git config --global alias.s "status -sb" &&
git config --global alias.a "add" &&
git config --global alias.l "log --pretty=format:\"%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(reset)\" --graph --date=relative --decorate --all" &&
```
