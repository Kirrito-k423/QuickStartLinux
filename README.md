# QuickStartLinux

## start command

```shell
chmod +x set_tsj.sh
./set_tsj.sh
```

## bugs

### 1
.zshrc:source:19: no such file or directory: /home/chivier/.profile

### 2
```
 compinit: function definition file not found
```
solved by
add 
```
export FPATH=$HOME/Install/zsh/share/zsh/5.8/functions:$FPATH 
```
in your .zshrc
### 3
no module
```
echo $MODULESHOME
add
source $MODULESHOME/init/zsh
in your .zshrc
```
## quick
### 4 shutdown zsh git
```
cd .oh-my-zsh/themes
vim chivier.zsh-theme
去掉git和git_prompt_info
```
```
git config oh-my-zsh.hide-status 1

添加 --global 可以在所有仓库都禁用这个功能

设置 oh-my-zsh 不读取文件变化信息（在 git 项目目录执行下列命令）

$ git config --add oh-my-zsh.hide-dirty 1
```

### 5

The legacy SnipMate parser is deprecated. Please see :h SnipMate-deprecate.
Press ENTER or type command to continue

vim .vimrc
add
```
 let g:snipMate = { 'snippet_version' : 1 }
```

### 6 vim slow
[ref](https://blog.nowcoder.net/n/8042a45543e2453a8a933ce9fa764a7f)

```
vim --startuptime tmp.txt ~/.vimrc
sort -nrk 2 tmp.txt
```
### 7 vim color theme and quick
[1](https://linuxhint.com/best_vim_color_schemes/)
[2](https://github.com/rafi/awesome-vim-colorschemes)
