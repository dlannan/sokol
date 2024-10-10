#define SOKOL_IMPL
#define SOKOL_DLL
#define SOKOL_NO_ENTRY

/* sokol 3D-API defines are provided by build options */
#include "sokol_gfx.h"
#include "sokol_app.h"

#define NK_INCLUDE_FIXED_TYPES
#define NK_INCLUDE_DEFAULT_ALLOCATOR
#define NK_INCLUDE_STANDARD_IO
#define NK_INCLUDE_STANDARD_VARARGS
#define NK_INCLUDE_FONT_BAKING
#define NK_INCLUDE_DEFAULT_FONT
#define NK_INCLUDE_VERTEX_BUFFER_OUTPUT 

#include "nuklear.h"

#define SOKOL_NUKLEAR_NO_SOKOL_APP
#define SOKOL_IMGUI_IMPL
#include "sokol_nuklear.h"

