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
