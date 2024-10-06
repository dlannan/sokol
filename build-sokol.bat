
call cl.exe /I. /DSOKOL_GLCORE /D_WIN32 /D_USRDLL /D_WINDLL /D_SLOG_WINDOWS /Fe:bin\sokol_dll.dll lib\sokol-dll.c /link /DLL
call cl.exe /I. /DSOKOL_GLCORE /D_WIN32 /D_USRDLL /D_WINDLL /D_SLOG_WINDOWS /Fe:bin\sokol_debug_dll.dll lib\sokol-debug-dll.c /link /DLL
call cl.exe /I. /Iutil /DSOKOL_GLCORE /D_WIN32 /D_USRDLL /D_WINDLL /Fe:bin\sokol_shape_dll.dll lib\sokol-shape-dll.c /link /DLL
call cl.exe /I. /Iutil /DSOKOL_GLCORE /D_WIN32 /D_USRDLL /D_WINDLL /Fe:bin\hmm_dll.dll lib\hmm-dll.c /link /DLL
