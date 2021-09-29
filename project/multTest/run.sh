#!/bin/bash
set -e

cppName="add"
suffix=('raw' 'alu2' 'fsu3a' 'fsu3b' 'fsu4a' 'fsu4b')
sourcePrefix="/Install/set_llvm_install"
clangOpts="-O2 -target aarch64-unknown-linux-gnu"

pwd
for i in "${suffix[@]}"; do
    echo $i
    echo $HOME
    cat "$HOME${sourcePrefix}_${i}.sh"
    source "$HOME${sourcePrefix}_${i}.sh"
    which clang
    which llvm-mca
    clang $PWD/$cppName.c $clangOpts -S -o -|llvm-mca > "${i}_${cppName}.log"
done
