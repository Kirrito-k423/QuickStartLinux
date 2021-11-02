continue_tsj=1
continue_tsj2=1
continue_tsj3=1

for i in range(1,2,1): # determinate 5 belongs
    for j in range(2,4,1): # first x's 2 nums
        for k in range(0,2,1):
            if continue_tsj==1:
                tsj=2
                continue_tsj=0
            else:
                tsj=0
            for p in range(tsj,4,1):
                if continue_tsj2==1:
                    tsj2=1
                    continue_tsj2=0
                else:
                    tsj2=0
                for m in range(tsj2,2,1):
                    if continue_tsj3==1:
                        tsj3=1
                        continue_tsj3=0
                    else:
                        tsj3=0
                    for n in range(tsj3,4,1):
                        sldef = [pow(2,j),pow(2,3-j)]
                        sldef[i]=sldef[i]*5
                        sldia = [pow(2,p),pow(2,3-p)]
                        sldia[k]=sldia[k]*5
                        slinC = [pow(2,n),pow(2,3-n)]
                        slinC[m]=slinC[m]*5
                        flag=0
                        for q in range(0,1):
                            if sldef[q]>30 or sldia[q]>30 or slinC[q]>30 \
                                or sldef[q]<2 or sldia[q]<2  or slinC[q]<2:
                                flag=1
                                break
                        if flag==1:
                            continue

                        parallel = {'sl_default':(int(sldef[0]),int(sldef[1]),64),
                                'sl_diagonalize':(int(sldia[0]),int(sldia[1]),64),
                                'sl_inverse_cholesky':(int(slinC[0]),int(slinC[1]),64)
                                }
