
# File: Makefile
# Purpose: compile and link findoutx.c.
# 
 
CC=/usr/bin/gcc

FOR=/usr/bin/g77
 
TOP=/usr/lib/DXM

TOPDIR=/shr/ipf-3.27

CINCLUDES =     -I. \
                -I$(TOP)/lib \
                -I$(TOP)/lib/Xt

CFLAGS =        -g $(CINCLUDES) -DDUNDERSCORE

FFLAGS =        -g -DDUNDERSCORE

LINTFLAGS=      $(CINCLUDES)

LDFLAGS =       -g -L./ -L../../ipc
 
LIBS = -lcflow -lipc -lm

#
# the IMAGE variable is used to create the executable name
 
IMAGE = findoutx

#
# OBJS is a customized list of modules that are being worked on
# and are present in the current directory
  
OBJS = \
	findoutx.o 

#
# This is the dependancy relationship for powerflow which
# specifies the link and causes the use of the utility compile 
# procedures below.
# WARNING: 
# The <tab> as the first character signifies the action to
# take for a given dependancy.
# The back slash causes a continuation of the current line 
# even if the line is commented out. 

$(IMAGE) : $(OBJS)
	$(CC) -o $(IMAGE) $(OBJS) $(LDFLAGS) $(LIBS)
	size $(IMAGE)

#
#
# The following are the compile procedures for any source code specified
# in the dependancy.  These override the system defaults.
# the first procedure is for any fortran code (appendix .f creating .o)
# the second is for an C code (appendix .c creating .o)

.c.o:
	$(CC) -c $(CFLAGS) $< 

# DO NOT DELETE THIS LINE -- make depend depends on it.GS) $<