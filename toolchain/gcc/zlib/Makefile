#GCC=gcc
#AR=ar
#RANLIB=ranlib
include ../make.def

CFLAGS=$(CCFLAGS) -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE_URL=\"\" -DPACKAGE=\"zlib\" -DVERSION=\"1.1.4\" -DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -DHAVE_DLFCN_H=1 -DLT_OBJDIR=\".libs/\" -DHAVE_STDLIB_H=1 -DHAVE_UNISTD_H=1 -DHAVE_GETPAGESIZE=1 -DHAVE_MMAP=1 -DHAVE_MEMCPY=1 -DHAVE_STRERROR=1 -DHAVE_UNISTD_H=1 -I. -I../zlib  -I./     -g -O2


SRCS=`find ./ -name "*.c" -print`
OBJS=adler32.o compress.o crc32.o deflate.o gzread.o gzclose.o gzwrite.o gzlib.o infback.o inffast.o inflate.o inftrees.o trees.o uncompr.o zutil.o

TARGET=libz.a

all:$(OBJS)
	$(AR) $(TARGET) $(OBJS)

%.o: %.c
	$(GCC) -c $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJS)
	rm -f libz.a
