# 排除两个目录child1和child2，然后将其余目录移动到child1目录中。
mv !(child1|child2) child1

## 需求
bashrc

shopt -s extglob

zsh
For ZSH user, instead of using shopt (which will give command not found error), add this to your .zshrc: 
```
setopt extended_glob 
```
then the syntax for glob will also change accordingly. Thus use \
```
mv ~/path/to/source^(exception) ~/path/to/target/folder 
```
should do 
