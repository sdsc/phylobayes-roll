# SDSC "phylobayes" roll

## Overview

This roll bundles the PhyloBayes MPI sampler for phylogenetic reconstruction.

For more information about PhyloBayes please visit their official web pages:

- <a href="http://www.phylobayes.org" target="_blank">PhyloBayes MPI</a> is a
Bayesian Monte Carlo Markov Chain (MCMC) sampler for phylogenetic reconstruction.


## Requirements

To build/install this roll you must have root access to a Rocks development
machine (e.g., a frontend or development appliance).

If your Rocks development machine does *not* have Internet access you must
download the appropriate phylobayes source file(s) using a machine that does
have Internet access and copy them into the `src/phylobayes-mpi` directory on
your Rocks development machine.


## Dependencies

Unknown at this time.


## Building

To build the phylobayes-roll, execute these instructions on a Rocks development
machine (e.g., a frontend or development appliance):

```shell
% make default 2>&1 | tee build.log
% grep "RPM build error" build.log
```

If nothing is returned from the grep command then the roll should have been
created as... `phylobayes-*.iso`. If you built the roll on a Rocks frontend then
proceed to the installation step. If you built the roll on a Rocks development
appliance you need to copy the roll to your Rocks frontend before continuing
with installation.

This roll source supports building with different compilers and for different
network fabrics and mpi flavors.  By default, it builds using the intel
compilers for mvapich2 ib.  To build for a different configuration, use the
`ROLLCOMPILER`, `ROLLMPI` and `ROLLNETWORK` make variables, e.g.,

```shell
make ROLLCOMPILER=intel ROLLMPI=mpich2 ROLLNETWORK=mx 
```

The build process currently supports one or more of the values "intel", "pgi",
and "gnu" for the `ROLLCOMPILER` variable, defaulting to "intel".  It supports
`ROLLMPI` values "openmpi", "mpich2", and "mvapich2", defaulting to "mvapich2".
It uses any `ROLLNETWORK` variable value(s) to load appropriate mpi modules,
assuming that there are modules named `$(ROLLMPI)_$(ROLLNETWORK)` available
(e.g., `openmpi_ib`, `mpich2_mx`, etc.).

If the `ROLLCOMPILER`, `ROLLNETWORK` and/or `ROLLMPI` variables are specified,
their values are incorporated into the names of the produced roll and rpms, e.g.,

```shell
make ROLLCOMPILER=intel ROLLMPI=mvapich2 ROLLNETWORK=ib
```
produces a roll with a name that begins "`phylobayes_intel_mvapich2_ib`"; it
contains and installs similarly-named rpms.


## Installation

To install, execute these instructions on a Rocks frontend:

```shell
% rocks add roll *.iso
% rocks enable roll phylobayes
% cd /export/rocks/install
% rocks create distro
% rocks run roll phylobayes | bash
```

In addition to the software itself, the roll installs phylobayes environment
module files in:

```shell
/opt/modulefiles/applications/.(compiler)/phylobayes
```
