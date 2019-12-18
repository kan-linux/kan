all:
	make -f Makefile_gen
	make -f Makefile_frontend 
	make -f Makefile_gen2 
	#make -f Makefile_libbackend 
	make -f Makefile_libcommon
	make -f Makefile_last

clean:
	make -f Makefile_gen clean
	make -f Makefile_frontend clean
	make -f Makefile_gen2  clean
	#make -f Makefile_libbackend 
	make -f Makefile_libcommon clean
	make -f Makefile_last clean
	rm -rf build
	rm -f *.a

