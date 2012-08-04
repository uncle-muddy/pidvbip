CFLAGS+=-DSTANDALONE -D__STDC_CONSTANT_MACROS -D__STDC_LIMIT_MACROS -DTARGET_POSIX -D_LINUX -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -U_FORTIFY_SOURCE -Wall -g -DHAVE_LIBOPENMAX=2 -DOMX -DOMX_SKIP64BIT -ftree-vectorize -pipe -DUSE_EXTERNAL_OMX -DHAVE_LIBBCM_HOST -DUSE_EXTERNAL_LIBBCM_HOST -DUSE_VCHIQ_ARM -Wno-psabi

LDFLAGS+=-L$(SDKSTAGE)/opt/vc/lib/ -lGLESv2 -lEGL -lopenmaxil -lbcm_host -lvcos -lvchiq_arm -L/opt/vc/src/hello_pi/libs/ilclient -L/opt/vc/src/hello_pi/libs/vgfont

INCLUDES+=-I$(SDKSTAGE)/opt/vc/include/ -I$(SDKSTAGE)/opt/vc/include/interface/vcos/pthreads -I./ -I/opt/vc/src/hello_pi/libs/ilclient -I/opt/vc/src/hello_pi/libs/vgfont

all: mpeg2test

mpeg2test: mpeg2test.c libmpeg2/libmpeg2.a
	gcc $(INCLUDES) $(CFLAGS) $(LDFLAGS) -o mpeg2test mpeg2test.c libmpeg2/libmpeg2.a

libmpeg2/libmpeg2.a: libmpeg2/alloc.c libmpeg2/attributes.h libmpeg2/config.h libmpeg2/cpu_accel.c libmpeg2/cpu_state.c libmpeg2/decode.c libmpeg2/header.c libmpeg2/idct.c libmpeg2/motion_comp_arm.c libmpeg2/motion_comp_arm_s.S libmpeg2/motion_comp.c libmpeg2/mpeg2.h libmpeg2/mpeg2_internal.h libmpeg2/slice.c libmpeg2/vlc.h
	make -C libmpeg2

clean:
	rm -f mpeg2test *~
	make -C libmpeg2 clean