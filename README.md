# QuickStartLinux

## start command

```shell
chmod +x set_tsj.sh
./set_tsj.sh
```

## bugs

.zshrc:source:19: no such file or directory: /home/chivier/.profile

```
 compinit: function definition file not found
```
solved by
add 
```
export FPATH=$HOME/Install/zsh/share/zsh/5.8/functions:$FPATH 
```
in your .zshrc
