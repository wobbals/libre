#!/bin/bash -x

MY_ANDROID_TOOLCHAIN=`pwd`/android-14-toolchain
$NDK/build/tools/make-standalone-toolchain.sh --platform=android-14 --install-dir=$MY_ANDROID_TOOLCHAIN

MY_ANDROID_TOOLCHAIN_BIN=$MY_ANDROID_TOOLCHAIN/bin
MY_SYSROOT=$NDK/platforms/android-14/arch-arm

export PATH=$MY_ANDROID_TOOLCHAIN_BIN:${PATH}

MAKE_BASE="make -C re-0.4.2"
$MAKE_BASE clean distclean
$MAKE_BASE SYSROOT=$MY_SYSROOT ARCH=arm OS=linux CC=arm-linux-androideabi-gcc RELEASE=1

