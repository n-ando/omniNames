# omniNames
"omniNames" which is a part of omniORB 4.2.3, is an implementation of a CORBA naming service.
This package provides independently buildable the "omniNames."

Original files are available from the following site.
- http://omniorb.sourceforge.net/


# Changes
This package disables the checkpoint functionality from the original omniNames.
The omniNames sometimes fails by data backup process so-called "checkpoints".
This omniNames never backup registered name-tree in data files.

## How to build

1. Install omniORB runtime library and development headers.
1. Edit Makefile and change ARCH variable according to your target architecture.
1. make
1. make install
  - This action replaces /usr/bin/omniNames with compiled new omniNames
  - The original omniNames will be renamed as omniNames.org
  




