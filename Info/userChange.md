# userChange

## add user by step
```
adduser username
```

## new user to sudo

   [reference](https://blog.csdn.net/wujunlei1595848/article/details/87027871)
```shell
cat /etc/group
useradd -d /home/micheallei -m micheallei -G sudo -s /bin/zsh
sudo passwd micheallei
sudo scp -r .ssh micheallei@node5.xydustc.me:~/ #in node6
sudo cp -r .zshrc /home/micheallei/
sudo cp -r .oh-my-zsh /home/micheallei/
```
```shell
sudo su ella717 #login ella717
sudo chown -R ella717 ella717
sudo chgrp -R ella717 ella717 
```

## add user to sudo
```
usermod -aG sudo newuser
```
