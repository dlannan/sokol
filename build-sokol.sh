#!/usr/bin/env bash

PLATFORM=$1

echo "Building for platform ${PLATFORM}"

if [ "${PLATFORM}" = "win64" ]; then
	cl -c lib/sokol-dll.c
    lib -out:sokol-dll.dll sokol-dll.obj
elif [ "${PLATFORM}" = "linux" ]; then
    gcc -c -I./src lib/sokol-dll.c -lpthread -ldl -lm 
    ar rcs sokol-dll.so sokol-dll.o
elif [ "${PLATFORM}" = "macosx" ]; then
    gcc -c -I./src lib/sokol-dll.c -lpthread -ldl -lm 
    ar rcs sokol-dll.so sokol-dll.o
elif [ "${PLATFORM}" = "ios64" ]; then
    gcc -c -I./srclib/sokol-dll.c -lpthread -ldl -lm -arch arm64
    ar rcs sokol-dll.so sokol-dll.o
elif [ "${PLATFORM}" = "android" ]; then
    export PATH="android-ndk/toolchains/llvm/prebuilt/linux-x86_64/bin/:$PATH"
    export PATH="android-ndk/toolchains/llvm/prebuilt/linux-x86_64/:$PATH"
    
    aarch64-linux-android21-clang -c -I./src -Iandroid-ndk/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include lib/sokol-dll.c -D__ANDROID__ -D__ANDROID_MIN_SDK_VERSION__=21 -lpthread -lm -fPIC -static
    llvm-ar rcs sokol-dll-aarch64.so sokol-dll.o
    rm sokol-dll.o
    armv7a-linux-androideabi19-clang -c -I./src -Iandroid-ndk/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include lib/sokol-dll.c -D__ANDROID__ -D__ANDROID_MIN_SDK_VERSION__=19 -lpthread -lm -fPIC -static
    llvm-ar rcs sokol-dll-armv7.so sokol-dll.o
fi

