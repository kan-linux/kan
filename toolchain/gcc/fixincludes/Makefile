


GCC=gcc
AR=ar
RANLIB=ranlib

CFLAGS= -g -O2 -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-strings -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/fixincludes -I../include -I/android/gcc/gcc-6.4.0/fixincludes/../include

SRCS=`find ./ -name "*.c" -print`
OBJS= fixincl.o fixtests.o fixfixes.o server.o procopen.o fixlib.o fixopts.o

TARGET=fixincl

all:$(OBJS)
	$(GCC) -g -O2 -static-libstdc++ -static-libgcc -o $(TARGET) $(OBJS) ../libiberty/libiberty.a


$(OBJS): %.o: %.c
	$(GCC) -c $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJS)
