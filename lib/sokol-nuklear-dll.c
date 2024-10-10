#define SOKOL_IMPL
#define SOKOL_DLL
#define SOKOL_NO_ENTRY

/* sokol 3D-API defines are provided by build options */
#include "sokol_app.h"
#include "sokol_gfx.h"
#include "sokol_time.h"
#include "sokol_audio.h"
#include "sokol_fetch.h"
#include "sokol_log.h"
#include "sokol_glue.h"

#define NK_INCLUDE_FIXED_TYPES
#define NK_INCLUDE_STANDARD_IO
#define NK_INCLUDE_DEFAULT_ALLOCATOR
#define NK_INCLUDE_VERTEX_BUFFER_OUTPUT
#define NK_INCLUDE_FONT_BAKING
#define NK_INCLUDE_DEFAULT_FONT
#define NK_INCLUDE_STANDARD_VARARGS
#define NK_IMPLEMENTATION

#if defined(__clang__)
#pragma GCC diagnostic ignored "-Wunknown-warning-option"
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wsign-conversion"
#pragma GCC diagnostic ignored "-Wnull-pointer-subtraction"
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
#endif
#if defined(__GNUC__) && !defined(__clang__)
#pragma GCC diagnostic ignored "-Wmaybe-uninitialized"
#pragma GCC diagnostic ignored "-Wsign-conversion"
#pragma GCC diagnostic ignored "-Wunused-parameter"
#endif
#if defined(_MSC_VER)
#pragma warning(disable:4996)   // sprintf,fopen,localtime: This function or variable may be unsafe
#endif
#include "nuklear.h"

#define SOKOL_NUKLEAR_IMPL
#include "sokol_nuklear.h"

