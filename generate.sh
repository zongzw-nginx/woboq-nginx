#!/bin/bash

if [ $# -ne 1 ]; then
    echo "$0 <nginx version>"
    exit 1
fi

version=$1
srcdir=/root/woboq-nginx/codes/nginx-$1
tgtdir=/root/woboq-nginx/html/public_html

if [ ! -d $srcdir ]; then
    echo code directory not exist.
    exit 1
fi 
if [ ! -f $srcdir/compile_commands.json ]; then
    echo compile_commands.json not exists in $srcdir. Rerun 'bear make' to generate.
    exit 1
fi

mkdir -p $tgtdir

codebrowser_generator \
    -o $tgtdir \
    -b $srcdir/compile_commands.json \
    $srcdir

codebrowser_indexgenerator \
    $tgtdir
    #-d https://code.woboq.org/data \
