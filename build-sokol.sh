#!/usr/bin/env bash

PLATFORM=$1

echo "Building for platform ${PLATFORM}"

if [ "${PLATFORM}" = "linux" ]; then
    gcc -c -I./ -I/usr/include -L/usr/include -I/usr/local/include -L/usr/local/include -DSOKOL_GLCORE lib/sokol-dll.c -o ./bin/sokol_dll.so -lpthread -ldl -lm 
    gcc -c -I./ -I/usr/include -L/usr/include -I/usr/local/include -L/usr/local/include -DSOKOL_GLCORE lib/sokol-debug-dll.c -o ./bin/sokol_debug_dll.so -lpthread -ldl -lm 
    gcc -c -I./ -I./util -I/usr/include -L/usr/include -I/usr/local/include -L/usr/local/include -DSOKOL_GLCORE lib/sokol-shape-dll.c -o ./bin/sokol_shape_dll.so -lpthread -ldl -lm 
    gcc -c -I./ -I./util -I../lib/nuklear -I/usr/include -L/usr/include -I/usr/local/include -L/usr/local/include -DSOKOL_GLCORE lib/sokol-nuklear-dll.c -o ./bin/sokol_nuklear_dll.so -lpthread -ldl -lm 
    gcc -c -I./ -I./util -I/usr/include -L/usr/include -I/usr/local/include -L/usr/local/include -DSOKOL_GLCORE lib/sokol-imgui-dll.c -o ./bin/sokol_imgui_dll.so -lpthread -ldl -lm 
    gcc -c -I./ -I./util -I/usr/include -L/usr/include -I/usr/local/include -L/usr/local/include -DSOKOL_GLCORE lib/hmm-dll.c -o ./bin/hmm_dll.so -lpthread -ldl -lm 
elif [ "${PLATFORM}" = "macosx" ]; then
    g++ -c -xobjective-c++ -I./ -I/usr/include -L/usr/include -I/usr/local/include -L/usr/local/include -DTARGET_OS_IPHONE -D__APPLE__ -DSOKOL_GLCORE lib/sokol-dll.c -o ./bin/sokol_dll_macos.so -lpthread -ldl -lm 
    g++ -c -xobjective-c++ -I./ -I/usr/include -L/usr/include -I/usr/local/include -L/usr/local/include -DTARGET_OS_IPHONE -D__APPLE__ -DSOKOL_GLCORE lib/sokol-debug-dll.c -o ./bin/sokol_debug_dll_macos.so -lpthread -ldl -lm 
    g++ -c -xobjective-c++ -I./ -I./util -I/usr/include -L/usr/include -I/usr/local/include -L/usr/local/include -DTARGET_OS_IPHONE -D__APPLE__ -DSOKOL_GLCORE lib/sokol-shape-dll.c -o ./bin/sokol_shape_dll_macos.so -lpthread -ldl -lm 
    g++ -c -xobjective-c++ -I./ -I./util -I./lib/nuklear -I/usr/include -L/usr/include -I/usr/local/include -L/usr/local/include -DTARGET_OS_IPHONE -D__APPLE__ -DSOKOL_GLCORE lib/sokol-nuklear-dll.c -o ./bin/sokol_nuklear_dll_macos.so -lpthread -ldl -lm 
    g++ -c -xobjective-c++ -I./ -I./util -I/usr/include -L/usr/include -I/usr/local/include -L/usr/local/include -DTARGET_OS_IPHONE -D__APPLE__ -DSOKOL_GLCORE lib/sokol-imgui-dll.c -o ./bin/sokol_imgui_dll_macos.so -lpthread -ldl -lm 
    g++ -c -xobjective-c++ -I./ -I./util -I/usr/include -L/usr/include -I/usr/local/include -L/usr/local/include -DTARGET_OS_IPHONE -D__APPLE__ -DSOKOL_GLCORE lib/hmm-dll.c -o ./bin/hmm_dll_macos.so -lpthread -ldl -lm 
elif [ "${PLATFORM}" = "ios64" ]; then
    g++ -c -xobjective-c++ -I./ -I/usr/include -L/usr/include -I/usr/local/include -L/usr/local/include -D__APPLE__ -DSOKOL_GLCORE lib/sokol-dll.c -o ./bin/sokol_dll_ios64.so -lpthread -ldl -lm 
    g++ -c -xobjective-c++ -I./ -I/usr/include -L/usr/include -I/usr/local/include -L/usr/local/include -D__APPLE__ -DSOKOL_GLCORE lib/sokol-debug-dll.c -o ./bin/sokol_debug_dll_ios64.so -lpthread -ldl -lm 
    g++ -c -xobjective-c++ -I./ -I./util -I/usr/include -L/usr/include -I/usr/local/include -L/usr/local/include -D__APPLE__ -DSOKOL_GLCORE lib/sokol-shape-dll.c -o ./bin/sokol_shape_dll_ios64.so -lpthread -ldl -lm 
    g++ -c -xobjective-c++ -I./ -I./lib/nuklear -I./util -I/usr/include -L/usr/include -I/usr/local/include -L/usr/local/include -D__APPLE__ -DSOKOL_GLCORE lib/sokol-nuklear-dll.c -o ./bin/sokol_nuklear_dll_ios64.so -lpthread -ldl -lm 
    g++ -c -xobjective-c++ -I./ -I./util -I/usr/include -L/usr/include -I/usr/local/include -L/usr/local/include -D__APPLE__ -DSOKOL_GLCORE lib/sokol-imgui-dll.c -o ./bin/sokol_imgui_dll_ios64.so -lpthread -ldl -lm 
    g++ -c -xobjective-c++ -I./ -I./util -I/usr/include -L/usr/include -I/usr/local/include -L/usr/local/include -D__APPLE__ -DSOKOL_GLCORE lib/hmm-dll.c -o ./bin/hmm_dll_ios64.so -lpthread -ldl -lm 
elif [ "${PLATFORM}" = "android" ]; then
    export PATH="android-ndk/toolchains/llvm/prebuilt/linux-x86_64/bin/:$PATH"
    export PATH="android-ndk/toolchains/llvm/prebuilt/linux-x86_64/:$PATH"
    
    aarch64-linux-android21-clang -c -I./ -D__ANDROID__ -DSOKOL_GLES3 -Iandroid-ndk/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include lib/sokol-dll.c -o ./bin/sokol_dll_aarch64.so -D__ANDROID__ -D__ANDROID_MIN_SDK_VERSION__=21 -lpthread -lm -fPIC -static
    rm sokol-dll.o
    armv7a-linux-androideabi19-clang -c -I./ -D__ANDROID__ -DSOKOL_GLES3 -Iandroid-ndk/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include lib/sokol-dll.c -o ./bin/sokol_dll_armv7.so -D__ANDROID__ -D__ANDROID_MIN_SDK_VERSION__=19 -lpthread -lm -fPIC -static
fi

