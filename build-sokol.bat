
call cl.exe /I. /DSOKOL_GLCORE /D_USRDLL /D_WINDLL /Fe:bin\sokol_dll.dll lib\sokol-dll.c /link /DLL
call cl.exe /I. /I:util /DSOKOL_GLCORE /D_USRDLL /D_WINDLL /Fe:bin\sokol_shape_dll.dll lib\sokol-shape-dll.c /link /DLL
