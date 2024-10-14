#if defined(_WIN32) 
#define STBIDEF __declspec(dllimport)
#define STBIRDEF __declspec(dllimport)
#define STBIWDEF __declspec(dllimport)
#define STBTT_DEF __declspec(dllimport)
#else
#define STBIDEF extern
#define STBIRDEF extern
#define STBIWDEF extern
#define STBTT_DEF extern
#endif


/* stb files to make a simple stb lib */
#define STB_IMAGE_IMPLEMENTATION
#include "stb/stb_image.h"
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb/stb_image_write.h"
#define STB_IMAGE_RESIZE_IMPLEMENTATION
#include "stb/stb_image_resize2.h"
#define STB_TRUETYPE_IMPLEMENTATION
#include "stb/stb_truetype.h"
