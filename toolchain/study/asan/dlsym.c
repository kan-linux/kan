#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>   // for dlsym

#define uptr unsigned long

# define RTLD_NEXT	    ((void *) -1l)
# define RTLD_DEFAULT	((void *) 0)

int main()
{
    void *handle = NULL;

    uptr func_addr = 0;
    uptr fptr  = 0;

    handle = dlopen("/system/lib/libc.so", RTLD_LAZY);
    if (NULL == handle)
    {
            printf("dlopen failed\n");
            return 0;
    }
    printf("handle %x\n", handle);


    if (NULL != handle)
    {
    func_addr = (uptr)dlsym(handle, "remquof");
    printf("func_addr %x\n", func_addr);
    }

    if (NULL != handle)
    {
    func_addr = (uptr)dlsym(handle, "malloc");
    printf("func_addr %x\n", func_addr);
    }


    fptr      = (uptr)dlsym(RTLD_DEFAULT, "malloc");
    printf("malloc fptr      %x\n", fptr);

    fptr      = (uptr)dlsym(RTLD_NEXT, "memset");
    printf("memset fptr      %x\n", fptr);


    printf("handle %x\n", handle);
    if (NULL != handle)
    {
        dlclose(handle);
    }

    printf("exit\n");

    return 0;
}
