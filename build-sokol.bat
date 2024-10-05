
call cl.exe /I. /DSOKOL_GLCORE /D_USRDLL /D_WINDLL /Fe:bin\sokol_dll.dll lib\sokol-dll.c /link /DLL
call cl.exe /I. /Iutil /DSOKOL_GLCORE /D_USRDLL /D_WINDLL /Fe:bin\sokol_shape_dll.dll lib\sokol-shape-dll.c /link /DLL
call cl.exe /I. /Iutil /DSOKOL_GLCORE /D_USRDLL /D_WINDLL /Fe:bin\hmm_dll.dll lib\hmm-dll.c /link /DLL
