#
# Makefile for omniNames
#
# by Noriaki Ando <n-ando@aist.go.jp>
#
# This Makefile only supports Linux.
# Please change ARCH variable for the target architecture.
#

# ARCH = __x86_64__
ARCH = __arm__
CXX_CPPFLAGS   = -c -O2 -Wall -Wno-unused -fexceptions -I.
CORBA_CPPFLAGS = -D__OMNIORB4__ -D_REENTRANT -D__OSVERSION__=2 -D__linux__ -D$(ARCH) 
DIR_CPPFLAGS   = -DDEFAULT_LOGDIR='"/var/lib/omninames"'
CPPFLAGS       = $(CXX_CPPFLAGS) $(CORBA_CPPFLAGS) $(DIR_CPPFLAGS)

CXXSRCS = omniNames.cc NamingContext_i.cc log.cc omniNamesWin.cc
LIBS = -lomniORB4 -lomnithread -lpthread
OBJS = $(CXXSRCS:.cc=.o)

all: omniNames

clean:
	rm -f omniNames
	rm -f *.o *.a *.d

install:
	mv -f /usr/bin/omniNames /usr/bin/omniNames.org
	install omniNames /usr/bin

# (compile) g++ -c -O2 -Wall -Wno-unused -fexceptions  -I. -D__OMNIORB4__ -I../../../stub -D_REENTRANT -DDEFAULT_LOGDIR='"/var/omninames"' -I. -I. -I../../../include -I../../../include -D__OSVERSION__=2 -D__linux__ -D__x86_64__ -o omniNames.o omniNames.cc
$(OBJ):
	$(CXX) $(CPPFLAGS)

# (link) g++ -o omniNames -O2 -Wall -Wno-unused -fexceptions -L../../../lib -L../../../lib omniNames.o NamingContext_i.o log.o omniNamesWin.o -lomniORB4 -lomnithread -lpthread
omniNames: $(OBJS)
	$(CXX) -o $@ -O2 -Wall -Wno-unused -fexceptions $(OBJS) $(LIBS)
