#!/bin/bash

# Activate oneAPI kits
. /opt/intel/oneapi/setvars.sh

###### zlib-1.2.13 #########
ZLIB=/home/mohid/apps_intel/zlib-1.2.13
export PATH=$PATH:$ZLIB/lib:$ZLIB/include
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ZLIB/lib

####### hdf5-1.8.17 #######
HDF5=/home/mohid/apps_intel/hdf5-1.8.17
export PATH=$PATH:$HDF5/bin:$HDF5/lib:$HDF5/include
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HDF5/lib

########## netcdf-c-4.8.1 #######
export NETCDF=/home/mohid/apps_intel/netcdf-c-4.8.1
export PATH=$PATH:$NETCDF/bin:$NETCDF/lib:$NETCDF/include

export NETCDF_ROOT=$NETCDF
export NETCDF4_ROOT=$NETCDF
export NETCDF_LIB=$NETCDF/lib
export NETCDF_INC=$NETCDF/include

export NETCDF_GF_ROOT=$NETCDF
export NETCDF4_GF_ROOT=$NETCDF
export NETCDF_GF_LIB=$NETCDF/lib
export NETCDF_GF_INC=$NETCDF/include

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$NETCDF_LIB

export CPPFLAGS="$CPPFLAGS -I$NETCDF_INC"
export LDFLAGS="$LDFLAGS -L$NETCDF_LIB"

export MPIR_CVAR_CH4_OFI_TAG_BITS=31
export MPIR_CVAR_CH4_OFI_RANK_BITS=8

nohup /opt/intel/oneapi/mpi/latest/bin/mpirun -np 15 ./MohidWater_mpi.exe > Mohid.log
nohup ./MohidDDC.exe > MohidDDC.log
