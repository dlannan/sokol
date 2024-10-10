call cl.exe /I. /DSOKOL_GLCORE /D_WIN32 /D_USRDLL /D_WINDLL /D_SLOG_WINDOWS /Fe:bin\sokol_dll.dll lib\sokol-dll.c /link /DLL
call cl.exe /I. /DSOKOL_GLCORE /D_WIN32 /D_USRDLL /D_WINDLL /D_SLOG_WINDOWS /Fe:bin\sokol_debug_dll.dll lib\sokol-debug-dll.c /link /DLL
call cl.exe /I. /Iutil /DSOKOL_GLCORE /D_WIN32 /D_USRDLL /D_WINDLL /Fe:bin\sokol_shape_dll.dll lib\sokol-shape-dll.c /link /DLL

@REM Nuklear is the preferred GUI option. Much cleaner, and C friendly
call cl.exe /I. /Iutil /Ilib\nuklear /DSOKOL_GLCORE /D_WIN32 /D_USRDLL /D_WINDLL /Fe:bin\sokol_nuklear_dll.dll lib\sokol-nuklear-dll.c /link /DLL

@REM First build imgui and cimgui - DOnt use imgui. It is C++ without proper C bindings. Not worth the hassle (and its a mess too)
call cl.exe /c /I. /Iutil /Ilib/imgui /DSOKOL_GLCORE /D_WIN32 /Fe:bin\imgui.obj lib\imgui_lib.cpp
lib /nologo /out:imgui.lib imgui_lib.obj 
call cl.exe /c /I. /Iutil /Ilib/cimgui /Ilib /Ilib/imgui /DSOKOL_GLCORE /D_WIN32 /Fe:bin\cimgui.obj lib\cimgui\cimgui.cpp lib\imgui_lib.cpp lib\cimgui_lib.cpp
lib /nologo /out:cimgui.lib cimgui.obj 
call cl.exe /I. /Ilib /Iutil /Ilib/cimgui /DSOKOL_GLCORE /D_WIN32 /D_USRDLL /D_WINDLL /Fe:bin\sokol_imgui_dll.dll lib\sokol-imgui-dll.c /link /DLL /LIBPATH:"." "imgui.lib" "cimgui.lib"

call cl.exe /I. /Iutil /DSOKOL_GLCORE /D_WIN32 /D_USRDLL /D_WINDLL /Fe:bin\hmm_dll.dll lib\hmm-dll.c /link /DLL

del *.obj
del *.lib