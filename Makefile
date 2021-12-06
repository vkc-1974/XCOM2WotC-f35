.PHONY: all clean

RES_LIB_NAME	=	liblibc_dlopen_mode
RES_LIB			=	$(RES_LIB_NAME).so
SRCS			=	\
	libc_dlopen_mode.c

CFLAGS	+=	-fpic -shared -flto -Wl,--version-script -Wl,version.map -Wl,--as-needed

#
# Add `--save-temp` to collect more details about created shared library

all: $(RES_LIB)

$(RES_LIB): $(SRCS) version.map
	$(CC) $(CFLAGS) -o $@ $(SRCS)

clean:
	$(RM) $(RES_LIB)
