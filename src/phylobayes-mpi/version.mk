ifndef ROLLCOMPILER
  ROLLCOMPILER = gnu
endif
COMPILERNAME := $(firstword $(subst /, ,$(ROLLCOMPILER)))

ifndef ROLLMPI
  ROLLMPI = openmpi
endif
MPINAME := $(firstword $(subst /, ,$(ROLLMPI)))

NAME           = phylobayes-mpi_$(COMPILERNAME)_$(MPINAME)
VERSION        = 1.4e
RELEASE        = 1
PKGROOT        = /opt/phylobayes

SRC_SUBDIR     = phylobayes-mpi

SOURCE_NAME    = phylobayes-mpi
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)
