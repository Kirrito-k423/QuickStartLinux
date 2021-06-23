# PictureBed

## 七牛云图床

https://segmentfault.com/a/1190000022761151

## github
GitHub 一直拥有各种奇怪的用途，被发掘出来当图床也见怪不怪了。

速度：国内可以接受，海外速度很快
CDN：Fastly CDN，几个节点在国内都解禁了的
HTTPS：支持（似乎不支持 HTTP2）
域名： user-images.githubusercontent.com
上传方式是新建一个 Repo，然后在 Issue 中传图（直接将图片拖动到 issue 输入框即可），GitHub 会将你的图片分发到 GitHub 用的 CDN 中。

这和使用 GitHub Raw 需要 GitHub 的服务器动态生成文件不同，user-image 这个子域名是 GitHub 专门为静态文件准备的，不会让当年某某抢票助手 CC GitHub 的事情重现的。 当然，这个接口不是公开的。善待 GitHub。

## 路过图床 https://imgchr.com/
全球CDN加速, 支持外链, 原图保存, 最大单张支持10 MB

## 新浪微博图床 https://www.crx4chrome.com/crx/17508/
为了让微博图床更易用，有人开发了一个浏览器插件「新浪微博图床」，支持选择/拖拽/粘贴上传图片，并生成图片地址、HTML、UBB 和 Markdown 等格式