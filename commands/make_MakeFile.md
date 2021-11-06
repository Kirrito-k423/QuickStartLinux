
## Phony

A phony target is one that is not really the name of a file; rather it is just a name for a recipe to be executed when you make an explicit request. There are two reasons to use a phony target: to avoid a conflict with a file of the same name, and to improve performance.

## What is the difference between “make” and “make all”?

A simple make will build the first target in the list.
make all will build the target all.

## make static library

### ar rcs

Reading the manual for `ar` helps but I will explain it in more detail. `ar -rcs` is the most likely command you would use when using a Makefile to compile a library. r means that if the library already exists, replace the old files within the library with your new files. c means create the library if it did not exist. s can be seen to mean 'sort' (create a sorted index of) the library, so that it will be indexed and faster to access the functions in the library. Therefore, rcs can be seen to mean replace, create, sort.


## signals

```
$^ 代表冒号右边
$@ 代表冒号左边
$@ 扩展成当前规则的目的文件名， $< 扩展成依靠列表中的第 一个依靠文件，而 $^ 扩展成整个依靠的列表（除掉了里面所有重 复的文件名）

```