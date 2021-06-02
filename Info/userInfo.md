# userInfo

## List Usernames using awk
```
cat /etc/passwd
cat /etc/passwd | awk -F: '{print $1}'
```

## current user in which group
```
$ groups shaojiemike
shaojiemike : acsastaff sudo
```

