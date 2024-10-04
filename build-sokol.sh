#!/usr/bin/env bash

PLATFORM=$1

echo "Building for platform ${PLATFORM}"

if [ "${PLATFORM}" = "win64" ]; then
    cl /DSOKOL_GLCORE lib\sokol-dll.c /link /DLL /Fe:bin\sokol_dll.dll
elif [ "${PLATFORM}" = "linux" ]; then
    gcc -c -I./ -I/usr/include -L/usr/include -I/usr/local/include -L/usr/local/include -DSOKOL_GLCORE lib/sokol-dll.c -o ./bin/sokol_dll.so -lpthread -ldl -lm 
elif [ "${PLATFORM}" = "macosx" ]; then
    gcc -c -I./ -I/usr/include -L/usr/include -I/usr/local/include -L/usr/local/include -DSOKOL_GLCORE lib/sokol-dll.c -o ./bin/sokol_dll.so -lpthread -ldl -lm 
elif [ "${PLATFORM}" = "ios64" ]; then
    gcc -c -I./ -I/usr/include -L/usr/include -I/usr/local/include -L/usr/local/include -DSOKOL_GLCORE lib/sokol-dll.c -o ./bin/sokol_dll.so -lpthread -ldl -lm 
elif [ "${PLATFORM}" = "android" ]; then
    export PATH="android-ndk/toolchains/llvm/prebuilt/linux-x86_64/bin/:$PATH"
    export PATH="android-ndk/toolchains/llvm/prebuilt/linux-x86_64/:$PATH"
    
    aarch64-linux-android21-clang -c -I./ -DSOKOL_GLCORE -Iandroid-ndk/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include lib/sokol-dll.c -o sokol_dll.so -D__ANDROID__ -D__ANDROID_MIN_SDK_VERSION__=21 -lpthread -lm -fPIC -static
    rm sokol-dll.o
    armv7a-linux-androideabi19-clang -c -I./ -DSOKOL_GLCORE -Iandroid-ndk/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include lib/sokol-dll.c -o sokol_dll.so -D__ANDROID__ -D__ANDROID_MIN_SDK_VERSION__=19 -lpthread -lm -fPIC -static
fi

