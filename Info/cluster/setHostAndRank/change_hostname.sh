#!bin/bash

s0=`echo 0 | ./read`
s1=`echo 1 | ./read`
s2=`echo 2 | ./read`
s3=`echo 3 | ./read`

echo ${s0} ${s1} ${s2} ${s3}

cat big-rankfile-new | sed "s/+n0/${s0}/" | sed "s/+n1/${s1}/" | sed "s/+n2/${s2}/" | sed "s/+n3/${s3}/" > rankfile.txt
