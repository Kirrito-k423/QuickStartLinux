#/bin/bash
 
 # 24 24 24 24*3 =  2^3*3 2^3*3 2^3*3 2^3*9
 # divide 128 = 2^7
 
 # set -evux
 totalnum=7
 num=('3' '3' '3' '3')
 reverseNum=5 #num[1]+num[2]+num[3]+num[4]-totalnum
 for ((i=0 ; i<=num[1] ; i++)); do
     for ((j=0 ; j<=num[2] ; j++)); do
         for ((k=0 ; k<=num[3] ; k++)); do
             num4=$((reverseNum-i-j-k))
             if [[ $num4 -le 3 && $num4 -ge 0 ]]; then
                 echo "$i $j $k $num4"
                 ans1=$((3*2**$i))
                 ans2=$((2**$j*3))
                 ans3=$((3*2**$k))
                 ans4=$((9*2**$num4))
                 echo "$ans1 $ans2 $ans3 $ans4"
             fi
         done
     done
 done