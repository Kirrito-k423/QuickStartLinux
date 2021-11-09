# QuickStartLinux

## build command
```
cp resources
chmod +x build_tsj_noNet.sh
./build_tsj_noNet.sh
chmod +x build_tsj_noNet_Part2.sh
./build_tsj_noNet_Part2.sh
```
may need to delete `^M` each line
```
dos2unix build_tsj.sh
dos2unix build_tsj_Part2.sh
```

https://www.suse.com/support/kb/doc/?id=000018317
## start command

```shell
chmod +x set_tsj.sh
./set_tsj.sh
```

## source sh & ./的区别
1. source 使当前shell读入路径为filepath的shell文件并依次执行文件中的所有语句，通常用于重新执行刚修改的初始化文件，使之立即生效，而不必注销并重新登录。
2. sh是重新生成一个shell
3. ./执行文件 查找脚本第一行是否指定了解释器，如果没指定，那么就用当前系统默认的shell(大多数linux默认是bash)，如果指定了解释器，那么就将该脚本交给指定的解释器。

![](https://shaojiemike.oss-cn-hangzhou.aliyuncs.com/img/20171008171636909.png)

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
