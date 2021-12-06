// File		:libc_dlopen_mode.c
// Author	:mouse197410
// Created	:Mon Dec  6 01:53:56 2021
#include <dlfcn.h>

__attribute__((__symver__("__libc_dlopen_mode@GLIBC_PRIVATE")))
void* libc_dlopen_mode(const char *filename, int flags)
{
    return dlopen(filename, flags);
}

__attribute__((__symver__("__libc_dlsym@GLIBC_PRIVATE")))
void *libc_dlsym(void *restrict handle, const char *restrict symbol)
{
    return dlsym(handle, symbol);
}

