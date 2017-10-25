[33mcommit 031db507da7450d926eadcdbd265e88a730006ab[m
Author: Thai Nhat Minh <t.n.minh1997@gmail.com>
Date:   Wed Oct 25 01:46:25 2017 +0700

    Create CreateFile syscal

[1mdiff --git a/Test1.txt b/Test1.txt[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/Test2.txt b/Test2.txt[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/Test3.txt b/Test3.txt[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/Test4.txt b/Test4.txt[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/Test5.txt b/Test5.txt[m
[1mnew file mode 100644[m
[1mindex 0000000..e69de29[m
[1mdiff --git a/filesys/Makefile b/filesys/Makefile[m
[1mindex df831b8..4f5eda8 100644[m
[1m--- a/filesys/Makefile[m
[1m+++ b/filesys/Makefile[m
[36m@@ -26,481 +26,618 @@[m [minclude ../Makefile.dep[m
 #-----------------------------------------------------------------[m
 # DO NOT DELETE THIS LINE -- make depend uses it[m
 # DEPENDENCIES MUST END AT END OF FILE[m
[31m-main.o: ../threads/main.cc ../threads/copyright.h ../threads/utility.h \[m
[31m-  ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/system.h ../threads/thread.h \[m
[31m-  ../machine/machine.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[31m-  ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[31m-  ../machine/stats.h ../machine/timer.h ../filesys/synchdisk.h \[m
[31m-  ../threads/synch.h[m
[31m-list.o: ../threads/list.cc ../threads/copyright.h ../threads/list.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h[m
[31m-scheduler.o: ../threads/scheduler.cc ../threads/copyright.h \[m
[31m-  ../threads/scheduler.h ../threads/list.h ../threads/utility.h \[m
[31m-  ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/system.h \[m
[31m-  ../machine/interrupt.h ../machine/stats.h ../machine/timer.h \[m
[31m-  ../filesys/synchdisk.h ../threads/synch.h[m
[31m-synch.o: ../threads/synch.cc ../threads/copyright.h ../threads/synch.h \[m
[31m-  ../threads/thread.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../machine/machine.h ../machine/translate.h \[m
[31m-  ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[31m-  ../filesys/openfile.h ../threads/list.h ../threads/system.h \[m
[31m-  ../threads/scheduler.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h ../filesys/synchdisk.h[m
[31m-synchlist.o: ../threads/synchlist.cc ../threads/copyright.h \[m
[31m-  ../threads/synchlist.h ../threads/list.h ../threads/utility.h \[m
[31m-  ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/synch.h ../threads/thread.h \[m
[31m-  ../machine/machine.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h[m
[31m-system.o: ../threads/system.cc ../threads/copyright.h ../threads/system.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h ../filesys/synchdisk.h ../threads/synch.h[m
[31m-thread.o: ../threads/thread.cc ../threads/copyright.h ../threads/thread.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../machine/machine.h ../machine/translate.h \[m
[31m-  ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[31m-  ../filesys/openfile.h ../threads/switch.h ../threads/synch.h \[m
[31m-  ../threads/list.h ../threads/system.h ../threads/scheduler.h \[m
[31m-  ../machine/interrupt.h ../machine/stats.h ../machine/timer.h \[m
[31m-  ../filesys/synchdisk.h[m
[31m-utility.o: ../threads/utility.cc ../threads/copyright.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h[m
[31m-threadtest.o: ../threads/threadtest.cc ../threads/copyright.h \[m
[31m-  ../threads/system.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h ../filesys/synchdisk.h ../threads/synch.h[m
[31m-interrupt.o: ../machine/interrupt.cc ../threads/copyright.h \[m
[31m-  ../machine/interrupt.h ../threads/list.h ../threads/utility.h \[m
[31m-  ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/system.h ../threads/thread.h \[m
[31m-  ../machine/machine.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[31m-  ../threads/scheduler.h ../machine/stats.h ../machine/timer.h \[m
[31m-  ../filesys/synchdisk.h ../threads/synch.h[m
[31m-sysdep.o: ../machine/sysdep.cc ../threads/copyright.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h /usr/include/signal.h /usr/include/bits/sigset.h \[m
[31m-  /usr/include/bits/signum.h /usr/include/time.h \[m
[31m-  /usr/include/bits/siginfo.h /usr/include/bits/sigaction.h \[m
[31m-  /usr/include/bits/sigcontext.h /usr/include/asm/sigcontext.h \[m
[31m-  /usr/include/bits/sigstack.h /usr/include/ucontext.h \[m
[31m-  /usr/include/sys/ucontext.h /usr/include/bits/pthreadtypes.h \[m
[31m-  /usr/include/bits/sched.h /usr/include/bits/sigthread.h \[m
[31m-  /usr/include/sys/types.h /usr/include/endian.h \[m
[31m-  /usr/include/bits/endian.h /usr/include/sys/select.h \[m
[31m-  /usr/include/bits/select.h /usr/include/bits/time.h \[m
[31m-  /usr/include/sys/sysmacros.h /usr/include/sys/time.h \[m
[31m-  /usr/include/sys/socket.h /usr/include/sys/uio.h \[m
[31m-  /usr/include/bits/uio.h /usr/include/bits/socket.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/limits.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/syslimits.h \[m
[31m-  /usr/include/limits.h /usr/include/bits/posix1_lim.h \[m
[31m-  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \[m
[31m-  /usr/include/bits/posix2_lim.h /usr/include/bits/xopen_lim.h \[m
[31m-  /usr/include/bits/sockaddr.h /usr/include/asm/socket.h \[m
[31m-  /usr/include/asm/sockios.h /usr/include/sys/file.h /usr/include/fcntl.h \[m
[31m-  /usr/include/bits/fcntl.h /usr/include/sys/stat.h \[m
[31m-  /usr/include/bits/stat.h /usr/include/sys/un.h /usr/include/sys/mman.h \[m
[31m-  /usr/include/bits/mman.h /usr/include/unistd.h \[m
[31m-  /usr/include/bits/posix_opt.h /usr/include/bits/environments.h \[m
[31m-  /usr/include/bits/confname.h /usr/include/getopt.h /usr/include/errno.h \[m
[31m-  /usr/include/bits/errno.h /usr/include/linux/errno.h \[m
[31m-  /usr/include/asm/errno.h ../machine/interrupt.h ../threads/list.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  ../threads/system.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../machine/stats.h ../machine/timer.h ../filesys/synchdisk.h \[m
[31m-  ../threads/synch.h[m
[31m-stats.o: ../machine/stats.cc ../threads/copyright.h ../threads/utility.h \[m
[31m-  ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../machine/stats.h[m
[31m-timer.o: ../machine/timer.cc ../threads/copyright.h ../machine/timer.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/system.h ../threads/thread.h \[m
[31m-  ../machine/machine.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[31m-  ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[31m-  ../machine/stats.h ../filesys/synchdisk.h ../threads/synch.h[m
[31m-addrspace.o: ../userprog/addrspace.cc ../threads/copyright.h \[m
[31m-  ../threads/system.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h ../filesys/synchdisk.h ../threads/synch.h \[m
[31m-  ../bin/noff.h[m
[31m-bitmap.o: ../userprog/bitmap.cc ../threads/copyright.h \[m
[31m-  ../userprog/bitmap.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../filesys/openfile.h[m
[31m-exception.o: ../userprog/exception.cc ../threads/copyright.h \[m
[31m-  ../threads/system.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h ../filesys/synchdisk.h ../threads/synch.h \[m
[31m-  ../userprog/syscall.h[m
[31m-progtest.o: ../userprog/progtest.cc ../threads/copyright.h \[m
[31m-  ../threads/system.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h ../filesys/synchdisk.h ../threads/synch.h \[m
[31m-  ../machine/console.h[m
[31m-console.o: ../machine/console.cc ../threads/copyright.h \[m
[31m-  ../machine/console.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/system.h ../threads/thread.h \[m
[31m-  ../machine/machine.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[31m-  ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[31m-  ../machine/stats.h ../machine/timer.h ../filesys/synchdisk.h \[m
[31m-  ../threads/synch.h[m
[31m-machine.o: ../machine/machine.cc ../threads/copyright.h \[m
[31m-  ../machine/machine.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../threads/system.h ../threads/thread.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h ../filesys/synchdisk.h ../threads/synch.h[m
[31m-mipssim.o: ../machine/mipssim.cc ../threads/copyright.h \[m
[31m-  ../machine/machine.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../machine/mipssim.h ../threads/system.h ../threads/thread.h \[m
[31m-  ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[31m-  ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[31m-  ../machine/stats.h ../machine/timer.h ../filesys/synchdisk.h \[m
[31m-  ../threads/synch.h[m
[31m-translate.o: ../machine/translate.cc ../threads/copyright.h \[m
[31m-  ../machine/machine.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[31m-  ../threads/system.h ../threads/thread.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h ../filesys/synchdisk.h ../threads/synch.h[m
[31m-directory.o: ../filesys/directory.cc ../threads/copyright.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../filesys/filehdr.h ../machine/disk.h \[m
[31m-  ../userprog/bitmap.h ../filesys/openfile.h ../filesys/directory.h[m
[31m-filehdr.o: ../filesys/filehdr.cc ../threads/copyright.h \[m
[31m-  ../threads/system.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h ../filesys/synchdisk.h ../threads/synch.h \[m
[31m-  ../filesys/filehdr.h ../userprog/bitmap.h[m
[31m-filesys.o: ../filesys/filesys.cc ../threads/copyright.h ../machine/disk.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../userprog/bitmap.h ../filesys/openfile.h \[m
[31m-  ../filesys/directory.h ../filesys/filehdr.h ../filesys/filesys.h[m
[31m-fstest.o: ../filesys/fstest.cc ../threads/copyright.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../filesys/filesys.h ../filesys/openfile.h \[m
[31m-  ../threads/system.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[31m-  ../machine/stats.h ../machine/timer.h ../filesys/synchdisk.h \[m
[31m-  ../threads/synch.h[m
[31m-openfile.o: ../filesys/openfile.cc ../threads/copyright.h \[m
[31m-  ../filesys/filehdr.h ../machine/disk.h ../threads/utility.h \[m
[31m-  ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../userprog/bitmap.h ../filesys/openfile.h \[m
[31m-  ../threads/system.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[31m-  ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[31m-  ../machine/stats.h ../machine/timer.h ../filesys/synchdisk.h \[m
[31m-  ../threads/synch.h[m
[31m-synchdisk.o: ../filesys/synchdisk.cc ../threads/copyright.h \[m
[31m-  ../filesys/synchdisk.h ../machine/disk.h ../threads/utility.h \[m
[31m-  ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/synch.h ../threads/thread.h \[m
[31m-  ../machine/machine.h ../machine/translate.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/list.h[m
[31m-disk.o: ../machine/disk.cc ../threads/copyright.h ../machine/disk.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/system.h ../threads/thread.h \[m
[31m-  ../machine/machine.h ../machine/translate.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h ../filesys/synchdisk.h ../threads/synch.h[m
[32m+[m[32mmain.o: ../threads/main.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/utility.h ../threads/bool.h \[m
[32m+[m[32m ../machine/sysdep.h ../threads/copyright.h /usr/include/stdio.h \[m
[32m+[m[32m /usr/include/features.h /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/system.h ../threads/thread.h \[m
[32m+[m[32m ../machine/machine.h ../threads/utility.h ../machine/translate.h \[m
[32m+[m[32m ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../filesys/openfile.h ../threads/scheduler.h ../threads/list.h \[m
[32m+[m[32m ../machine/interrupt.h ../threads/list.h ../machine/stats.h \[m
[32m+[m[32m ../machine/timer.h ../threads/synchcons.h ../machine/console.h \[m
[32m+[m[32m ../filesys/synchdisk.h ../machine/disk.h ../threads/synch.h[m
[32m+[m[32mlist.o: ../threads/list.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/list.h ../threads/utility.h \[m
[32m+[m[32m ../threads/bool.h ../machine/sysdep.h ../threads/copyright.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h[m
[32m+[m[32mscheduler.o: ../threads/scheduler.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/scheduler.h ../threads/list.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m ../threads/copyright.h /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/system.h ../machine/interrupt.h ../threads/list.h \[m
[32m+[m[32m ../machine/stats.h ../machine/timer.h ../threads/synchcons.h \[m
[32m+[m[32m ../machine/console.h ../filesys/synchdisk.h ../machine/disk.h \[m
[32m+[m[32m ../threads/synch.h[m
[32m+[m[32msynch.o: ../threads/synch.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/synch.h ../threads/thread.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m ../threads/copyright.h /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../machine/machine.h ../threads/utility.h \[m
[32m+[m[32m ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[32m+[m[32m ../filesys/filesys.h ../filesys/openfile.h ../threads/list.h \[m
[32m+[m[32m ../threads/system.h ../threads/scheduler.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../filesys/synchdisk.h \[m
[32m+[m[32m ../machine/disk.h ../threads/synch.h[m
[32m+[m[32msynchlist.o: ../threads/synchlist.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/synchlist.h ../threads/list.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m ../threads/copyright.h /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/synch.h ../threads/thread.h \[m
[32m+[m[32m ../machine/machine.h ../threads/utility.h ../machine/translate.h \[m
[32m+[m[32m ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../filesys/openfile.h[m
[32m+[m[32msystem.o: ../threads/system.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/system.h ../threads/utility.h \[m
[32m+[m[32m ../threads/bool.h ../machine/sysdep.h ../threads/copyright.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../filesys/synchdisk.h \[m
[32m+[m[32m ../machine/disk.h ../threads/synch.h[m
[32m+[m[32mthread.o: ../threads/thread.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/thread.h ../threads/utility.h \[m
[32m+[m[32m ../threads/bool.h ../machine/sysdep.h ../threads/copyright.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../machine/machine.h ../threads/utility.h \[m
[32m+[m[32m ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[32m+[m[32m ../filesys/filesys.h ../filesys/openfile.h ../threads/switch.h \[m
[32m+[m[32m ../threads/synch.h ../threads/list.h ../threads/system.h \[m
[32m+[m[32m ../threads/scheduler.h ../machine/interrupt.h ../threads/list.h \[m
[32m+[m[32m ../machine/stats.h ../machine/timer.h ../threads/synchcons.h \[m
[32m+[m[32m ../machine/console.h ../filesys/synchdisk.h ../machine/disk.h \[m
[32m+[m[32m ../threads/synch.h[m
[32m+[m[32mutility.o: ../threads/utility.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/utility.h ../threads/bool.h \[m
[32m+[m[32m ../machine/sysdep.h ../threads/copyright.h /usr/include/stdio.h \[m
[32m+[m[32m /usr/include/features.h /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/stdarg.h[m
[32m+[m[32mthreadtest.o: ../threads/threadtest.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/system.h ../threads/utility.h \[m
[32m+[m[32m ../threads/bool.h ../machine/sysdep.h ../threads/copyright.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../filesys/synchdisk.h \[m
[32m+[m[32m ../machine/disk.h ../threads/synch.h[m
[32m+[m[32minterrupt.o: ../machine/interrupt.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../machine/interrupt.h ../threads/list.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/utility.h ../threads/bool.h \[m
[32m+[m[32m ../machine/sysdep.h /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/system.h ../threads/thread.h \[m
[32m+[m[32m ../machine/machine.h ../threads/utility.h ../machine/translate.h \[m
[32m+[m[32m ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../filesys/openfile.h ../threads/scheduler.h ../threads/list.h \[m
[32m+[m[32m ../machine/interrupt.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../filesys/synchdisk.h \[m
[32m+[m[32m ../machine/disk.h ../threads/synch.h[m
[32m+[m[32msysdep.o: ../machine/sysdep.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h /usr/include/signal.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sigset.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/signum.h /usr/include/time.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/siginfo.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sigaction.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sigcontext.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sigstack.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/ucontext.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/pthreadtypes.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sigthread.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/types.h /usr/include/endian.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/endian.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/byteswap.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/byteswap-16.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/select.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/select.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/time.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/sysmacros.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/time.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/socket.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/uio.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/uio.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/socket.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/socket_type.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sockaddr.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/asm/socket.h \[m
[32m+[m[32m /usr/include/asm-generic/socket.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/asm/sockios.h \[m
[32m+[m[32m /usr/include/asm-generic/sockios.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/file.h /usr/include/fcntl.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/fcntl.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/fcntl-linux.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stat.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/un.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/mman.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/mman.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/mman-linux.h /usr/include/unistd.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/posix_opt.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/environments.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/confname.h /usr/include/getopt.h \[m
[32m+[m[32m /usr/include/errno.h /usr/include/i386-linux-gnu/bits/errno.h \[m
[32m+[m[32m /usr/include/linux/errno.h /usr/include/i386-linux-gnu/asm/errno.h \[m
[32m+[m[32m /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \[m
[32m+[m[32m ../machine/interrupt.h ../threads/list.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m ../threads/system.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../machine/stats.h ../machine/timer.h ../threads/synchcons.h \[m
[32m+[m[32m ../machine/console.h ../filesys/synchdisk.h ../machine/disk.h \[m
[32m+[m[32m ../threads/synch.h[m
[32m+[m[32mstats.o: ../machine/stats.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/utility.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/bool.h ../machine/sysdep.h /usr/include/stdio.h \[m
[32m+[m[32m /usr/include/features.h /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../machine/stats.h[m
[32m+[m[32mtimer.o: ../machine/timer.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../machine/timer.h ../threads/utility.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/system.h ../threads/utility.h \[m
[32m+[m[32m ../threads/thread.h ../machine/machine.h ../machine/translate.h \[m
[32m+[m[32m ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../filesys/openfile.h ../threads/scheduler.h ../threads/list.h \[m
[32m+[m[32m ../machine/interrupt.h ../threads/list.h ../machine/stats.h \[m
[32m+[m[32m ../machine/timer.h ../threads/synchcons.h ../machine/console.h \[m
[32m+[m[32m ../filesys/synchdisk.h ../machine/disk.h ../threads/synch.h[m
[32m+[m[32maddrspace.o: ../userprog/addrspace.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/system.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../filesys/synchdisk.h \[m
[32m+[m[32m ../machine/disk.h ../threads/synch.h ../userprog/addrspace.h \[m
[32m+[m[32m ../bin/noff.h[m
[32m+[m[32mbitmap.o: ../userprog/bitmap.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../userprog/bitmap.h ../threads/utility.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../filesys/openfile.h[m
[32m+[m[32mexception.o: ../userprog/exception.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/system.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../filesys/synchdisk.h \[m
[32m+[m[32m ../machine/disk.h ../threads/synch.h ../userprog/syscall.h[m
[32m+[m[32mprogtest.o: ../userprog/progtest.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/system.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../filesys/synchdisk.h \[m
[32m+[m[32m ../machine/disk.h ../threads/synch.h ../userprog/addrspace.h[m
[32m+[m[32mconsole.o: ../machine/console.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../machine/console.h ../threads/utility.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/system.h ../threads/utility.h \[m
[32m+[m[32m ../threads/thread.h ../machine/machine.h ../machine/translate.h \[m
[32m+[m[32m ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../filesys/openfile.h ../threads/scheduler.h ../threads/list.h \[m
[32m+[m[32m ../machine/interrupt.h ../threads/list.h ../machine/stats.h \[m
[32m+[m[32m ../machine/timer.h ../threads/synchcons.h ../machine/console.h \[m
[32m+[m[32m ../filesys/synchdisk.h ../machine/disk.h ../threads/synch.h[m
[32m+[m[32mmachine.o: ../machine/machine.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../machine/machine.h ../threads/utility.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../threads/system.h ../threads/utility.h ../threads/thread.h \[m
[32m+[m[32m ../machine/machine.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../filesys/openfile.h ../threads/scheduler.h ../threads/list.h \[m
[32m+[m[32m ../machine/interrupt.h ../threads/list.h ../machine/stats.h \[m
[32m+[m[32m ../machine/timer.h ../threads/synchcons.h ../machine/console.h \[m
[32m+[m[32m ../filesys/synchdisk.h ../machine/disk.h ../threads/synch.h[m
[32m+[m[32mmipssim.o: ../machine/mipssim.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../machine/machine.h ../threads/utility.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../machine/mipssim.h ../threads/system.h ../threads/utility.h \[m
[32m+[m[32m ../threads/thread.h ../machine/machine.h ../userprog/addrspace.h \[m
[32m+[m[32m ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[32m+[m[32m ../threads/list.h ../machine/interrupt.h ../threads/list.h \[m
[32m+[m[32m ../machine/stats.h ../machine/timer.h ../threads/synchcons.h \[m
[32m+[m[32m ../machine/console.h ../filesys/synchdisk.h ../machine/disk.h \[m
[32m+[m[32m ../threads/synch.h[m
[32m+[m[32mtranslate.o: ../machine/translate.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../machine/machine.h ../threads/utility.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/system.h ../threads/utility.h ../threads/thread.h \[m
[32m+[m[32m ../machine/machine.h ../threads/scheduler.h ../threads/list.h \[m
[32m+[m[32m ../machine/interrupt.h ../threads/list.h ../machine/stats.h \[m
[32m+[m[32m ../machine/timer.h ../threads/synchcons.h ../machine/console.h \[m
[32m+[m[32m ../filesys/synchdisk.h ../machine/disk.h ../threads/synch.h[m
[32m+[m[32msynchcons.o: ../threads/synchcons.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/utility.h ../threads/copyright.h ../threads/bool.h \[m
[32m+[m[32m ../machine/sysdep.h /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/synch.h ../threads/thread.h \[m
[32m+[m[32m ../threads/utility.h ../machine/machine.h ../machine/translate.h \[m
[32m+[m[32m ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../filesys/openfile.h ../threads/list.h[m
[32m+[m[32mdirectory.o: ../filesys/directory.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/utility.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/bool.h ../machine/sysdep.h /usr/include/stdio.h \[m
[32m+[m[32m /usr/include/features.h /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../filesys/filehdr.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/bitmap.h ../filesys/openfile.h ../filesys/directory.h \[m
[32m+[m[32m ../filesys/openfile.h[m
[32m+[m[32mfilehdr.o: ../filesys/filehdr.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/system.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../filesys/synchdisk.h \[m
[32m+[m[32m ../machine/disk.h ../threads/synch.h ../filesys/filehdr.h \[m
[32m+[m[32m ../userprog/bitmap.h ../filesys/openfile.h[m
[32m+[m[32mfilesys.o: ../filesys/filesys.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../machine/disk.h ../threads/utility.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../userprog/bitmap.h ../filesys/openfile.h \[m
[32m+[m[32m ../filesys/directory.h ../filesys/openfile.h ../filesys/filehdr.h \[m
[32m+[m[32m ../filesys/filesys.h[m
[32m+[m[32mfstest.o: ../filesys/fstest.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/utility.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/bool.h ../machine/sysdep.h /usr/include/stdio.h \[m
[32m+[m[32m /usr/include/features.h /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/system.h ../threads/utility.h ../threads/thread.h \[m
[32m+[m[32m ../machine/machine.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../threads/scheduler.h \[m
[32m+[m[32m ../threads/list.h ../machine/interrupt.h ../threads/list.h \[m
[32m+[m[32m ../machine/stats.h ../machine/timer.h ../threads/synchcons.h \[m
[32m+[m[32m ../machine/console.h ../filesys/synchdisk.h ../machine/disk.h \[m
[32m+[m[32m ../threads/synch.h ../threads/thread.h[m
[32m+[m[32mopenfile.o: ../filesys/openfile.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../filesys/filehdr.h ../machine/disk.h \[m
[32m+[m[32m ../threads/utility.h ../threads/copyright.h ../threads/bool.h \[m
[32m+[m[32m ../machine/sysdep.h /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../userprog/bitmap.h ../filesys/openfile.h \[m
[32m+[m[32m ../filesys/openfile.h ../threads/system.h ../threads/utility.h \[m
[32m+[m[32m ../threads/thread.h ../machine/machine.h ../machine/translate.h \[m
[32m+[m[32m ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../filesys/synchdisk.h \[m
[32m+[m[32m ../threads/synch.h[m
[32m+[m[32msynchdisk.o: ../filesys/synchdisk.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../filesys/synchdisk.h ../machine/disk.h \[m
[32m+[m[32m ../threads/utility.h ../threads/copyright.h ../threads/bool.h \[m
[32m+[m[32m ../machine/sysdep.h /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/synch.h ../threads/thread.h \[m
[32m+[m[32m ../threads/utility.h ../machine/machine.h ../machine/translate.h \[m
[32m+[m[32m ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../filesys/openfile.h ../threads/list.h[m
[32m+[m[32mdisk.o: ../machine/disk.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../machine/disk.h ../threads/utility.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/system.h ../threads/utility.h \[m
[32m+[m[32m ../threads/thread.h ../machine/machine.h ../machine/translate.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../filesys/synchdisk.h \[m
[32m+[m[32m ../machine/disk.h ../threads/synch.h[m
 # DEPENDENCIES MUST END AT END OF FILE[m
 # IF YOU PUT STUFF HERE IT WILL GO AWAY[m
 # see make depend above[m
[1mdiff --git a/filesys/addrspace.o b/filesys/addrspace.o[m
[1mindex d2b2f4c..6ec5353 100644[m
Binary files a/filesys/addrspace.o and b/filesys/addrspace.o differ
[1mdiff --git a/filesys/console.o b/filesys/console.o[m
[1mindex 59c8774..8781c78 100644[m
Binary files a/filesys/console.o and b/filesys/console.o differ
[1mdiff --git a/filesys/disk.o b/filesys/disk.o[m
[1mindex cbb1dfa..a4eba6a 100644[m
Binary files a/filesys/disk.o and b/filesys/disk.o differ
[1mdiff --git a/filesys/exception.o b/filesys/exception.o[m
[1mindex fa8786d..df430c3 100644[m
Binary files a/filesys/exception.o and b/filesys/exception.o differ
[1mdiff --git a/filesys/filehdr.o b/filesys/filehdr.o[m
[1mindex a5ffc56..ebf897a 100644[m
Binary files a/filesys/filehdr.o and b/filesys/filehdr.o differ
[1mdiff --git a/filesys/fstest.o b/filesys/fstest.o[m
[1mindex 18cbe6f..24e8895 100644[m
Binary files a/filesys/fstest.o and b/filesys/fstest.o differ
[1mdiff --git a/filesys/interrupt.o b/filesys/interrupt.o[m
[1mindex 4ba7ea0..49e7cf4 100644[m
Binary files a/filesys/interrupt.o and b/filesys/interrupt.o differ
[1mdiff --git a/filesys/machine.o b/filesys/machine.o[m
[1mindex 2008b0b..5ddbf81 100644[m
Binary files a/filesys/machine.o and b/filesys/machine.o differ
[1mdiff --git a/filesys/main.o b/filesys/main.o[m
[1mindex 7dac312..779ca6f 100644[m
Binary files a/filesys/main.o and b/filesys/main.o differ
[1mdiff --git a/filesys/mipssim.o b/filesys/mipssim.o[m
[1mindex cd95a4c..8eac268 100644[m
Binary files a/filesys/mipssim.o and b/filesys/mipssim.o differ
[1mdiff --git a/filesys/nachos b/filesys/nachos[m
[1mindex a745f70..9ff8617 100644[m
Binary files a/filesys/nachos and b/filesys/nachos differ
[1mdiff --git a/filesys/openfile.o b/filesys/openfile.o[m
[1mindex 2638f65..0e313af 100644[m
Binary files a/filesys/openfile.o and b/filesys/openfile.o differ
[1mdiff --git a/filesys/progtest.o b/filesys/progtest.o[m
[1mindex 9865afd..edecf61 100644[m
Binary files a/filesys/progtest.o and b/filesys/progtest.o differ
[1mdiff --git a/filesys/scheduler.o b/filesys/scheduler.o[m
[1mindex 77ef460..8da1612 100644[m
Binary files a/filesys/scheduler.o and b/filesys/scheduler.o differ
[1mdiff --git a/filesys/synch.o b/filesys/synch.o[m
[1mindex 922ced7..f2dfe61 100644[m
Binary files a/filesys/synch.o and b/filesys/synch.o differ
[1mdiff --git a/filesys/synchcons.o b/filesys/synchcons.o[m
[1mnew file mode 100644[m
[1mindex 0000000..2e4b62b[m
Binary files /dev/null and b/filesys/synchcons.o differ
[1mdiff --git a/filesys/synchdisk.o b/filesys/synchdisk.o[m
[1mindex 8ea875a..7e694d1 100644[m
Binary files a/filesys/synchdisk.o and b/filesys/synchdisk.o differ
[1mdiff --git a/filesys/synchlist.o b/filesys/synchlist.o[m
[1mindex f5a2f29..f15385d 100644[m
Binary files a/filesys/synchlist.o and b/filesys/synchlist.o differ
[1mdiff --git a/filesys/sysdep.o b/filesys/sysdep.o[m
[1mindex 38f8599..c2fc569 100644[m
Binary files a/filesys/sysdep.o and b/filesys/sysdep.o differ
[1mdiff --git a/filesys/system.o b/filesys/system.o[m
[1mindex 4f441ab..e775543 100644[m
Binary files a/filesys/system.o and b/filesys/system.o differ
[1mdiff --git a/filesys/thread.o b/filesys/thread.o[m
[1mindex 6aaf739..76da235 100644[m
Binary files a/filesys/thread.o and b/filesys/thread.o differ
[1mdiff --git a/filesys/threadtest.o b/filesys/threadtest.o[m
[1mindex aa63560..1a4f49f 100644[m
Binary files a/filesys/threadtest.o and b/filesys/threadtest.o differ
[1mdiff --git a/filesys/timer.o b/filesys/timer.o[m
[1mindex 34957c5..6764087 100644[m
Binary files a/filesys/timer.o and b/filesys/timer.o differ
[1mdiff --git a/filesys/translate.o b/filesys/translate.o[m
[1mindex 24a9247..d36f7a5 100644[m
Binary files a/filesys/translate.o and b/filesys/translate.o differ
[1mdiff --git a/network/Makefile b/network/Makefile[m
[1mindex 8ae3bb6..653275c 100644[m
[1m--- a/network/Makefile[m
[1m+++ b/network/Makefile[m
[36m@@ -26,553 +26,708 @@[m [minclude ../Makefile.dep[m
 #-----------------------------------------------------------------[m
 # DO NOT DELETE THIS LINE -- make depend uses it[m
 # DEPENDENCIES MUST END AT END OF FILE[m
[31m-main.o: ../threads/main.cc ../threads/copyright.h ../threads/utility.h \[m
[31m-  ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/system.h ../threads/thread.h \[m
[31m-  ../machine/machine.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[31m-  ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[31m-  ../machine/stats.h ../machine/timer.h ../filesys/synchdisk.h \[m
[31m-  ../threads/synch.h ../network/post.h ../machine/network.h \[m
[31m-  ../threads/synchlist.h[m
[31m-list.o: ../threads/list.cc ../threads/copyright.h ../threads/list.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h[m
[31m-scheduler.o: ../threads/scheduler.cc ../threads/copyright.h \[m
[31m-  ../threads/scheduler.h ../threads/list.h ../threads/utility.h \[m
[31m-  ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/system.h \[m
[31m-  ../machine/interrupt.h ../machine/stats.h ../machine/timer.h \[m
[31m-  ../filesys/synchdisk.h ../threads/synch.h ../network/post.h \[m
[31m-  ../machine/network.h ../threads/synchlist.h[m
[31m-synch.o: ../threads/synch.cc ../threads/copyright.h ../threads/synch.h \[m
[31m-  ../threads/thread.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../machine/machine.h ../machine/translate.h \[m
[31m-  ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[31m-  ../filesys/openfile.h ../threads/list.h ../threads/system.h \[m
[31m-  ../threads/scheduler.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h ../filesys/synchdisk.h ../network/post.h \[m
[31m-  ../machine/network.h ../threads/synchlist.h[m
[31m-synchlist.o: ../threads/synchlist.cc ../threads/copyright.h \[m
[31m-  ../threads/synchlist.h ../threads/list.h ../threads/utility.h \[m
[31m-  ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/synch.h ../threads/thread.h \[m
[31m-  ../machine/machine.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h[m
[31m-system.o: ../threads/system.cc ../threads/copyright.h ../threads/system.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h ../filesys/synchdisk.h ../threads/synch.h \[m
[31m-  ../network/post.h ../machine/network.h ../threads/synchlist.h[m
[31m-thread.o: ../threads/thread.cc ../threads/copyright.h ../threads/thread.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../machine/machine.h ../machine/translate.h \[m
[31m-  ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[31m-  ../filesys/openfile.h ../threads/switch.h ../threads/synch.h \[m
[31m-  ../threads/list.h ../threads/system.h ../threads/scheduler.h \[m
[31m-  ../machine/interrupt.h ../machine/stats.h ../machine/timer.h \[m
[31m-  ../filesys/synchdisk.h ../network/post.h ../machine/network.h \[m
[31m-  ../threads/synchlist.h[m
[31m-utility.o: ../threads/utility.cc ../threads/copyright.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h[m
[31m-threadtest.o: ../threads/threadtest.cc ../threads/copyright.h \[m
[31m-  ../threads/system.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h ../filesys/synchdisk.h ../threads/synch.h \[m
[31m-  ../network/post.h ../machine/network.h ../threads/synchlist.h[m
[31m-interrupt.o: ../machine/interrupt.cc ../threads/copyright.h \[m
[31m-  ../machine/interrupt.h ../threads/list.h ../threads/utility.h \[m
[31m-  ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/system.h ../threads/thread.h \[m
[31m-  ../machine/machine.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[31m-  ../threads/scheduler.h ../machine/stats.h ../machine/timer.h \[m
[31m-  ../filesys/synchdisk.h ../threads/synch.h ../network/post.h \[m
[31m-  ../machine/network.h ../threads/synchlist.h[m
[31m-sysdep.o: ../machine/sysdep.cc ../threads/copyright.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h /usr/include/signal.h /usr/include/bits/sigset.h \[m
[31m-  /usr/include/bits/signum.h /usr/include/time.h \[m
[31m-  /usr/include/bits/siginfo.h /usr/include/bits/sigaction.h \[m
[31m-  /usr/include/bits/sigcontext.h /usr/include/asm/sigcontext.h \[m
[31m-  /usr/include/bits/sigstack.h /usr/include/ucontext.h \[m
[31m-  /usr/include/sys/ucontext.h /usr/include/bits/pthreadtypes.h \[m
[31m-  /usr/include/bits/sched.h /usr/include/bits/sigthread.h \[m
[31m-  /usr/include/sys/types.h /usr/include/endian.h \[m
[31m-  /usr/include/bits/endian.h /usr/include/sys/select.h \[m
[31m-  /usr/include/bits/select.h /usr/include/bits/time.h \[m
[31m-  /usr/include/sys/sysmacros.h /usr/include/sys/time.h \[m
[31m-  /usr/include/sys/socket.h /usr/include/sys/uio.h \[m
[31m-  /usr/include/bits/uio.h /usr/include/bits/socket.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/limits.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/syslimits.h \[m
[31m-  /usr/include/limits.h /usr/include/bits/posix1_lim.h \[m
[31m-  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \[m
[31m-  /usr/include/bits/posix2_lim.h /usr/include/bits/xopen_lim.h \[m
[31m-  /usr/include/bits/sockaddr.h /usr/include/asm/socket.h \[m
[31m-  /usr/include/asm/sockios.h /usr/include/sys/file.h /usr/include/fcntl.h \[m
[31m-  /usr/include/bits/fcntl.h /usr/include/sys/stat.h \[m
[31m-  /usr/include/bits/stat.h /usr/include/sys/un.h /usr/include/sys/mman.h \[m
[31m-  /usr/include/bits/mman.h /usr/include/unistd.h \[m
[31m-  /usr/include/bits/posix_opt.h /usr/include/bits/environments.h \[m
[31m-  /usr/include/bits/confname.h /usr/include/getopt.h /usr/include/errno.h \[m
[31m-  /usr/include/bits/errno.h /usr/include/linux/errno.h \[m
[31m-  /usr/include/asm/errno.h ../machine/interrupt.h ../threads/list.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  ../threads/system.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../machine/stats.h ../machine/timer.h ../filesys/synchdisk.h \[m
[31m-  ../threads/synch.h ../network/post.h ../machine/network.h \[m
[31m-  ../threads/synchlist.h[m
[31m-stats.o: ../machine/stats.cc ../threads/copyright.h ../threads/utility.h \[m
[31m-  ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../machine/stats.h[m
[31m-timer.o: ../machine/timer.cc ../threads/copyright.h ../machine/timer.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/system.h ../threads/thread.h \[m
[31m-  ../machine/machine.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[31m-  ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[31m-  ../machine/stats.h ../filesys/synchdisk.h ../threads/synch.h \[m
[31m-  ../network/post.h ../machine/network.h ../threads/synchlist.h[m
[31m-addrspace.o: ../userprog/addrspace.cc ../threads/copyright.h \[m
[31m-  ../threads/system.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h ../filesys/synchdisk.h ../threads/synch.h \[m
[31m-  ../network/post.h ../machine/network.h ../threads/synchlist.h \[m
[31m-  ../bin/noff.h[m
[31m-bitmap.o: ../userprog/bitmap.cc ../threads/copyright.h \[m
[31m-  ../userprog/bitmap.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../filesys/openfile.h[m
[31m-exception.o: ../userprog/exception.cc ../threads/copyright.h \[m
[31m-  ../threads/system.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h ../filesys/synchdisk.h ../threads/synch.h \[m
[31m-  ../network/post.h ../machine/network.h ../threads/synchlist.h \[m
[31m-  ../userprog/syscall.h[m
[31m-progtest.o: ../userprog/progtest.cc ../threads/copyright.h \[m
[31m-  ../threads/system.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h ../filesys/synchdisk.h ../threads/synch.h \[m
[31m-  ../network/post.h ../machine/network.h ../threads/synchlist.h \[m
[31m-  ../machine/console.h[m
[31m-console.o: ../machine/console.cc ../threads/copyright.h \[m
[31m-  ../machine/console.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/system.h ../threads/thread.h \[m
[31m-  ../machine/machine.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[31m-  ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[31m-  ../machine/stats.h ../machine/timer.h ../filesys/synchdisk.h \[m
[31m-  ../threads/synch.h ../network/post.h ../machine/network.h \[m
[31m-  ../threads/synchlist.h[m
[31m-machine.o: ../machine/machine.cc ../threads/copyright.h \[m
[31m-  ../machine/machine.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../threads/system.h ../threads/thread.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h ../filesys/synchdisk.h ../threads/synch.h \[m
[31m-  ../network/post.h ../machine/network.h ../threads/synchlist.h[m
[31m-mipssim.o: ../machine/mipssim.cc ../threads/copyright.h \[m
[31m-  ../machine/machine.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../machine/mipssim.h ../threads/system.h ../threads/thread.h \[m
[31m-  ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[31m-  ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[31m-  ../machine/stats.h ../machine/timer.h ../filesys/synchdisk.h \[m
[31m-  ../threads/synch.h ../network/post.h ../machine/network.h \[m
[31m-  ../threads/synchlist.h[m
[31m-translate.o: ../machine/translate.cc ../threads/copyright.h \[m
[31m-  ../machine/machine.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[31m-  ../threads/system.h ../threads/thread.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h ../filesys/synchdisk.h ../threads/synch.h \[m
[31m-  ../network/post.h ../machine/network.h ../threads/synchlist.h[m
[31m-directory.o: ../filesys/directory.cc ../threads/copyright.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../filesys/filehdr.h ../machine/disk.h \[m
[31m-  ../userprog/bitmap.h ../filesys/openfile.h ../filesys/directory.h[m
[31m-filehdr.o: ../filesys/filehdr.cc ../threads/copyright.h \[m
[31m-  ../threads/system.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h ../filesys/synchdisk.h ../threads/synch.h \[m
[31m-  ../network/post.h ../machine/network.h ../threads/synchlist.h \[m
[31m-  ../filesys/filehdr.h ../userprog/bitmap.h[m
[31m-filesys.o: ../filesys/filesys.cc ../threads/copyright.h ../machine/disk.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../userprog/bitmap.h ../filesys/openfile.h \[m
[31m-  ../filesys/directory.h ../filesys/filehdr.h ../filesys/filesys.h[m
[31m-fstest.o: ../filesys/fstest.cc ../threads/copyright.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../filesys/filesys.h ../filesys/openfile.h \[m
[31m-  ../threads/system.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[31m-  ../machine/stats.h ../machine/timer.h ../filesys/synchdisk.h \[m
[31m-  ../threads/synch.h ../network/post.h ../machine/network.h \[m
[31m-  ../threads/synchlist.h[m
[31m-openfile.o: ../filesys/openfile.cc ../threads/copyright.h \[m
[31m-  ../filesys/filehdr.h ../machine/disk.h ../threads/utility.h \[m
[31m-  ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../userprog/bitmap.h ../filesys/openfile.h \[m
[31m-  ../threads/system.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[31m-  ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[31m-  ../machine/stats.h ../machine/timer.h ../filesys/synchdisk.h \[m
[31m-  ../threads/synch.h ../network/post.h ../machine/network.h \[m
[31m-  ../threads/synchlist.h[m
[31m-synchdisk.o: ../filesys/synchdisk.cc ../threads/copyright.h \[m
[31m-  ../filesys/synchdisk.h ../machine/disk.h ../threads/utility.h \[m
[31m-  ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/synch.h ../threads/thread.h \[m
[31m-  ../machine/machine.h ../machine/translate.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/list.h[m
[31m-disk.o: ../machine/disk.cc ../threads/copyright.h ../machine/disk.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/system.h ../threads/thread.h \[m
[31m-  ../machine/machine.h ../machine/translate.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h ../filesys/synchdisk.h ../threads/synch.h \[m
[31m-  ../network/post.h ../machine/network.h ../threads/synchlist.h[m
[31m-nettest.o: ../network/nettest.cc ../threads/copyright.h \[m
[31m-  ../threads/system.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h ../filesys/synchdisk.h ../threads/synch.h \[m
[31m-  ../network/post.h ../machine/network.h ../threads/synchlist.h[m
[31m-post.o: ../network/post.cc ../threads/copyright.h ../network/post.h \[m
[31m-  ../machine/network.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/synchlist.h ../threads/list.h \[m
[31m-  ../threads/synch.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h[m
[31m-network.o: ../machine/network.cc ../threads/copyright.h \[m
[31m-  ../threads/system.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h ../filesys/synchdisk.h ../threads/synch.h \[m
[31m-  ../network/post.h ../machine/network.h ../threads/synchlist.h[m
[32m+[m[32mmain.o: ../threads/main.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/utility.h ../threads/bool.h \[m
[32m+[m[32m ../machine/sysdep.h ../threads/copyright.h /usr/include/stdio.h \[m
[32m+[m[32m /usr/include/features.h /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/system.h ../threads/thread.h \[m
[32m+[m[32m ../machine/machine.h ../threads/utility.h ../machine/translate.h \[m
[32m+[m[32m ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../filesys/openfile.h ../threads/scheduler.h ../threads/list.h \[m
[32m+[m[32m ../machine/interrupt.h ../threads/list.h ../machine/stats.h \[m
[32m+[m[32m ../machine/timer.h ../threads/synchcons.h ../machine/console.h \[m
[32m+[m[32m ../filesys/synchdisk.h ../machine/disk.h ../threads/synch.h \[m
[32m+[m[32m ../network/post.h ../machine/network.h ../threads/synchlist.h \[m
[32m+[m[32m ../threads/synch.h[m
[32m+[m[32mlist.o: ../threads/list.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/list.h ../threads/utility.h \[m
[32m+[m[32m ../threads/bool.h ../machine/sysdep.h ../threads/copyright.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h[m
[32m+[m[32mscheduler.o: ../threads/scheduler.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/scheduler.h ../threads/list.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m ../threads/copyright.h /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/system.h ../machine/interrupt.h ../threads/list.h \[m
[32m+[m[32m ../machine/stats.h ../machine/timer.h ../threads/synchcons.h \[m
[32m+[m[32m ../machine/console.h ../filesys/synchdisk.h ../machine/disk.h \[m
[32m+[m[32m ../threads/synch.h ../network/post.h ../machine/network.h \[m
[32m+[m[32m ../threads/synchlist.h ../threads/synch.h[m
[32m+[m[32msynch.o: ../threads/synch.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/synch.h ../threads/thread.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m ../threads/copyright.h /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../machine/machine.h ../threads/utility.h \[m
[32m+[m[32m ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[32m+[m[32m ../filesys/filesys.h ../filesys/openfile.h ../threads/list.h \[m
[32m+[m[32m ../threads/system.h ../threads/scheduler.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../filesys/synchdisk.h \[m
[32m+[m[32m ../machine/disk.h ../threads/synch.h ../network/post.h \[m
[32m+[m[32m ../machine/network.h ../threads/synchlist.h[m
[32m+[m[32msynchlist.o: ../threads/synchlist.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/synchlist.h ../threads/list.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m ../threads/copyright.h /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/synch.h ../threads/thread.h \[m
[32m+[m[32m ../machine/machine.h ../threads/utility.h ../machine/translate.h \[m
[32m+[m[32m ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../filesys/openfile.h[m
[32m+[m[32msystem.o: ../threads/system.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/system.h ../threads/utility.h \[m
[32m+[m[32m ../threads/bool.h ../machine/sysdep.h ../threads/copyright.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../filesys/synchdisk.h \[m
[32m+[m[32m ../machine/disk.h ../threads/synch.h ../network/post.h \[m
[32m+[m[32m ../machine/network.h ../threads/synchlist.h ../threads/synch.h[m
[32m+[m[32mthread.o: ../threads/thread.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/thread.h ../threads/utility.h \[m
[32m+[m[32m ../threads/bool.h ../machine/sysdep.h ../threads/copyright.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../machine/machine.h ../threads/utility.h \[m
[32m+[m[32m ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[32m+[m[32m ../filesys/filesys.h ../filesys/openfile.h ../threads/switch.h \[m
[32m+[m[32m ../threads/synch.h ../threads/list.h ../threads/system.h \[m
[32m+[m[32m ../threads/scheduler.h ../machine/interrupt.h ../threads/list.h \[m
[32m+[m[32m ../machine/stats.h ../machine/timer.h ../threads/synchcons.h \[m
[32m+[m[32m ../machine/console.h ../filesys/synchdisk.h ../machine/disk.h \[m
[32m+[m[32m ../threads/synch.h ../network/post.h ../machine/network.h \[m
[32m+[m[32m ../threads/synchlist.h[m
[32m+[m[32mutility.o: ../threads/utility.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/utility.h ../threads/bool.h \[m
[32m+[m[32m ../machine/sysdep.h ../threads/copyright.h /usr/include/stdio.h \[m
[32m+[m[32m /usr/include/features.h /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/stdarg.h[m
[32m+[m[32mthreadtest.o: ../threads/threadtest.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/system.h ../threads/utility.h \[m
[32m+[m[32m ../threads/bool.h ../machine/sysdep.h ../threads/copyright.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../filesys/synchdisk.h \[m
[32m+[m[32m ../machine/disk.h ../threads/synch.h ../network/post.h \[m
[32m+[m[32m ../machine/network.h ../threads/synchlist.h ../threads/synch.h[m
[32m+[m[32minterrupt.o: ../machine/interrupt.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../machine/interrupt.h ../threads/list.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/utility.h ../threads/bool.h \[m
[32m+[m[32m ../machine/sysdep.h /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/system.h ../threads/thread.h \[m
[32m+[m[32m ../machine/machine.h ../threads/utility.h ../machine/translate.h \[m
[32m+[m[32m ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../filesys/openfile.h ../threads/scheduler.h ../threads/list.h \[m
[32m+[m[32m ../machine/interrupt.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../filesys/synchdisk.h \[m
[32m+[m[32m ../machine/disk.h ../threads/synch.h ../network/post.h \[m
[32m+[m[32m ../machine/network.h ../threads/synchlist.h ../threads/synch.h[m
[32m+[m[32msysdep.o: ../machine/sysdep.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h /usr/include/signal.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sigset.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/signum.h /usr/include/time.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/siginfo.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sigaction.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sigcontext.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sigstack.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/ucontext.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/pthreadtypes.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sigthread.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/types.h /usr/include/endian.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/endian.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/byteswap.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/byteswap-16.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/select.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/select.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/time.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/sysmacros.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/time.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/socket.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/uio.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/uio.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/socket.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/socket_type.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sockaddr.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/asm/socket.h \[m
[32m+[m[32m /usr/include/asm-generic/socket.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/asm/sockios.h \[m
[32m+[m[32m /usr/include/asm-generic/sockios.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/file.h /usr/include/fcntl.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/fcntl.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/fcntl-linux.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stat.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/un.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/mman.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/mman.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/mman-linux.h /usr/include/unistd.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/posix_opt.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/environments.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/confname.h /usr/include/getopt.h \[m
[32m+[m[32m /usr/include/errno.h /usr/include/i386-linux-gnu/bits/errno.h \[m
[32m+[m[32m /usr/include/linux/errno.h /usr/include/i386-linux-gnu/asm/errno.h \[m
[32m+[m[32m /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \[m
[32m+[m[32m ../machine/interrupt.h ../threads/list.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m ../threads/system.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../machine/stats.h ../machine/timer.h ../threads/synchcons.h \[m
[32m+[m[32m ../machine/console.h ../filesys/synchdisk.h ../machine/disk.h \[m
[32m+[m[32m ../threads/synch.h ../network/post.h ../machine/network.h \[m
[32m+[m[32m ../threads/synchlist.h ../threads/synch.h[m
[32m+[m[32mstats.o: ../machine/stats.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/utility.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/bool.h ../machine/sysdep.h /usr/include/stdio.h \[m
[32m+[m[32m /usr/include/features.h /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../machine/stats.h[m
[32m+[m[32mtimer.o: ../machine/timer.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../machine/timer.h ../threads/utility.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/system.h ../threads/utility.h \[m
[32m+[m[32m ../threads/thread.h ../machine/machine.h ../machine/translate.h \[m
[32m+[m[32m ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../filesys/openfile.h ../threads/scheduler.h ../threads/list.h \[m
[32m+[m[32m ../machine/interrupt.h ../threads/list.h ../machine/stats.h \[m
[32m+[m[32m ../machine/timer.h ../threads/synchcons.h ../machine/console.h \[m
[32m+[m[32m ../filesys/synchdisk.h ../machine/disk.h ../threads/synch.h \[m
[32m+[m[32m ../network/post.h ../machine/network.h ../threads/synchlist.h \[m
[32m+[m[32m ../threads/synch.h[m
[32m+[m[32maddrspace.o: ../userprog/addrspace.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/system.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../filesys/synchdisk.h \[m
[32m+[m[32m ../machine/disk.h ../threads/synch.h ../network/post.h \[m
[32m+[m[32m ../machine/network.h ../threads/synchlist.h ../threads/synch.h \[m
[32m+[m[32m ../userprog/addrspace.h ../bin/noff.h[m
[32m+[m[32mbitmap.o: ../userprog/bitmap.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../userprog/bitmap.h ../threads/utility.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../filesys/openfile.h[m
[32m+[m[32mexception.o: ../userprog/exception.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/system.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../filesys/synchdisk.h \[m
[32m+[m[32m ../machine/disk.h ../threads/synch.h ../network/post.h \[m
[32m+[m[32m ../machine/network.h ../threads/synchlist.h ../threads/synch.h \[m
[32m+[m[32m ../userprog/syscall.h[m
[32m+[m[32mprogtest.o: ../userprog/progtest.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/system.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../filesys/synchdisk.h \[m
[32m+[m[32m ../machine/disk.h ../threads/synch.h ../network/post.h \[m
[32m+[m[32m ../machine/network.h ../threads/synchlist.h ../threads/synch.h \[m
[32m+[m[32m ../userprog/addrspace.h[m
[32m+[m[32mconsole.o: ../machine/console.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../machine/console.h ../threads/utility.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/system.h ../threads/utility.h \[m
[32m+[m[32m ../threads/thread.h ../machine/machine.h ../machine/translate.h \[m
[32m+[m[32m ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../filesys/openfile.h ../threads/scheduler.h ../threads/list.h \[m
[32m+[m[32m ../machine/interrupt.h ../threads/list.h ../machine/stats.h \[m
[32m+[m[32m ../machine/timer.h ../threads/synchcons.h ../machine/console.h \[m
[32m+[m[32m ../filesys/synchdisk.h ../machine/disk.h ../threads/synch.h \[m
[32m+[m[32m ../network/post.h ../machine/network.h ../threads/synchlist.h \[m
[32m+[m[32m ../threads/synch.h[m
[32m+[m[32mmachine.o: ../machine/machine.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../machine/machine.h ../threads/utility.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../threads/system.h ../threads/utility.h ../threads/thread.h \[m
[32m+[m[32m ../machine/machine.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../filesys/openfile.h ../threads/scheduler.h ../threads/list.h \[m
[32m+[m[32m ../machine/interrupt.h ../threads/list.h ../machine/stats.h \[m
[32m+[m[32m ../machine/timer.h ../threads/synchcons.h ../machine/console.h \[m
[32m+[m[32m ../filesys/synchdisk.h ../machine/disk.h ../threads/synch.h \[m
[32m+[m[32m ../network/post.h ../machine/network.h ../threads/synchlist.h \[m
[32m+[m[32m ../threads/synch.h[m
[32m+[m[32mmipssim.o: ../machine/mipssim.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../machine/machine.h ../threads/utility.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../machine/mipssim.h ../threads/system.h ../threads/utility.h \[m
[32m+[m[32m ../threads/thread.h ../machine/machine.h ../userprog/addrspace.h \[m
[32m+[m[32m ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[32m+[m[32m ../threads/list.h ../machine/interrupt.h ../threads/list.h \[m
[32m+[m[32m ../machine/stats.h ../machine/timer.h ../threads/synchcons.h \[m
[32m+[m[32m ../machine/console.h ../filesys/synchdisk.h ../machine/disk.h \[m
[32m+[m[32m ../threads/synch.h ../network/post.h ../machine/network.h \[m
[32m+[m[32m ../threads/synchlist.h ../threads/synch.h[m
[32m+[m[32mtranslate.o: ../machine/translate.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../machine/machine.h ../threads/utility.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/system.h ../threads/utility.h ../threads/thread.h \[m
[32m+[m[32m ../machine/machine.h ../threads/scheduler.h ../threads/list.h \[m
[32m+[m[32m ../machine/interrupt.h ../threads/list.h ../machine/stats.h \[m
[32m+[m[32m ../machine/timer.h ../threads/synchcons.h ../machine/console.h \[m
[32m+[m[32m ../filesys/synchdisk.h ../machine/disk.h ../threads/synch.h \[m
[32m+[m[32m ../network/post.h ../machine/network.h ../threads/synchlist.h \[m
[32m+[m[32m ../threads/synch.h[m
[32m+[m[32msynchcons.o: ../threads/synchcons.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/utility.h ../threads/copyright.h ../threads/bool.h \[m
[32m+[m[32m ../machine/sysdep.h /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/synch.h ../threads/thread.h \[m
[32m+[m[32m ../threads/utility.h ../machine/machine.h ../machine/translate.h \[m
[32m+[m[32m ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../filesys/openfile.h ../threads/list.h[m
[32m+[m[32mdirectory.o: ../filesys/directory.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/utility.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/bool.h ../machine/sysdep.h /usr/include/stdio.h \[m
[32m+[m[32m /usr/include/features.h /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../filesys/filehdr.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/bitmap.h ../filesys/openfile.h ../filesys/directory.h \[m
[32m+[m[32m ../filesys/openfile.h[m
[32m+[m[32mfilehdr.o: ../filesys/filehdr.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/system.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../filesys/synchdisk.h \[m
[32m+[m[32m ../machine/disk.h ../threads/synch.h ../network/post.h \[m
[32m+[m[32m ../machine/network.h ../threads/synchlist.h ../threads/synch.h \[m
[32m+[m[32m ../filesys/filehdr.h ../userprog/bitmap.h ../filesys/openfile.h[m
[32m+[m[32mfilesys.o: ../filesys/filesys.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../machine/disk.h ../threads/utility.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../userprog/bitmap.h ../filesys/openfile.h \[m
[32m+[m[32m ../filesys/directory.h ../filesys/openfile.h ../filesys/filehdr.h \[m
[32m+[m[32m ../filesys/filesys.h[m
[32m+[m[32mfstest.o: ../filesys/fstest.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/utility.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/bool.h ../machine/sysdep.h /usr/include/stdio.h \[m
[32m+[m[32m /usr/include/features.h /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/system.h ../threads/utility.h ../threads/thread.h \[m
[32m+[m[32m ../machine/machine.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../threads/scheduler.h \[m
[32m+[m[32m ../threads/list.h ../machine/interrupt.h ../threads/list.h \[m
[32m+[m[32m ../machine/stats.h ../machine/timer.h ../threads/synchcons.h \[m
[32m+[m[32m ../machine/console.h ../filesys/synchdisk.h ../machine/disk.h \[m
[32m+[m[32m ../threads/synch.h ../network/post.h ../machine/network.h \[m
[32m+[m[32m ../threads/synchlist.h ../threads/synch.h ../threads/thread.h[m
[32m+[m[32mopenfile.o: ../filesys/openfile.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../filesys/filehdr.h ../machine/disk.h \[m
[32m+[m[32m ../threads/utility.h ../threads/copyright.h ../threads/bool.h \[m
[32m+[m[32m ../machine/sysdep.h /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../userprog/bitmap.h ../filesys/openfile.h \[m
[32m+[m[32m ../filesys/openfile.h ../threads/system.h ../threads/utility.h \[m
[32m+[m[32m ../threads/thread.h ../machine/machine.h ../machine/translate.h \[m
[32m+[m[32m ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../filesys/synchdisk.h \[m
[32m+[m[32m ../threads/synch.h ../network/post.h ../machine/network.h \[m
[32m+[m[32m ../threads/synchlist.h ../threads/synch.h[m
[32m+[m[32msynchdisk.o: ../filesys/synchdisk.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../filesys/synchdisk.h ../machine/disk.h \[m
[32m+[m[32m ../threads/utility.h ../threads/copyright.h ../threads/bool.h \[m
[32m+[m[32m ../machine/sysdep.h /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/synch.h ../threads/thread.h \[m
[32m+[m[32m ../threads/utility.h ../machine/machine.h ../machine/translate.h \[m
[32m+[m[32m ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../filesys/openfile.h ../threads/list.h[m
[32m+[m[32mdisk.o: ../machine/disk.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../machine/disk.h ../threads/utility.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/system.h ../threads/utility.h \[m
[32m+[m[32m ../threads/thread.h ../machine/machine.h ../machine/translate.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../filesys/synchdisk.h \[m
[32m+[m[32m ../machine/disk.h ../threads/synch.h ../network/post.h \[m
[32m+[m[32m ../machine/network.h ../threads/synchlist.h ../threads/synch.h[m
[32m+[m[32mnettest.o: ../network/nettest.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/system.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../filesys/synchdisk.h \[m
[32m+[m[32m ../machine/disk.h ../threads/synch.h ../network/post.h \[m
[32m+[m[32m ../machine/network.h ../threads/synchlist.h ../threads/synch.h \[m
[32m+[m[32m ../network/post.h[m
[32m+[m[32mpost.o: ../network/post.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../network/post.h ../machine/network.h \[m
[32m+[m[32m ../threads/utility.h ../threads/copyright.h ../threads/bool.h \[m
[32m+[m[32m ../machine/sysdep.h /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/synchlist.h ../threads/list.h \[m
[32m+[m[32m ../threads/utility.h ../threads/synch.h ../threads/thread.h \[m
[32m+[m[32m ../machine/machine.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h[m
[32m+[m[32mnetwork.o: ../machine/network.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/system.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../filesys/synchdisk.h \[m
[32m+[m[32m ../machine/disk.h ../threads/synch.h ../network/post.h \[m
[32m+[m[32m ../machine/network.h ../threads/synchlist.h ../threads/synch.h[m
 # DEPENDENCIES MUST END AT END OF FILE[m
 # IF YOU PUT STUFF HERE IT WILL GO AWAY[m
 # see make depend above[m
[1mdiff --git a/network/addrspace.o b/network/addrspace.o[m
[1mindex a964cbd..3a17774 100644[m
Binary files a/network/addrspace.o and b/network/addrspace.o differ
[1mdiff --git a/network/console.o b/network/console.o[m
[1mindex 95efe87..ceee201 100644[m
Binary files a/network/console.o and b/network/console.o differ
[1mdiff --git a/network/disk.o b/network/disk.o[m
[1mindex 6af981c..cfb76bc 100644[m
Binary files a/network/disk.o and b/network/disk.o differ
[1mdiff --git a/network/exception.o b/network/exception.o[m
[1mindex 6863ac8..b3e3fa1 100644[m
Binary files a/network/exception.o and b/network/exception.o differ
[1mdiff --git a/network/filehdr.o b/network/filehdr.o[m
[1mindex 51d3ffc..fa762c7 100644[m
Binary files a/network/filehdr.o and b/network/filehdr.o differ
[1mdiff --git a/network/fstest.o b/network/fstest.o[m
[1mindex 787d347..ac1d6da 100644[m
Binary files a/network/fstest.o and b/network/fstest.o differ
[1mdiff --git a/network/interrupt.o b/network/interrupt.o[m
[1mindex 62584d3..b7de19d 100644[m
Binary files a/network/interrupt.o and b/network/interrupt.o differ
[1mdiff --git a/network/machine.o b/network/machine.o[m
[1mindex 4c1a056..e27d686 100644[m
Binary files a/network/machine.o and b/network/machine.o differ
[1mdiff --git a/network/main.o b/network/main.o[m
[1mindex ffab1a7..86b0652 100644[m
Binary files a/network/main.o and b/network/main.o differ
[1mdiff --git a/network/mipssim.o b/network/mipssim.o[m
[1mindex c767460..92a5556 100644[m
Binary files a/network/mipssim.o and b/network/mipssim.o differ
[1mdiff --git a/network/nachos b/network/nachos[m
[1mindex 094c451..073d5bf 100644[m
Binary files a/network/nachos and b/network/nachos differ
[1mdiff --git a/network/nettest.o b/network/nettest.o[m
[1mindex 4654cda..8d1f360 100644[m
Binary files a/network/nettest.o and b/network/nettest.o differ
[1mdiff --git a/network/network.o b/network/network.o[m
[1mindex 9d24fed..cdd52ad 100644[m
Binary files a/network/network.o and b/network/network.o differ
[1mdiff --git a/network/openfile.o b/network/openfile.o[m
[1mindex 4f8f87e..59fe9c4 100644[m
Binary files a/network/openfile.o and b/network/openfile.o differ
[1mdiff --git a/network/post.o b/network/post.o[m
[1mindex b30bbbf..9522441 100644[m
Binary files a/network/post.o and b/network/post.o differ
[1mdiff --git a/network/progtest.o b/network/progtest.o[m
[1mindex 0c3ad08..7a73846 100644[m
Binary files a/network/progtest.o and b/network/progtest.o differ
[1mdiff --git a/network/scheduler.o b/network/scheduler.o[m
[1mindex 4322289..b2d6882 100644[m
Binary files a/network/scheduler.o and b/network/scheduler.o differ
[1mdiff --git a/network/synch.o b/network/synch.o[m
[1mindex 523d1fc..b990426 100644[m
Binary files a/network/synch.o and b/network/synch.o differ
[1mdiff --git a/network/synchcons.o b/network/synchcons.o[m
[1mnew file mode 100644[m
[1mindex 0000000..d7c766a[m
Binary files /dev/null and b/network/synchcons.o differ
[1mdiff --git a/network/synchdisk.o b/network/synchdisk.o[m
[1mindex d8e6633..a4ca608 100644[m
Binary files a/network/synchdisk.o and b/network/synchdisk.o differ
[1mdiff --git a/network/synchlist.o b/network/synchlist.o[m
[1mindex 2b586b4..8cfed8d 100644[m
Binary files a/network/synchlist.o and b/network/synchlist.o differ
[1mdiff --git a/network/sysdep.o b/network/sysdep.o[m
[1mindex ba487aa..7c33cbb 100644[m
Binary files a/network/sysdep.o and b/network/sysdep.o differ
[1mdiff --git a/network/system.o b/network/system.o[m
[1mindex 9dc1004..1a0ca51 100644[m
Binary files a/network/system.o and b/network/system.o differ
[1mdiff --git a/network/thread.o b/network/thread.o[m
[1mindex a7acade..e1e7b5f 100644[m
Binary files a/network/thread.o and b/network/thread.o differ
[1mdiff --git a/network/threadtest.o b/network/threadtest.o[m
[1mindex 20af656..44885d0 100644[m
Binary files a/network/threadtest.o and b/network/threadtest.o differ
[1mdiff --git a/network/timer.o b/network/timer.o[m
[1mindex c5677fd..0978bde 100644[m
Binary files a/network/timer.o and b/network/timer.o differ
[1mdiff --git a/network/translate.o b/network/translate.o[m
[1mindex 78f1a45..d8813ef 100644[m
Binary files a/network/translate.o and b/network/translate.o differ
[1mdiff --git a/test/createfile b/test/createfile[m
[1mnew file mode 100644[m
[1mindex 0000000..1c41656[m
Binary files /dev/null and b/test/createfile differ
[1mdiff --git a/test/createfile.c b/test/createfile.c[m
[1mindex fb6d3b3..2503d80 100644[m
[1m--- a/test/createfile.c[m
[1m+++ b/test/createfile.c[m
[36m@@ -1,7 +1,11 @@[m
 #include "syscall.h"[m
[31m-[m
[32m+[m[32m#include "copyright.h"[m
 [m
 int main()[m
 {[m
[31m-    CreateFile("Test.txt");[m
[32m+[m[32m    CreateAAA("Test1.txt");[m
[32m+[m[32m    CreateAAA("Test2.txt");[m
[32m+[m[32m    CreateAAA("Test3.txt");[m
[32m+[m[32m    CreateAAA("Test4.txt");[m
[32m+[m[32m    CreateAAA("Test5.txt");[m
 }[m
\ No newline at end of file[m
[1mdiff --git a/test/createfile.coff b/test/createfile.coff[m
[1mnew file mode 100644[m
[1mindex 0000000..10c9fb1[m
Binary files /dev/null and b/test/createfile.coff differ
[1mdiff --git a/test/createfile.o b/test/createfile.o[m
[1mnew file mode 100644[m
[1mindex 0000000..9bfc254[m
Binary files /dev/null and b/test/createfile.o differ
[1mdiff --git a/test/halt b/test/halt[m
[1mindex 5ef8b82..3846e45 100644[m
Binary files a/test/halt and b/test/halt differ
[1mdiff --git a/test/halt.coff b/test/halt.coff[m
[1mindex e626c56..4f96916 100644[m
Binary files a/test/halt.coff and b/test/halt.coff differ
[1mdiff --git a/test/matmult b/test/matmult[m
[1mindex af275ee..eba2648 100644[m
Binary files a/test/matmult and b/test/matmult differ
[1mdiff --git a/test/matmult.coff b/test/matmult.coff[m
[1mindex 3631b17..bb39cd6 100644[m
Binary files a/test/matmult.coff and b/test/matmult.coff differ
[1mdiff --git a/test/shell b/test/shell[m
[1mindex 1b06dfc..1807242 100644[m
Binary files a/test/shell and b/test/shell differ
[1mdiff --git a/test/shell.coff b/test/shell.coff[m
[1mindex b6c9b26..4b061da 100644[m
Binary files a/test/shell.coff and b/test/shell.coff differ
[1mdiff --git a/test/sort b/test/sort[m
[1mindex 5619d84..dd06f69 100644[m
Binary files a/test/sort and b/test/sort differ
[1mdiff --git a/test/sort.coff b/test/sort.coff[m
[1mindex 2a18f95..e09f0b7 100644[m
Binary files a/test/sort.coff and b/test/sort.coff differ
[1mdiff --git a/test/start.c b/test/start.c[m
[1mindex 71c883e..1a3dccd 100644[m
[1m--- a/test/start.c[m
[1m+++ b/test/start.c[m
[36m@@ -74,13 +74,13 @@[m [mJoin:[m
 	j	$31[m
 	.end Join[m
 [m
[31m-	.globl Create[m
[31m-	.ent	Create[m
[31m-Create:[m
[32m+[m	[32m.globl CreateAAA[m
[32m+[m	[32m.ent	CreateAAA[m
[32m+[m	[32mCreateAAA:[m
 	addiu $2,$0,SC_Create[m
 	syscall[m
 	j	$31[m
[31m-	.end Create[m
[32m+[m	[32m.end CreateAAA[m
 [m
 	.globl Open[m
 	.ent	Open[m
[1mdiff --git a/test/start.o b/test/start.o[m
[1mindex 40e10cf..34b82f4 100644[m
Binary files a/test/start.o and b/test/start.o differ
[1mdiff --git a/test/start.s b/test/start.s[m
[1mindex 71c883e..b68c615 100644[m
[1m--- a/test/start.s[m
[1m+++ b/test/start.s[m
[36m@@ -74,13 +74,13 @@[m [mJoin:[m
 	j	$31[m
 	.end Join[m
 [m
[31m-	.globl Create[m
[31m-	.ent	Create[m
[31m-Create:[m
[32m+[m	[32m.globl CreateAAA[m
[32m+[m	[32m.ent	CreateAAA[m
[32m+[m[32mCreateAAA:[m
 	addiu $2,$0,SC_Create[m
 	syscall[m
 	j	$31[m
[31m-	.end Create[m
[32m+[m	[32m.end CreateAAA[m
 [m
 	.globl Open[m
 	.ent	Open[m
[1mdiff --git a/threads/console.o b/threads/console.o[m
[1mindex 9c3e2b0..322d053 100644[m
Binary files a/threads/console.o and b/threads/console.o differ
[1mdiff --git a/threads/exception.o b/threads/exception.o[m
[1mindex 5b20d4a..16bdb77 100644[m
Binary files a/threads/exception.o and b/threads/exception.o differ
[1mdiff --git a/threads/machine.o b/threads/machine.o[m
[1mindex f2cf6f9..64cfaf9 100644[m
Binary files a/threads/machine.o and b/threads/machine.o differ
[1mdiff --git a/threads/mipssim.o b/threads/mipssim.o[m
[1mindex 3429bf2..621ac4e 100644[m
Binary files a/threads/mipssim.o and b/threads/mipssim.o differ
[1mdiff --git a/threads/nachos b/threads/nachos[m
[1mindex 9736d83..9c526a1 100644[m
Binary files a/threads/nachos and b/threads/nachos differ
[1mdiff --git a/threads/progtest.o b/threads/progtest.o[m
[1mindex ad91f0c..3264ad5 100644[m
Binary files a/threads/progtest.o and b/threads/progtest.o differ
[1mdiff --git a/threads/synchcons.o b/threads/synchcons.o[m
[1mnew file mode 100644[m
[1mindex 0000000..c757cd1[m
Binary files /dev/null and b/threads/synchcons.o differ
[1mdiff --git a/threads/translate.o b/threads/translate.o[m
[1mindex 3e66485..3c3454f 100644[m
Binary files a/threads/translate.o and b/threads/translate.o differ
[1mdiff --git a/userprog/Makefile b/userprog/Makefile[m
[1mindex c497beb..e6a7deb 100644[m
[1m--- a/userprog/Makefile[m
[1m+++ b/userprog/Makefile[m
[36m@@ -27,361 +27,466 @@[m [minclude ../Makefile.dep[m
 #-----------------------------------------------------------------[m
 # DO NOT DELETE THIS LINE -- make depend uses it[m
 # DEPENDENCIES MUST END AT END OF FILE[m
[31m-main.o: ../threads/main.cc ../threads/copyright.h ../threads/utility.h \[m
[31m-  ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/system.h ../threads/thread.h \[m
[31m-  ../machine/machine.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[31m-  ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[31m-  ../machine/stats.h ../machine/timer.h[m
[31m-list.o: ../threads/list.cc ../threads/copyright.h ../threads/list.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h[m
[31m-scheduler.o: ../threads/scheduler.cc ../threads/copyright.h \[m
[31m-  ../threads/scheduler.h ../threads/list.h ../threads/utility.h \[m
[31m-  ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/system.h \[m
[31m-  ../machine/interrupt.h ../machine/stats.h ../machine/timer.h[m
[31m-synch.o: ../threads/synch.cc ../threads/copyright.h ../threads/synch.h \[m
[31m-  ../threads/thread.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../machine/machine.h ../machine/translate.h \[m
[31m-  ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[31m-  ../filesys/openfile.h ../threads/list.h ../threads/system.h \[m
[31m-  ../threads/scheduler.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h[m
[31m-synchlist.o: ../threads/synchlist.cc ../threads/copyright.h \[m
[31m-  ../threads/synchlist.h ../threads/list.h ../threads/utility.h \[m
[31m-  ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/synch.h ../threads/thread.h \[m
[31m-  ../machine/machine.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h[m
[31m-system.o: ../threads/system.cc ../threads/copyright.h ../threads/system.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h[m
[31m-thread.o: ../threads/thread.cc ../threads/copyright.h ../threads/thread.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../machine/machine.h ../machine/translate.h \[m
[31m-  ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[31m-  ../filesys/openfile.h ../threads/switch.h ../threads/synch.h \[m
[31m-  ../threads/list.h ../threads/system.h ../threads/scheduler.h \[m
[31m-  ../machine/interrupt.h ../machine/stats.h ../machine/timer.h[m
[31m-utility.o: ../threads/utility.cc ../threads/copyright.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h[m
[31m-threadtest.o: ../threads/threadtest.cc ../threads/copyright.h \[m
[31m-  ../threads/system.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h[m
[31m-interrupt.o: ../machine/interrupt.cc ../threads/copyright.h \[m
[31m-  ../machine/interrupt.h ../threads/list.h ../threads/utility.h \[m
[31m-  ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/system.h ../threads/thread.h \[m
[31m-  ../machine/machine.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[31m-  ../threads/scheduler.h ../machine/stats.h ../machine/timer.h[m
[31m-sysdep.o: ../machine/sysdep.cc ../threads/copyright.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h /usr/include/signal.h /usr/include/bits/sigset.h \[m
[31m-  /usr/include/bits/signum.h /usr/include/time.h \[m
[31m-  /usr/include/bits/siginfo.h /usr/include/bits/sigaction.h \[m
[31m-  /usr/include/bits/sigcontext.h /usr/include/asm/sigcontext.h \[m
[31m-  /usr/include/bits/sigstack.h /usr/include/ucontext.h \[m
[31m-  /usr/include/sys/ucontext.h /usr/include/bits/pthreadtypes.h \[m
[31m-  /usr/include/bits/sched.h /usr/include/bits/sigthread.h \[m
[31m-  /usr/include/sys/types.h /usr/include/endian.h \[m
[31m-  /usr/include/bits/endian.h /usr/include/sys/select.h \[m
[31m-  /usr/include/bits/select.h /usr/include/bits/time.h \[m
[31m-  /usr/include/sys/sysmacros.h /usr/include/sys/time.h \[m
[31m-  /usr/include/sys/socket.h /usr/include/sys/uio.h \[m
[31m-  /usr/include/bits/uio.h /usr/include/bits/socket.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/limits.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/syslimits.h \[m
[31m-  /usr/include/limits.h /usr/include/bits/posix1_lim.h \[m
[31m-  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \[m
[31m-  /usr/include/bits/posix2_lim.h /usr/include/bits/xopen_lim.h \[m
[31m-  /usr/include/bits/sockaddr.h /usr/include/asm/socket.h \[m
[31m-  /usr/include/asm/sockios.h /usr/include/sys/file.h /usr/include/fcntl.h \[m
[31m-  /usr/include/bits/fcntl.h /usr/include/sys/stat.h \[m
[31m-  /usr/include/bits/stat.h /usr/include/sys/un.h /usr/include/sys/mman.h \[m
[31m-  /usr/include/bits/mman.h /usr/include/unistd.h \[m
[31m-  /usr/include/bits/posix_opt.h /usr/include/bits/environments.h \[m
[31m-  /usr/include/bits/confname.h /usr/include/getopt.h /usr/include/errno.h \[m
[31m-  /usr/include/bits/errno.h /usr/include/linux/errno.h \[m
[31m-  /usr/include/asm/errno.h ../machine/interrupt.h ../threads/list.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  ../threads/system.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../machine/stats.h ../machine/timer.h[m
[31m-stats.o: ../machine/stats.cc ../threads/copyright.h ../threads/utility.h \[m
[31m-  ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../machine/stats.h[m
[31m-timer.o: ../machine/timer.cc ../threads/copyright.h ../machine/timer.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/system.h ../threads/thread.h \[m
[31m-  ../machine/machine.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[31m-  ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[31m-  ../machine/stats.h[m
[31m-addrspace.o: ../userprog/addrspace.cc ../threads/copyright.h \[m
[31m-  ../threads/system.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h ../bin/noff.h[m
[31m-bitmap.o: ../userprog/bitmap.cc ../threads/copyright.h \[m
[31m-  ../userprog/bitmap.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../filesys/openfile.h[m
[31m-exception.o: ../userprog/exception.cc ../threads/copyright.h \[m
[31m-  ../threads/system.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h ../userprog/syscall.h[m
[31m-progtest.o: ../userprog/progtest.cc ../threads/copyright.h \[m
[31m-  ../threads/system.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h ../machine/console.h ../threads/synch.h[m
[31m-console.o: ../machine/console.cc ../threads/copyright.h \[m
[31m-  ../machine/console.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/system.h ../threads/thread.h \[m
[31m-  ../machine/machine.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[31m-  ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[31m-  ../machine/stats.h ../machine/timer.h[m
[31m-machine.o: ../machine/machine.cc ../threads/copyright.h \[m
[31m-  ../machine/machine.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../threads/system.h ../threads/thread.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h[m
[31m-mipssim.o: ../machine/mipssim.cc ../threads/copyright.h \[m
[31m-  ../machine/machine.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../machine/mipssim.h ../threads/system.h ../threads/thread.h \[m
[31m-  ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[31m-  ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[31m-  ../machine/stats.h ../machine/timer.h[m
[31m-translate.o: ../machine/translate.cc ../threads/copyright.h \[m
[31m-  ../machine/machine.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[31m-  ../threads/system.h ../threads/thread.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h[m
[32m+[m[32mmain.o: ../threads/main.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/utility.h ../threads/bool.h \[m
[32m+[m[32m ../machine/sysdep.h ../threads/copyright.h /usr/include/stdio.h \[m
[32m+[m[32m /usr/include/features.h /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/system.h ../threads/thread.h \[m
[32m+[m[32m ../machine/machine.h ../threads/utility.h ../machine/translate.h \[m
[32m+[m[32m ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../filesys/openfile.h ../threads/scheduler.h ../threads/list.h \[m
[32m+[m[32m ../machine/interrupt.h ../threads/list.h ../machine/stats.h \[m
[32m+[m[32m ../machine/timer.h ../threads/synchcons.h ../machine/console.h[m
[32m+[m[32mlist.o: ../threads/list.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/list.h ../threads/utility.h \[m
[32m+[m[32m ../threads/bool.h ../machine/sysdep.h ../threads/copyright.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h[m
[32m+[m[32mscheduler.o: ../threads/scheduler.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/scheduler.h ../threads/list.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m ../threads/copyright.h /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/system.h ../machine/interrupt.h ../threads/list.h \[m
[32m+[m[32m ../machine/stats.h ../machine/timer.h ../threads/synchcons.h \[m
[32m+[m[32m ../machine/console.h[m
[32m+[m[32msynch.o: ../threads/synch.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/synch.h ../threads/thread.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m ../threads/copyright.h /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../machine/machine.h ../threads/utility.h \[m
[32m+[m[32m ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[32m+[m[32m ../filesys/filesys.h ../filesys/openfile.h ../threads/list.h \[m
[32m+[m[32m ../threads/system.h ../threads/scheduler.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h[m
[32m+[m[32msynchlist.o: ../threads/synchlist.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/synchlist.h ../threads/list.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m ../threads/copyright.h /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/synch.h ../threads/thread.h \[m
[32m+[m[32m ../machine/machine.h ../threads/utility.h ../machine/translate.h \[m
[32m+[m[32m ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../filesys/openfile.h[m
[32m+[m[32msystem.o: ../threads/system.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/system.h ../threads/utility.h \[m
[32m+[m[32m ../threads/bool.h ../machine/sysdep.h ../threads/copyright.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h[m
[32m+[m[32mthread.o: ../threads/thread.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/thread.h ../threads/utility.h \[m
[32m+[m[32m ../threads/bool.h ../machine/sysdep.h ../threads/copyright.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../machine/machine.h ../threads/utility.h \[m
[32m+[m[32m ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[32m+[m[32m ../filesys/filesys.h ../filesys/openfile.h ../threads/switch.h \[m
[32m+[m[32m ../threads/synch.h ../threads/list.h ../threads/system.h \[m
[32m+[m[32m ../threads/scheduler.h ../machine/interrupt.h ../threads/list.h \[m
[32m+[m[32m ../machine/stats.h ../machine/timer.h ../threads/synchcons.h \[m
[32m+[m[32m ../machine/console.h[m
[32m+[m[32mutility.o: ../threads/utility.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/utility.h ../threads/bool.h \[m
[32m+[m[32m ../machine/sysdep.h ../threads/copyright.h /usr/include/stdio.h \[m
[32m+[m[32m /usr/include/features.h /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/stdarg.h[m
[32m+[m[32mthreadtest.o: ../threads/threadtest.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/system.h ../threads/utility.h \[m
[32m+[m[32m ../threads/bool.h ../machine/sysdep.h ../threads/copyright.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h[m
[32m+[m[32minterrupt.o: ../machine/interrupt.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../machine/interrupt.h ../threads/list.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/utility.h ../threads/bool.h \[m
[32m+[m[32m ../machine/sysdep.h /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/system.h ../threads/thread.h \[m
[32m+[m[32m ../machine/machine.h ../threads/utility.h ../machine/translate.h \[m
[32m+[m[32m ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../filesys/openfile.h ../threads/scheduler.h ../threads/list.h \[m
[32m+[m[32m ../machine/interrupt.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h[m
[32m+[m[32msysdep.o: ../machine/sysdep.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h /usr/include/signal.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sigset.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/signum.h /usr/include/time.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/siginfo.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sigaction.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sigcontext.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sigstack.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/ucontext.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/pthreadtypes.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sigthread.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/types.h /usr/include/endian.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/endian.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/byteswap.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/byteswap-16.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/select.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/select.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/time.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/sysmacros.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/time.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/socket.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/uio.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/uio.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/socket.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/socket_type.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sockaddr.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/asm/socket.h \[m
[32m+[m[32m /usr/include/asm-generic/socket.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/asm/sockios.h \[m
[32m+[m[32m /usr/include/asm-generic/sockios.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/file.h /usr/include/fcntl.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/fcntl.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/fcntl-linux.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stat.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/un.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/mman.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/mman.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/mman-linux.h /usr/include/unistd.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/posix_opt.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/environments.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/confname.h /usr/include/getopt.h \[m
[32m+[m[32m /usr/include/errno.h /usr/include/i386-linux-gnu/bits/errno.h \[m
[32m+[m[32m /usr/include/linux/errno.h /usr/include/i386-linux-gnu/asm/errno.h \[m
[32m+[m[32m /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \[m
[32m+[m[32m ../machine/interrupt.h ../threads/list.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m ../threads/system.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../machine/stats.h ../machine/timer.h ../threads/synchcons.h \[m
[32m+[m[32m ../machine/console.h[m
[32m+[m[32mstats.o: ../machine/stats.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/utility.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/bool.h ../machine/sysdep.h /usr/include/stdio.h \[m
[32m+[m[32m /usr/include/features.h /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../machine/stats.h[m
[32m+[m[32mtimer.o: ../machine/timer.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../machine/timer.h ../threads/utility.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/system.h ../threads/utility.h \[m
[32m+[m[32m ../threads/thread.h ../machine/machine.h ../machine/translate.h \[m
[32m+[m[32m ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../filesys/openfile.h ../threads/scheduler.h ../threads/list.h \[m
[32m+[m[32m ../machine/interrupt.h ../threads/list.h ../machine/stats.h \[m
[32m+[m[32m ../machine/timer.h ../threads/synchcons.h ../machine/console.h[m
[32m+[m[32maddrspace.o: ../userprog/addrspace.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/system.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../userprog/addrspace.h \[m
[32m+[m[32m ../bin/noff.h[m
[32m+[m[32mbitmap.o: ../userprog/bitmap.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../userprog/bitmap.h ../threads/utility.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../filesys/openfile.h[m
[32m+[m[32mexception.o: ../userprog/exception.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/system.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../userprog/syscall.h[m
[32m+[m[32mprogtest.o: ../userprog/progtest.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/system.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../userprog/addrspace.h \[m
[32m+[m[32m ../threads/synch.h[m
[32m+[m[32mconsole.o: ../machine/console.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../machine/console.h ../threads/utility.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/system.h ../threads/utility.h \[m
[32m+[m[32m ../threads/thread.h ../machine/machine.h ../machine/translate.h \[m
[32m+[m[32m ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../filesys/openfile.h ../threads/scheduler.h ../threads/list.h \[m
[32m+[m[32m ../machine/interrupt.h ../threads/list.h ../machine/stats.h \[m
[32m+[m[32m ../machine/timer.h ../threads/synchcons.h ../machine/console.h[m
[32m+[m[32mmachine.o: ../machine/machine.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../machine/machine.h ../threads/utility.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../threads/system.h ../threads/utility.h ../threads/thread.h \[m
[32m+[m[32m ../machine/machine.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../filesys/openfile.h ../threads/scheduler.h ../threads/list.h \[m
[32m+[m[32m ../machine/interrupt.h ../threads/list.h ../machine/stats.h \[m
[32m+[m[32m ../machine/timer.h ../threads/synchcons.h ../machine/console.h[m
[32m+[m[32mmipssim.o: ../machine/mipssim.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../machine/machine.h ../threads/utility.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../machine/mipssim.h ../threads/system.h ../threads/utility.h \[m
[32m+[m[32m ../threads/thread.h ../machine/machine.h ../userprog/addrspace.h \[m
[32m+[m[32m ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[32m+[m[32m ../threads/list.h ../machine/interrupt.h ../threads/list.h \[m
[32m+[m[32m ../machine/stats.h ../machine/timer.h ../threads/synchcons.h \[m
[32m+[m[32m ../machine/console.h[m
[32m+[m[32mtranslate.o: ../machine/translate.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../machine/machine.h ../threads/utility.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/system.h ../threads/utility.h ../threads/thread.h \[m
[32m+[m[32m ../machine/machine.h ../threads/scheduler.h ../threads/list.h \[m
[32m+[m[32m ../machine/interrupt.h ../threads/list.h ../machine/stats.h \[m
[32m+[m[32m ../machine/timer.h ../threads/synchcons.h ../machine/console.h[m
[32m+[m[32msynchcons.o: ../threads/synchcons.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/utility.h ../threads/copyright.h ../threads/bool.h \[m
[32m+[m[32m ../machine/sysdep.h /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/synch.h ../threads/thread.h \[m
[32m+[m[32m ../threads/utility.h ../machine/machine.h ../machine/translate.h \[m
[32m+[m[32m ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../filesys/openfile.h ../threads/list.h[m
 # DEPENDENCIES MUST END AT END OF FILE[m
 # IF YOU PUT STUFF HERE IT WILL GO AWAY[m
 # see make depend above[m
[1mdiff --git a/userprog/addrspace.o b/userprog/addrspace.o[m
[1mindex 9a00fdb..e089d08 100644[m
Binary files a/userprog/addrspace.o and b/userprog/addrspace.o differ
[1mdiff --git a/userprog/console.o b/userprog/console.o[m
[1mindex ace2aba..a720926 100644[m
Binary files a/userprog/console.o and b/userprog/console.o differ
[1mdiff --git a/userprog/exception.cc b/userprog/exception.cc[m
[1mindex 30134a7..b6c1dbf 100644[m
[1m--- a/userprog/exception.cc[m
[1m+++ b/userprog/exception.cc[m
[36m@@ -53,6 +53,7 @@[m [mExceptionHandler(ExceptionType which)[m
 {[m
     int type = machine->ReadRegister(2);[m
     //-----------------------------NEW CODE------------------------------------[m
[32m+[m[32m    printf("Call to ExceptionHandler() %d %d\n", which, type);[m
     switch(which)[m
     {[m
         case NoException:[m
[36m@@ -92,24 +93,24 @@[m [mExceptionHandler(ExceptionType which)[m
                 case SC_Create:[m
                     int virtAddr;[m
                     char* filename;[m
[31m-                    DEBUG(‘a’,"\n SC_Create call ...");[m
[31m-                    DEBUG(‘a’,"\n Reading virtual address of filename");[m
[32m+[m[32m                    DEBUG('a',"\n SC_Create call ...");[m
[32m+[m[32m                    DEBUG('a',"\n Reading virtual address of filename");[m
                     // Lấy tham số tên tập tin từ thanh ghi r4[m
                     virtAddr = machine->ReadRegister(4);[m
[31m-                    DEBUG (‘a’,"\n Reading filename.");[m
[31m-                    // MaxFileLength là = 32[m
[32m+[m[32m                    DEBUG ('a',"\n Reading filename.");[m
[32m+[m[32m                    int  MaxFileLength = 32;[m
                     filename = machine->User2System(virtAddr,MaxFileLength+1);[m
                     if (filename == NULL)[m
                     {[m
                         printf("\n Not enough memory in system");[m
[31m-                        DEBUG(‘a’,"\n Not enough memory in system");[m
[32m+[m[32m                        DEBUG('a',"\n Not enough memory in system");[m
                         machine->WriteRegister(2,-1); // trả về lỗi cho chương[m
                         // trình người dùng[m
                         delete filename;[m
                         return;[m
                     }[m
[31m-                    DEBUG(‘a’,"\n Finish reading filename.");[m
[31m-                    //DEBUG(‘a’,"\n File name : '"<<filename<<"'");[m
[32m+[m[32m                    DEBUG('a',"\n Finish reading filename.");[m
[32m+[m[32m                    //DEBUG('a',"\n File name : '"<<filename<<"'");[m
                     // Create file with size = 0[m
                     // Dùng đối tượng fileSystem của lớp OpenFile để tạo file,[m
                     // việc tạo file này là sử dụng các thủ tục tạo file của hệ điều[m
[36m@@ -128,6 +129,12 @@[m [mExceptionHandler(ExceptionType which)[m
                     delete filename;[m
                     break;[m
             }[m
[32m+[m[32m            //int aaa = machine->registers[NextPCReg]+4;[m
[32m+[m[32m            machine->registers[PrevPCReg] = machine->registers[PCReg];	// for debugging, in case we[m
[32m+[m[32m            // are jumping into lala-land[m
[32m+[m[32m            machine->registers[PCReg] = machine->registers[NextPCReg];[m
[32m+[m[32m            machine->registers[NextPCReg] = machine->registers[PCReg]+4;[m
[32m+[m[32m            break;[m
         default:[m
         printf("Unexpected user mode exception %d %d\n", which, type);[m
         interrupt->Halt();[m
[1mdiff --git a/userprog/exception.o b/userprog/exception.o[m
[1mindex df6c469..4618db4 100644[m
Binary files a/userprog/exception.o and b/userprog/exception.o differ
[1mdiff --git a/userprog/interrupt.o b/userprog/interrupt.o[m
[1mindex 07bf5af..75642c1 100644[m
Binary files a/userprog/interrupt.o and b/userprog/interrupt.o differ
[1mdiff --git a/userprog/machine.o b/userprog/machine.o[m
[1mindex a242db3..2f08bd3 100644[m
Binary files a/userprog/machine.o and b/userprog/machine.o differ
[1mdiff --git a/userprog/main.o b/userprog/main.o[m
[1mindex 5d65e33..d5cb440 100644[m
Binary files a/userprog/main.o and b/userprog/main.o differ
[1mdiff --git a/userprog/mipssim.o b/userprog/mipssim.o[m
[1mindex 0ffecca..ff4ae01 100644[m
Binary files a/userprog/mipssim.o and b/userprog/mipssim.o differ
[1mdiff --git a/userprog/nachos b/userprog/nachos[m
[1mindex ba6936b..68d1d67 100644[m
Binary files a/userprog/nachos and b/userprog/nachos differ
[1mdiff --git a/userprog/progtest.o b/userprog/progtest.o[m
[1mindex c15db55..b56f516 100644[m
Binary files a/userprog/progtest.o and b/userprog/progtest.o differ
[1mdiff --git a/userprog/scheduler.o b/userprog/scheduler.o[m
[1mindex 490c594..73b28cd 100644[m
Binary files a/userprog/scheduler.o and b/userprog/scheduler.o differ
[1mdiff --git a/userprog/synch.o b/userprog/synch.o[m
[1mindex 418e83e..4405ad3 100644[m
Binary files a/userprog/synch.o and b/userprog/synch.o differ
[1mdiff --git a/userprog/synchcons.o b/userprog/synchcons.o[m
[1mnew file mode 100644[m
[1mindex 0000000..3fc3f3f[m
Binary files /dev/null and b/userprog/synchcons.o differ
[1mdiff --git a/userprog/synchlist.o b/userprog/synchlist.o[m
[1mindex 67b3d81..9d70191 100644[m
Binary files a/userprog/synchlist.o and b/userprog/synchlist.o differ
[1mdiff --git a/userprog/syscall.h b/userprog/syscall.h[m
[1mindex 2579417..f7ec0bb 100644[m
[1m--- a/userprog/syscall.h[m
[1m+++ b/userprog/syscall.h[m
[36m@@ -87,7 +87,7 @@[m [mtypedef int OpenFileId;[m
 #define ConsoleOutput	1  [m
  [m
 /* Create a Nachos file, with "name" */[m
[31m-int CreateFile(char *name);[m
[32m+[m[32mint CreateAAA(char *name);[m
 [m
 /* Open the Nachos file "name", and return an "OpenFileId" that can [m
  * be used to read and write to the file.[m
[1mdiff --git a/userprog/sysdep.o b/userprog/sysdep.o[m
[1mindex af369bd..45494b2 100644[m
Binary files a/userprog/sysdep.o and b/userprog/sysdep.o differ
[1mdiff --git a/userprog/system.o b/userprog/system.o[m
[1mindex 2695c07..cd9b3c8 100644[m
Binary files a/userprog/system.o and b/userprog/system.o differ
[1mdiff --git a/userprog/thread.o b/userprog/thread.o[m
[1mindex ea0744f..8f8961d 100644[m
Binary files a/userprog/thread.o and b/userprog/thread.o differ
[1mdiff --git a/userprog/threadtest.o b/userprog/threadtest.o[m
[1mindex 2c2d7c9..8c871eb 100644[m
Binary files a/userprog/threadtest.o and b/userprog/threadtest.o differ
[1mdiff --git a/userprog/timer.o b/userprog/timer.o[m
[1mindex 3d1761d..df766fa 100644[m
Binary files a/userprog/timer.o and b/userprog/timer.o differ
[1mdiff --git a/userprog/translate.o b/userprog/translate.o[m
[1mindex f0f56d7..cd22265 100644[m
Binary files a/userprog/translate.o and b/userprog/translate.o differ
[1mdiff --git a/vm/Makefile b/vm/Makefile[m
[1mindex aca9f31..0d92675 100644[m
[1m--- a/vm/Makefile[m
[1m+++ b/vm/Makefile[m
[36m@@ -30,361 +30,466 @@[m [minclude ../Makefile.dep[m
 #-----------------------------------------------------------------[m
 # DO NOT DELETE THIS LINE -- make depend uses it[m
 # DEPENDENCIES MUST END AT END OF FILE[m
[31m-main.o: ../threads/main.cc ../threads/copyright.h ../threads/utility.h \[m
[31m-  ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/system.h ../threads/thread.h \[m
[31m-  ../machine/machine.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[31m-  ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[31m-  ../machine/stats.h ../machine/timer.h[m
[31m-list.o: ../threads/list.cc ../threads/copyright.h ../threads/list.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h[m
[31m-scheduler.o: ../threads/scheduler.cc ../threads/copyright.h \[m
[31m-  ../threads/scheduler.h ../threads/list.h ../threads/utility.h \[m
[31m-  ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/system.h \[m
[31m-  ../machine/interrupt.h ../machine/stats.h ../machine/timer.h[m
[31m-synch.o: ../threads/synch.cc ../threads/copyright.h ../threads/synch.h \[m
[31m-  ../threads/thread.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../machine/machine.h ../machine/translate.h \[m
[31m-  ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[31m-  ../filesys/openfile.h ../threads/list.h ../threads/system.h \[m
[31m-  ../threads/scheduler.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h[m
[31m-synchlist.o: ../threads/synchlist.cc ../threads/copyright.h \[m
[31m-  ../threads/synchlist.h ../threads/list.h ../threads/utility.h \[m
[31m-  ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/synch.h ../threads/thread.h \[m
[31m-  ../machine/machine.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h[m
[31m-system.o: ../threads/system.cc ../threads/copyright.h ../threads/system.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h[m
[31m-thread.o: ../threads/thread.cc ../threads/copyright.h ../threads/thread.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../machine/machine.h ../machine/translate.h \[m
[31m-  ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[31m-  ../filesys/openfile.h ../threads/switch.h ../threads/synch.h \[m
[31m-  ../threads/list.h ../threads/system.h ../threads/scheduler.h \[m
[31m-  ../machine/interrupt.h ../machine/stats.h ../machine/timer.h[m
[31m-utility.o: ../threads/utility.cc ../threads/copyright.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h[m
[31m-threadtest.o: ../threads/threadtest.cc ../threads/copyright.h \[m
[31m-  ../threads/system.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h[m
[31m-interrupt.o: ../machine/interrupt.cc ../threads/copyright.h \[m
[31m-  ../machine/interrupt.h ../threads/list.h ../threads/utility.h \[m
[31m-  ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/system.h ../threads/thread.h \[m
[31m-  ../machine/machine.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[31m-  ../threads/scheduler.h ../machine/stats.h ../machine/timer.h[m
[31m-sysdep.o: ../machine/sysdep.cc ../threads/copyright.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h /usr/include/signal.h /usr/include/bits/sigset.h \[m
[31m-  /usr/include/bits/signum.h /usr/include/time.h \[m
[31m-  /usr/include/bits/siginfo.h /usr/include/bits/sigaction.h \[m
[31m-  /usr/include/bits/sigcontext.h /usr/include/asm/sigcontext.h \[m
[31m-  /usr/include/bits/sigstack.h /usr/include/ucontext.h \[m
[31m-  /usr/include/sys/ucontext.h /usr/include/bits/pthreadtypes.h \[m
[31m-  /usr/include/bits/sched.h /usr/include/bits/sigthread.h \[m
[31m-  /usr/include/sys/types.h /usr/include/endian.h \[m
[31m-  /usr/include/bits/endian.h /usr/include/sys/select.h \[m
[31m-  /usr/include/bits/select.h /usr/include/bits/time.h \[m
[31m-  /usr/include/sys/sysmacros.h /usr/include/sys/time.h \[m
[31m-  /usr/include/sys/socket.h /usr/include/sys/uio.h \[m
[31m-  /usr/include/bits/uio.h /usr/include/bits/socket.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/limits.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/syslimits.h \[m
[31m-  /usr/include/limits.h /usr/include/bits/posix1_lim.h \[m
[31m-  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \[m
[31m-  /usr/include/bits/posix2_lim.h /usr/include/bits/xopen_lim.h \[m
[31m-  /usr/include/bits/sockaddr.h /usr/include/asm/socket.h \[m
[31m-  /usr/include/asm/sockios.h /usr/include/sys/file.h /usr/include/fcntl.h \[m
[31m-  /usr/include/bits/fcntl.h /usr/include/sys/stat.h \[m
[31m-  /usr/include/bits/stat.h /usr/include/sys/un.h /usr/include/sys/mman.h \[m
[31m-  /usr/include/bits/mman.h /usr/include/unistd.h \[m
[31m-  /usr/include/bits/posix_opt.h /usr/include/bits/environments.h \[m
[31m-  /usr/include/bits/confname.h /usr/include/getopt.h /usr/include/errno.h \[m
[31m-  /usr/include/bits/errno.h /usr/include/linux/errno.h \[m
[31m-  /usr/include/asm/errno.h ../machine/interrupt.h ../threads/list.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  ../threads/system.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../machine/stats.h ../machine/timer.h[m
[31m-stats.o: ../machine/stats.cc ../threads/copyright.h ../threads/utility.h \[m
[31m-  ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../machine/stats.h[m
[31m-timer.o: ../machine/timer.cc ../threads/copyright.h ../machine/timer.h \[m
[31m-  ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/system.h ../threads/thread.h \[m
[31m-  ../machine/machine.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[31m-  ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[31m-  ../machine/stats.h[m
[31m-addrspace.o: ../userprog/addrspace.cc ../threads/copyright.h \[m
[31m-  ../threads/system.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h ../bin/noff.h[m
[31m-bitmap.o: ../userprog/bitmap.cc ../threads/copyright.h \[m
[31m-  ../userprog/bitmap.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../filesys/openfile.h[m
[31m-exception.o: ../userprog/exception.cc ../threads/copyright.h \[m
[31m-  ../threads/system.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h ../userprog/syscall.h[m
[31m-progtest.o: ../userprog/progtest.cc ../threads/copyright.h \[m
[31m-  ../threads/system.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[31m-  ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h ../machine/console.h ../threads/synch.h[m
[31m-console.o: ../machine/console.cc ../threads/copyright.h \[m
[31m-  ../machine/console.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../threads/system.h ../threads/thread.h \[m
[31m-  ../machine/machine.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[31m-  ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[31m-  ../machine/stats.h ../machine/timer.h[m
[31m-machine.o: ../machine/machine.cc ../threads/copyright.h \[m
[31m-  ../machine/machine.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../threads/system.h ../threads/thread.h ../userprog/addrspace.h \[m
[31m-  ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h[m
[31m-mipssim.o: ../machine/mipssim.cc ../threads/copyright.h \[m
[31m-  ../machine/machine.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../machine/mipssim.h ../threads/system.h ../threads/thread.h \[m
[31m-  ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[31m-  ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[31m-  ../machine/stats.h ../machine/timer.h[m
[31m-translate.o: ../machine/translate.cc ../threads/copyright.h \[m
[31m-  ../machine/machine.h ../threads/utility.h ../threads/bool.h \[m
[31m-  ../machine/sysdep.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stdio.h \[m
[31m-  /usr/include/features.h /usr/include/sys/cdefs.h \[m
[31m-  /usr/include/gnu/stubs.h \[m
[31m-  /usr/lib/gcc-lib/i586-mandrake-linux-gnu/3.2.2/include/stddef.h \[m
[31m-  /usr/include/bits/types.h /usr/include/bits/wordsize.h \[m
[31m-  /usr/include/bits/typesizes.h /usr/include/libio.h \[m
[31m-  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \[m
[31m-  /usr/include/gconv.h ../threads/stdarg.h /usr/include/bits/stdio_lim.h \[m
[31m-  /usr/include/bits/sys_errlist.h /usr/include/string.h \[m
[31m-  /usr/include/xlocale.h ../machine/translate.h ../machine/disk.h \[m
[31m-  ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[31m-  ../threads/system.h ../threads/thread.h ../threads/scheduler.h \[m
[31m-  ../threads/list.h ../machine/interrupt.h ../machine/stats.h \[m
[31m-  ../machine/timer.h[m
[32m+[m[32mmain.o: ../threads/main.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/utility.h ../threads/bool.h \[m
[32m+[m[32m ../machine/sysdep.h ../threads/copyright.h /usr/include/stdio.h \[m
[32m+[m[32m /usr/include/features.h /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/system.h ../threads/thread.h \[m
[32m+[m[32m ../machine/machine.h ../threads/utility.h ../machine/translate.h \[m
[32m+[m[32m ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../filesys/openfile.h ../threads/scheduler.h ../threads/list.h \[m
[32m+[m[32m ../machine/interrupt.h ../threads/list.h ../machine/stats.h \[m
[32m+[m[32m ../machine/timer.h ../threads/synchcons.h ../machine/console.h[m
[32m+[m[32mlist.o: ../threads/list.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/list.h ../threads/utility.h \[m
[32m+[m[32m ../threads/bool.h ../machine/sysdep.h ../threads/copyright.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h[m
[32m+[m[32mscheduler.o: ../threads/scheduler.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/scheduler.h ../threads/list.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m ../threads/copyright.h /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/system.h ../machine/interrupt.h ../threads/list.h \[m
[32m+[m[32m ../machine/stats.h ../machine/timer.h ../threads/synchcons.h \[m
[32m+[m[32m ../machine/console.h[m
[32m+[m[32msynch.o: ../threads/synch.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/synch.h ../threads/thread.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m ../threads/copyright.h /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../machine/machine.h ../threads/utility.h \[m
[32m+[m[32m ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[32m+[m[32m ../filesys/filesys.h ../filesys/openfile.h ../threads/list.h \[m
[32m+[m[32m ../threads/system.h ../threads/scheduler.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h[m
[32m+[m[32msynchlist.o: ../threads/synchlist.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/synchlist.h ../threads/list.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m ../threads/copyright.h /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/synch.h ../threads/thread.h \[m
[32m+[m[32m ../machine/machine.h ../threads/utility.h ../machine/translate.h \[m
[32m+[m[32m ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../filesys/openfile.h[m
[32m+[m[32msystem.o: ../threads/system.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/system.h ../threads/utility.h \[m
[32m+[m[32m ../threads/bool.h ../machine/sysdep.h ../threads/copyright.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h[m
[32m+[m[32mthread.o: ../threads/thread.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/thread.h ../threads/utility.h \[m
[32m+[m[32m ../threads/bool.h ../machine/sysdep.h ../threads/copyright.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../machine/machine.h ../threads/utility.h \[m
[32m+[m[32m ../machine/translate.h ../machine/disk.h ../userprog/addrspace.h \[m
[32m+[m[32m ../filesys/filesys.h ../filesys/openfile.h ../threads/switch.h \[m
[32m+[m[32m ../threads/synch.h ../threads/list.h ../threads/system.h \[m
[32m+[m[32m ../threads/scheduler.h ../machine/interrupt.h ../threads/list.h \[m
[32m+[m[32m ../machine/stats.h ../machine/timer.h ../threads/synchcons.h \[m
[32m+[m[32m ../machine/console.h[m
[32m+[m[32mutility.o: ../threads/utility.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/utility.h ../threads/bool.h \[m
[32m+[m[32m ../machine/sysdep.h ../threads/copyright.h /usr/include/stdio.h \[m
[32m+[m[32m /usr/include/features.h /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/stdarg.h[m
[32m+[m[32mthreadtest.o: ../threads/threadtest.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/system.h ../threads/utility.h \[m
[32m+[m[32m ../threads/bool.h ../machine/sysdep.h ../threads/copyright.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h[m
[32m+[m[32minterrupt.o: ../machine/interrupt.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../machine/interrupt.h ../threads/list.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/utility.h ../threads/bool.h \[m
[32m+[m[32m ../machine/sysdep.h /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/system.h ../threads/thread.h \[m
[32m+[m[32m ../machine/machine.h ../threads/utility.h ../machine/translate.h \[m
[32m+[m[32m ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../filesys/openfile.h ../threads/scheduler.h ../threads/list.h \[m
[32m+[m[32m ../machine/interrupt.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h[m
[32m+[m[32msysdep.o: ../machine/sysdep.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h /usr/include/signal.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sigset.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/signum.h /usr/include/time.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/siginfo.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sigaction.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sigcontext.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sigstack.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/ucontext.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/pthreadtypes.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sigthread.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/types.h /usr/include/endian.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/endian.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/byteswap.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/byteswap-16.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/select.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/select.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/time.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/sysmacros.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/time.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/socket.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/uio.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/uio.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/socket.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/socket_type.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sockaddr.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/asm/socket.h \[m
[32m+[m[32m /usr/include/asm-generic/socket.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/asm/sockios.h \[m
[32m+[m[32m /usr/include/asm-generic/sockios.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/file.h /usr/include/fcntl.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/fcntl.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/fcntl-linux.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stat.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/un.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/mman.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/mman.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/mman-linux.h /usr/include/unistd.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/posix_opt.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/environments.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/confname.h /usr/include/getopt.h \[m
[32m+[m[32m /usr/include/errno.h /usr/include/i386-linux-gnu/bits/errno.h \[m
[32m+[m[32m /usr/include/linux/errno.h /usr/include/i386-linux-gnu/asm/errno.h \[m
[32m+[m[32m /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \[m
[32m+[m[32m ../machine/interrupt.h ../threads/list.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m ../threads/system.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../machine/stats.h ../machine/timer.h ../threads/synchcons.h \[m
[32m+[m[32m ../machine/console.h[m
[32m+[m[32mstats.o: ../machine/stats.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/utility.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/bool.h ../machine/sysdep.h /usr/include/stdio.h \[m
[32m+[m[32m /usr/include/features.h /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../machine/stats.h[m
[32m+[m[32mtimer.o: ../machine/timer.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../machine/timer.h ../threads/utility.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/system.h ../threads/utility.h \[m
[32m+[m[32m ../threads/thread.h ../machine/machine.h ../machine/translate.h \[m
[32m+[m[32m ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../filesys/openfile.h ../threads/scheduler.h ../threads/list.h \[m
[32m+[m[32m ../machine/interrupt.h ../threads/list.h ../machine/stats.h \[m
[32m+[m[32m ../machine/timer.h ../threads/synchcons.h ../machine/console.h[m
[32m+[m[32maddrspace.o: ../userprog/addrspace.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/system.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../userprog/addrspace.h \[m
[32m+[m[32m ../bin/noff.h[m
[32m+[m[32mbitmap.o: ../userprog/bitmap.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../userprog/bitmap.h ../threads/utility.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../filesys/openfile.h[m
[32m+[m[32mexception.o: ../userprog/exception.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/system.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../userprog/syscall.h[m
[32m+[m[32mprogtest.o: ../userprog/progtest.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/system.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/utility.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/thread.h ../machine/machine.h \[m
[32m+[m[32m ../threads/utility.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/scheduler.h ../threads/list.h ../machine/interrupt.h \[m
[32m+[m[32m ../threads/list.h ../machine/stats.h ../machine/timer.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../userprog/addrspace.h \[m
[32m+[m[32m ../threads/synch.h[m
[32m+[m[32mconsole.o: ../machine/console.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../machine/console.h ../threads/utility.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/system.h ../threads/utility.h \[m
[32m+[m[32m ../threads/thread.h ../machine/machine.h ../machine/translate.h \[m
[32m+[m[32m ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../filesys/openfile.h ../threads/scheduler.h ../threads/list.h \[m
[32m+[m[32m ../machine/interrupt.h ../threads/list.h ../machine/stats.h \[m
[32m+[m[32m ../machine/timer.h ../threads/synchcons.h ../machine/console.h[m
[32m+[m[32mmachine.o: ../machine/machine.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../machine/machine.h ../threads/utility.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../threads/system.h ../threads/utility.h ../threads/thread.h \[m
[32m+[m[32m ../machine/machine.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../filesys/openfile.h ../threads/scheduler.h ../threads/list.h \[m
[32m+[m[32m ../machine/interrupt.h ../threads/list.h ../machine/stats.h \[m
[32m+[m[32m ../machine/timer.h ../threads/synchcons.h ../machine/console.h[m
[32m+[m[32mmipssim.o: ../machine/mipssim.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../machine/machine.h ../threads/utility.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../machine/mipssim.h ../threads/system.h ../threads/utility.h \[m
[32m+[m[32m ../threads/thread.h ../machine/machine.h ../userprog/addrspace.h \[m
[32m+[m[32m ../filesys/filesys.h ../filesys/openfile.h ../threads/scheduler.h \[m
[32m+[m[32m ../threads/list.h ../machine/interrupt.h ../threads/list.h \[m
[32m+[m[32m ../machine/stats.h ../machine/timer.h ../threads/synchcons.h \[m
[32m+[m[32m ../machine/console.h[m
[32m+[m[32mtranslate.o: ../machine/translate.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/copyright.h ../machine/machine.h ../threads/utility.h \[m
[32m+[m[32m ../threads/copyright.h ../threads/bool.h ../machine/sysdep.h \[m
[32m+[m[32m /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../machine/translate.h ../machine/disk.h \[m
[32m+[m[32m ../userprog/addrspace.h ../filesys/filesys.h ../filesys/openfile.h \[m
[32m+[m[32m ../threads/system.h ../threads/utility.h ../threads/thread.h \[m
[32m+[m[32m ../machine/machine.h ../threads/scheduler.h ../threads/list.h \[m
[32m+[m[32m ../machine/interrupt.h ../threads/list.h ../machine/stats.h \[m
[32m+[m[32m ../machine/timer.h ../threads/synchcons.h ../machine/console.h[m
[32m+[m[32msynchcons.o: ../threads/synchcons.cc /usr/include/stdc-predef.h \[m
[32m+[m[32m ../threads/synchcons.h ../machine/console.h ../threads/copyright.h \[m
[32m+[m[32m ../threads/utility.h ../threads/copyright.h ../threads/bool.h \[m
[32m+[m[32m ../machine/sysdep.h /usr/include/stdio.h /usr/include/features.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/sys/cdefs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/wordsize.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/gnu/stubs-32.h \[m
[32m+[m[32m /usr/lib/gcc/i686-linux-gnu/5/include/stddef.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/types.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/typesizes.h /usr/include/libio.h \[m
[32m+[m[32m /usr/include/_G_config.h /usr/include/wchar.h ../threads/stdarg.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/stdio_lim.h \[m
[32m+[m[32m /usr/include/i386-linux-gnu/bits/sys_errlist.h /usr/include/string.h \[m
[32m+[m[32m /usr/include/xlocale.h ../threads/synch.h ../threads/thread.h \[m
[32m+[m[32m ../threads/utility.h ../machine/machine.h ../machine/translate.h \[m
[32m+[m[32m ../machine/disk.h ../userprog/addrspace.h ../filesys/filesys.h \[m
[32m+[m[32m ../filesys/openfile.h ../threads/list.h[m
 # DEPENDENCIES MUST END AT END OF FILE[m
 # IF YOU PUT STUFF HERE IT WILL GO AWAY[m
 # see make depend above[m
[1mdiff --git a/vm/addrspace.o b/vm/addrspace.o[m
[1mindex 02f09e9..65e7448 100644[m
Binary files a/vm/addrspace.o and b/vm/addrspace.o differ
[1mdiff --git a/vm/console.o b/vm/console.o[m
[1mindex 64aa47e..49c59fb 100644[m
Binary files a/vm/console.o and b/vm/console.o differ
[1mdiff --git a/vm/exception.o b/vm/exception.o[m
[1mindex 2353859..bcdf19f 100644[m
Binary files a/vm/exception.o and b/vm/exception.o differ
[1mdiff --git a/vm/interrupt.o b/vm/interrupt.o[m
[1mindex 882a3bc..c93b444 100644[m
Binary files a/vm/interrupt.o and b/vm/interrupt.o differ
[1mdiff --git a/vm/machine.o b/vm/machine.o[m
[1mindex 7ec14b3..17407fc 100644[m
Binary files a/vm/machine.o and b/vm/machine.o differ
[1mdiff --git a/vm/main.o b/vm/main.o[m
[1mindex e63dbd2..8116bac 100644[m
Binary files a/vm/main.o and b/vm/main.o differ
[1mdiff --git a/vm/mipssim.o b/vm/mipssim.o[m
[1mindex 0ad6b51..30aacbb 100644[m
Binary files a/vm/mipssim.o and b/vm/mipssim.o differ
[1mdiff --git a/vm/nachos b/vm/nachos[m
[1mindex 17da963..1b405ae 100644[m
Binary files a/vm/nachos and b/vm/nachos differ
[1mdiff --git a/vm/progtest.o b/vm/progtest.o[m
[1mindex 8e0ebda..4eef5d1 100644[m
Binary files a/vm/progtest.o and b/vm/progtest.o differ
[1mdiff --git a/vm/scheduler.o b/vm/scheduler.o[m
[1mindex bdcb929..5d850a0 100644[m
Binary files a/vm/scheduler.o and b/vm/scheduler.o differ
[1mdiff --git a/vm/synch.o b/vm/synch.o[m
[1mindex 594b66f..2f1a30e 100644[m
Binary files a/vm/synch.o and b/vm/synch.o differ
[1mdiff --git a/vm/synchcons.o b/vm/synchcons.o[m
[1mnew file mode 100644[m
[1mindex 0000000..d890387[m
Binary files /dev/null and b/vm/synchcons.o differ
[1mdiff --git a/vm/synchlist.o b/vm/synchlist.o[m
[1mindex d8ad2f5..ee4c789 100644[m
Binary files a/vm/synchlist.o and b/vm/synchlist.o differ
[1mdiff --git a/vm/sysdep.o b/vm/sysdep.o[m
[1mindex 6ac6786..6a80f7d 100644[m
Binary files a/vm/sysdep.o and b/vm/sysdep.o differ
[1mdiff --git a/vm/system.o b/vm/system.o[m
[1mindex 3f6912d..3d4b7ca 100644[m
Binary files a/vm/system.o and b/vm/system.o differ
[1mdiff --git a/vm/thread.o b/vm/thread.o[m
[1mindex 18c0198..9ca5fbc 100644[m
Binary files a/vm/thread.o and b/vm/thread.o differ
[1mdiff --git a/vm/threadtest.o b/vm/threadtest.o[m
[1mindex 7908ade..fbf0b1b 100644[m
Binary files a/vm/threadtest.o and b/vm/threadtest.o differ
[1mdiff --git a/vm/timer.o b/vm/timer.o[m
[1mindex 8508106..ef427ce 100644[m
Binary files a/vm/timer.o and b/vm/timer.o differ
[1mdiff --git a/vm/translate.o b/vm/translate.o[m
[1mindex 565a461..e48d31c 100644[m
Binary files a/vm/translate.o and b/vm/translate.o differ
