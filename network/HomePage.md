# Home Page

## hugo academic

[hugo academic](https://www.bilibili.com/video/BV1Gz4y1f7Qj?from=search&seid=15537181245376985681)

https://app.netlify.com/sites/shaojiemike/settings/domain


## notion

https://www.bilibili.com/video/BV1Hh41127qK?from=search&seid=18169838059640646726

## Hexo

Similar blogs

### HYQ try

install node.js
```
gsudo
hexo init
hexo new -s
npm install hexo-deployer-git --save
vim .\_config.yml
hexo s # start at local
hexo d # deploy and push to github
hexo g # generate files
```

### Available themes

https://github.com/artchen/hexo-theme-memory

https://sharvaridesai.gitlab.io/hexo-theme-standrews/

https://www.codeblocq.com/assets/projects/hexo-theme-phantom/

## HUGO

### Install HUGO

```
create file
\bin file \Sites file
Download the latest zipped Hugo executable from Hugo Releases.
Extract all contents to your ..\Hugo\bin folder.
add executable to the PATH
set PATH=%PATH%;C:\Hugo\bin
```

### Create a New Site

```
cd D:\OneDrive - mail.ustc.edu.cn\homepage
hugo new site shaojiemike
    Congratulations! Your new Hugo site is created in D:\OneDrive - mail.ustc.edu.cn\homepage\HUGO\shaojiemike.

    Just a few more steps and you're ready to go:

    1. Download a theme into the same-named folder.
    Choose a theme from https://themes.gohugo.io/ or
    create your own with the "hugo new theme <THEMENAME>" command.
    2. Perhaps you want to add some content. You can add single files
    with "hugo new <SECTIONNAME>\<FILENAME>.<FORMAT>".
    3. Start the built-in live server via "hugo server".

    Visit https://gohugo.io/ for quickstart guide and full documentation.

```

### Add/use a theme

```
cd shaojiemike\themes
git clone --depth 1 https://github.com/carsonip/hugo-theme-minos
echo theme = \"hugo-theme-minos\" >> ../config.toml # windows 下语法不同
```

### Add Some Content
```
hugo new posts/my-first-post.md
edit
```

### Start the Hugo server local/static
```
hugo server -D
hugo -D
```

### Hugo中TaxonomyTemplate 实现的 tags categories series的bugs

由于目录生成在cn域名下，但是我没有学校的域名权限，所以需要生成静态文件后还要手动修改

public/tags/index.html 里 /tags前加 /~shaojiemike

替换
<a href="/series/
<a href="/~shaojiemike/series/

<a href="/categories/
<a href="/~shaojiemike/categories/


### 计数器
```
<footer id="footer">
    <div class="outer">
        <div id="footer-info" class="inner">
            &copy; 2021 谭邵杰的计算机奇妙旅程 
            <br />
            Powered by <a href="https://gohugo.io" target="_blank">Hugo</a> with theme <a href="https://github.com/carsonip/hugo-theme-minos" target="_blank">Minos</a>
            
        </div>
        <IMG SRC="/cgi-bin/Count.cgi?df=shaojiemike.dat">
    </div>
```

