#!/bin/sh
make -f Makefile_gen

make -f Makefile_frontend 

make -f Makefile_gen2 

make -f Makefile_libcommon

make -f Makefile_last

