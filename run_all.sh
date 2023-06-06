#!/bin/bash/
pwd=`pwd`
DIRECTORY=$(echo $pwd | sed 's/\//\\\//g') &&
cd orrs/ &&
sed -i "s/^      DATA OSFILE \/\ '\/home\/codes\/orrs\/osmapDP.dat' \/*/      DATA OSFILE \/ \'$DIRECTORY\/orrs\/osmap.dat\' \//" ./src/osmap.f &&
cd ./bin &&
sed -i "s/^FC = f77*/FC = gfortran/; s/^PLTOBJ = \/home\/codes\/Xplot\/libPlt.a*/PLTOBJ = $DIRECTORY\/plotlib\/libPlt_gSP.a/; s/^FC = ifort/FC = gfortran/; s/^FLG = -O -fpe0 -CB/FLG = -O/; s/^PLTLIB = -L\/usr\/X11R6\/lib -lX11/PLTLIB = -lX11/" ./Makefile &&
make osgen &&
make osmap.o &&
cd ../ &&
bin/osgen osmaps_ns.lst &&

cd ../plotlib &&
sed -i "s/^INSTALLDIR = .*/INSTALLDIR = $DIRECTORY\/bin\//; s/^PLTLIB = libPlt.a*/PLTLIB = libPlt_gSP.a/; /include .\/config.make/a FC = gfortran\nDP = -fdefault-real-8" ./Makefile &&
make libPlt_gSP.a &&

cd ../bin &&
sed -i "s/^BINDIR = \/home\/codes\/bin\/*/BINDIR = $DIRECTORY\//; s/^PLTOBJ = ..\/plotlib\/libPlt.a/PLTOBJ = ..\/plotlib\/libPlt_gSP.a/; s/^FC = f77*/FC = gfortran/; s/^PLTOBJ = ..\/plotlib\/libPlt_gDP.a*/PLTOBJ = ..\/plotlib\/libPlt_gSP.a/" ./Makefile &&
make xfoil &&
make pplot &&
make pxplot
