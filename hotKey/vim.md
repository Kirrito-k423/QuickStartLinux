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

:10,50s#^#//#g

Delete//comments on lines 10-20

:10,20s#^//##g

Add # comments on lines 10-20

:10,20s/^/#/g

Remove # comments on lines 10-20

:10,20s/^/#/g

## go/back the location

ctrl + O/I

## undo/redo

u / ctrl+r

## tab multiple lines(14-23)

Press V to switch to VISUAL LINE mode and highlight the lines you want to indent by pressing j. Then press > to indent them. So the complete command would be Vjjj>.

:14,23>

