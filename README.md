# XCOM2WotC-f35
Small shared library to fix glibc compatibility issue to Steam's XCOM2 WotC game for Fedora 35 (and above i hope).
Unfortunately `XCOM2WotC` binary executable was built in a bit wrong way and adeded the referencese to GLibC's
private functions (since GLibC 2.34). I hope it will be fixed by product development team soon.
If you are lucky enough ;) (like me) and have updated your Fedora Linux to 35 you can use a small trick given project
provides: it just creates synonyms to GLibC's public functions; you just need to build a shared library ask dynamic
linker to preload it  so that `XCOM2WotC` application could use missing routines.

## Build

make

## Preload activation

There are two way to do it:

* using of LD_PRELOAD environment variable (e.g. export LD_PRELOAD=<full-path-to-liblibc_dlopen_mode.so>)
* update `Steam/steamapps/common/XCOM 2/XCOM2WotC/XCOM2WotC.sh` shell script used by `steam` application to start the game running:
  look for `LD_PRELOAD_ADDITIONS=` instruction and add the path to `liblibc_dlopen_mode.so` library there
  
## Known issues

Unfortunately space symbols in the path to `liblibc_dlopen_mode.so` library are not supported by `Steam/steamapps/common/XCOM 2/XCOM2WotC/XCOM2WotC.sh`
script out of the box. I am quite lazy to look for a solution as i am happy enough with given fix.

