#!/usr/bin/env bash
TOOLCHAIN=$(pwd)/../mips-gcc472-glibc216-64bit/bin
CROSS_COMPILE=$TOOLCHAIN/mips-linux-gnu-
export CROSS_COMPILE=${CROSS_COMPILE}
export CC=${CROSS_COMPILE}gcc
export LD=${CROSS_COMPILE}g++
export CFLGS="-muclibc -O2 -lrt -I../v4l2rtspserver-tools"
export CPPFLAGS="-muclibc -O2 -lrt -I../v4l2rtspserver-tools"
export LDFLAGS="-muclibc -O2 -lrt"
#make clean
#make all
#cd v4l2wrapper
#./compile.sh
#cd ..
#cp ./v4l2wrapper/libv4l2wrapper.a ./
rm CMakeCache.txt
rm -r CMakeFiles
cmake -DCMAKE_TOOLCHAIN_FILE="./dafang.toolchain"
make VERBOSE=1 -j4
HOST=192.168.0.18
ftp-upload -h ${HOST} -u root --password ismart12 -d /system/sdcard/bin/ v4l2rtspserver-master
