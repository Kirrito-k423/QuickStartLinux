# vim

## Code comment

can not use ctrl + c (virtul block conflict with paste)
```
big I
delete
j to next line
. to repeat
```

Add//comments on lines 10-20
起始行号，结束行号s#^#注释符#g

:10,50s#^#//#g

Delete//comments on lines 10-20
起始行号，结束行号s#^注释符##g

:10,20s#^//##g

Add # comments on lines 10-20

:10,20s/^/#/g

Remove # comments on lines 10-20

:10,20s/^/#/g

### replace

s/#/ /g
将 # 替换成空格 s

## go/back the location

ctrl + O/I

## undo/redo

u / ctrl+r

## tab multiple lines(14-23)

Press V to switch to VISUAL LINE mode and highlight the lines you want to indent by pressing j. Then press > to indent them. So the complete command would be Vjjj>.

:14,23>

## delete

delete all
:%d

:3,17d

delete one line

x   - delete current character
dw  - delete current word
dd  - delete current line
5dd - delete five lines

d$  - delete to end of line
d0  - delete to beginning of line

:1,.d
delete to beginning of file

:.,$d
delete to end of file
## copy

dd
1. 将光标移动到要复制的文本开始的地方，按v进入可视模式。

2. 将光标移动到要复制的文本的结束的地方，按y复制。此时vim会自动将光标定位到选中文本的开始的地方，并退出可视模式。

3. 我移动光标到文本结束的地方，按p粘贴。

### copy all
:%y+

## history 

q:
: or / up/down

## turn off highlighting until the next search

:noh


# cut

Press v to select characters, 
uppercase V to select whole lines,
Ctrl-v to select rectangular blocks (use Ctrl-q if Ctrl-v is mapped to paste).

d to cut