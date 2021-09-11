
# vim

[useful tips](https://www.ele.uri.edu/faculty/vetter/Other-stuff/vi/vimtips.html)
## Code comment
### ctrl V
Ctrl + V -> VISUAL BLOCK
Shift + I to insert

快捷键 g c
### uncomment
Ctrl + V -> VISUAL BLOCK
x   to cut
### other
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

# find
普通查找
命令模式下，按’/’或’?’，然后输入要查找的字符，Enter。

/和?的区别是，一个向前（下）找，一个向后（上）。

全词匹配
如果你输入 “/int”，你也可能找到 “print”。
要找到以 “int” 结尾的单词，可以用：

/int\>

“\>” 是一个特殊的记号，表示只匹配单词末尾。类似地，”\<” 只匹配单词的开头。

一次，要匹配一个完整的单词 “int”，只需：

/\< int\>

不区分大小写
默认是区分大小写的
先输入

:set ignorecase //忽略大小写

进行查找

再输入
:set noignorecase //恢复到大小写敏感

# 撤销与恢复 undo/redo

u   撤销上一步的操作
Ctrl+r 恢复上一步被撤销的操作

# 前进与后退 go/back the location

 Ctrl-O 执行后退，使用 Ctrl-I 执行前进。

# 移动游标by word

w 前进 b 后退
# 移动游标by word 当insert mode
alt + w/b
# 对齐
typing gg=G will reindent the entire file. 
In visual mode, typing = will fix indentation of the current section

# mouse scroll
set mouse=a in /etc/vim/vimrc.local

# 代码折叠
有6种方式来折叠代码
1. manual //手工定义折叠
2. indent //用缩进表示折叠
3. expr　 //用表达式来定义折叠
4. syntax //用语法高亮来定义折叠
5. diff   //对没有更改的文本进行折叠
6. marker //用标志折叠
## 开启
在.vimrc中设置set foldmethod=indent # vim会自动利用缩进进行折叠
## 使用
shift+v 选中 zf 定义为折叠区域
### 基本
zc 折叠
zC 对所在范围内所有嵌套的折叠点进行折叠
zo 展开折叠
zO 对所在范围内所有嵌套的折叠点展开

zf56G，创建从当前行起到56行的代码折叠；

10zf或10zf+或zf10↓，创建从当前行起到后10行的代码折叠。

10zf-或zf10↑，创建从当前行起到之前10行的代码折叠。

在括号处zf%，创建从当前行起到对应的匹配的括号上去（（），{}，[]，<>等）。

### 记忆和加载折叠
:mkview
:loadview
### zo(Open)–打开折叠, zc(Close)–关闭折叠
重复zr(Reduce)和zm(More)来打开和关闭若干嵌套的折叠。zR和zM用于嵌套了很多层的折叠。
### zn–快速禁止折叠功能, zN–回复原来的折叠, zi–切换折叠
### 移动~

[z–到当前打开的折叠的开始处。

]z–到当前打开的折叠的末尾处。

zj–向下移动。到达下一个折叠的开始处。关闭的折叠也被计入。

zk–向上移动到前一折叠的结束处。关闭的折叠也被计入。
# insert mode

CTRL-O h  move cursor left 
CTRL-O l  move cursor right
CTRL-O j  move cursor down
CTRL-O k  move cursor up

CTRL-W    delete word to the left of cursor
CTRL-O D  delete everything to the right of cursor
CTRL-U    delete everything to the left of cursor
CTRL-H    backspace/delete
CTRL-J    insert newline (easier than reaching for the return key)
CTRL-T    indent current line //缩进
CTRL-D    un-indent current line

# 定义快捷键

eg. 使用空格键关闭当前打开的折叠，或者打开当前关闭的折叠

:nnoremap <space> za

## noremap 不可以重新映射

# 分屏
## 1. 创建空白分屏
#命令：
:new
 
## 2. 打开当前文件
#命令（水平）：
[CTRL] [W]  s
 
#命令（垂直）：
[CTRL] [W]  v
 
################## 常用 ####################
 
## 3. 打开任意文件
#命令（水平）：
:split [FILENAME]
#或
:sp [FILENAME]
 
#命令（垂直）：
:vsplit [FILENAME]
#或
:vs [FILENAME]
## 关闭
#取消其它分屏，只保留当前分屏
:only 
 
#或者
[CTRL] W o
 
#退出当前所在分屏
:q
 
#或者：
:quit

# 函数跳转

## 安装ctags
sudo apt-get install exuberant-ctags
### 生成函数名索引文件
ctags -R .

### vim 使用
```
Ctrl + ]
 Ctrl + t # 返回
```
