#!/bin/bash
set -e
set -v
projectRawName="project"
projectSuffix=('_alu2' '_fsu3a' '_fsu3b')

changeFileName="./set_llvm_install_raw.sh"
changeLine=
oldText="llvm"
newTextSuffix=$projectSuffix
pwd
for i in "${projectSuffix[@]}"; do
    echo $i
    cp $projectRawName $projectRawName$i -r
done

# change certain file and certain lines

for i in "${projectSuffix[@]}"; do
    echo "Step2"
    echo $i
    cd $projectRawName$i
    # print certain lines
    sed -n "3,4p" $changeFileName
    # print or use ` tail 1000 filename |head 10`
    # change file
    sed -i "s/$oldText/$oldText$i/g" $changeFileName
    # find change lines
    if [[ -z "$changeLine" ]]; then
        echo "change line is empty, need to find"
        grep $oldText$i $changeFileName
    elif [[ -n "$changeLine" ]]; then
        sed -n "'$changeLine'p" $changeFileName
    fi
    # ready to run
    mkdir build
    ## cmake
    ## cd build & make -j16 & make install
    # return
    cd ..
done

