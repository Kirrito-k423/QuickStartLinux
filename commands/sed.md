![](https://shaojiemike.oss-cn-hangzhou.aliyuncs.com/img/20210820090435.png)

. 是任意除\n字符，\\.就是点的意思。

`sed -n '16224,16482 p' orig-data-file > new-file`

Where 16224,16482 are the **start** line number and **end** line number

`wc -l new-file`查看行数


![](https://shaojiemike.oss-cn-hangzhou.aliyuncs.com/img/20211109222943.png)