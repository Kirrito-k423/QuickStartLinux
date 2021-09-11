# tmux hotkey

```
ctrl+b d # detached
ctrl+b % # 竖直分屏
Ctrl+b "：划分上下两个窗格。
Ctrl+b s 查看
Ctrl+b $ 重命名
Ctrl+b <arrow key>：
        光标切换到其他窗格。<arrow key>是指向要切换到的窗格的方向键.
        比如切换到下方窗格，就按方向键↓。
Ctrl+b ;：光标切换到上一个窗格。
Ctrl+b o：光标切换到下一个窗格。
Ctrl+b {：当前窗格与上一个窗格交换位置。
Ctrl+b }：当前窗格与下一个窗格交换位置。

Ctrl+b Ctrl+o：所有窗格向前移动一个位置，第一个窗格变成最后一个窗格。
Ctrl+b Alt+o：所有窗格向后移动一个位置，最后一个窗格变成第一个窗格。

Ctrl+b x：关闭当前窗格。
Ctrl+b !：将当前窗格拆分为一个独立窗口。

Ctrl+b z：当前窗格全屏显示，再使用一次会变回原来大小。
Ctrl+b Ctrl+<arrow key>：按箭头方向调整窗格大小。

Ctrl+b q：显示窗格编号。
```

## ohmyTmux
<> + ? 查看可选项
### win and panes
```
ctrl + a + <>
<> + c 		:新建win
<prefix> - 	:splits the current pane vertically
<prefix> _ 	:splits the current pane horizontally

<> + 数字 	：切换到第几个win
<prefix> + 	:maximizes the current pane to a new window
<> + , 		: rename win
<> + x		: kill pane
<> + q		: kill win
<> + w		: check and switch to another
<prefix> Tab 	: brings you to the last active window
```
### others
```
<prefix> e 
opens ~/.tmux.conf.local with the editor defined by the $EDITOR environment variable (defaults to vim when empty)
<prefix>m 	打开或关闭鼠标模式

<prefix>Enter	进入复制模式

<prefix>b	列出了粘贴缓冲区

<prefix>p	从顶部粘贴缓冲区粘贴

<prefix>P	用于选择要从中粘贴的粘贴缓冲区
```