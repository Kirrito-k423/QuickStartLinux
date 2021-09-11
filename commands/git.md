# git

## Git忽略规则.gitignore不生效

```
git rm -r --cached .

git add .

git commit -m 'update .gitignore'

```

## cancel commit

```
git revert
git reset

```

## GitHub's file size limit of 100.00 MB

```
git lfs

```

## 仓库完整性检测
```
git fsck
```

## tag

```
git tag             # 列出所有tag,按字母排序的，和创建时间没关系
git tag -l v1.*

git tag v1.0       # 创建轻量级tag
git tag -a v1.0-m ‘first version’ # -m后面带的就是注释信息


#首先查看以前的commit
git log --oneline
#假如有这样一个commit：8a5cbc2 updated readme
#这样为以前的commit添加tag
git tag -a v1.18a5cbc2

git tag -d v1.0

git push origin --tags
```