# Fast Installer for Xfoil v6.99 for UNIX users
## All you need to do is to:
1. Download the compressed .tgz program from the [official website](https://web.mit.edu/drela/Public/web/xfoil/)
2. Extract the compressed folder and open it in the terminal
3. Put the file "run_all.sh" in this location and enter this command:
### `bash run_all.sh`
#### This is helpful because -in addition to the so many steps needed to compile the program- there are multiple mistakes in the makefiles  

## General
XFOIL and its plot library should compile on any Unix system  with normal f77 or gfortran, C, and X-Windows support.  So far, XFOIL has been tested on the following systems:
- DEC\-5000
- Alpha
- SGI
- \* Sun
- \* RS/6000
- \* HP-9000
- \* Pentium/Linux


The systems marked with "*" have peculiar features which require slight  modifications to the Makefiles in the plotlib/ and bin/ directories. Examine these Makefiles before building the plot library and XFOIL.

## Documentation
User Guide is in the  xfoil.doc  file.  If impatient, you can just run XFOIL in the runs/ directory, which contains a few input files:
- ```% cd runs```
- ```% ../bin/xfoil```

The file  session.txt  contains keyboard inputs for a typical interactive session. If one is lost when running XFOIL, typing a "?" at any command  prompt, e.g. <br />```.GDES  c>  ?```<br /> will always produce a keyboard command menu.

