#!/bin/bash

if [ $# -lt 1 ]; then
    echo "$0 <nginx version, i.e: 1.16.1>"
    exit 1
fi

cdir=`cd $(dirname $0); pwd`
version=$1
tgtdir=/root/nginx

mkdir -p $tgtdir

(
    cd $cdir/codes
    if [ ! -f nginx-$version.tar.gz ]; then 
        wget http://nginx.org/download/nginx-$version.tar.gz
        tar zxf nginx-$version.tar.gz
    fi

    cd nginx-$version
    ./configure --prefix=$tgtdir
    bear make
    make install
)

