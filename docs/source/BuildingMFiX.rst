Building MFiX-Exa
=================

There are two options to building MFIX-Exa:

* SUPERBUILD (default):
    Utilities download and build AMReX as part of the MFIX-Exa build process.
    This method is strongly encouraged as it ensures configure options for
    MFIX-Exa and AMReX are consistent.

* Using an existing AMReX Library:
    MFIX-Exa is linked to an
    existing AMReX installation. This is ideal for continuous integration
    severs (CI) and regression testing applications.  AMReX library version
    must meet MFIX-Exa requirements.


Superbuild Instructions
-----------------------

When building in *SUPERBUILD* mode, MFiX-Exa build system will take care of
downloading, configuring and installing AMReX as part of the MFiX-Exa build.
The following commands build MFiX-Exa and AMReX in a single step.

.. highlight:: bash

::

    git clone http://mfix.netl.doe.gov/gitlab/exa/mfix.git
    cd mfix
    mkdir build
    cd build
    cmake CONFIG_OPTIONS ..
    make -j

AMReX is built the first time the ``make`` command is issued.  No external
installation of AMReX is needed. However, internet access to the AMReX github
repository is required.  The optional string ``CONFIG_OPTIONS`` allows to
customize the build of both AMReX and MFIX-Exa.  ``CONFIG_OPTIONS`` is a list
of one or more configuration options given in the form ``-DOPTION=VALUE``.

The table below lists configuration options, possible values, and their effect
on the build.  Options prefixed by ``AMREX_`` are specific to the build of
AMReX.


.. table:: MFiX-Exa compiler options

    +------------------------------+----------------------------------------------+------------------------------+---------------------+
    | Option name                  |  Description                                 | Possible values              | Default value       |
    +==============================+==============================================+==============================+=====================+
    | DEBUG                        | Build in debug mode                          |   ON/OFF                     |   OFF               |
    +------------------------------+----------------------------------------------+------------------------------+---------------------+
    | MFIX_FFLAGS_OVERRIDES        | User-defined Fortran flags                   | valid F90 compiler flags     |   None              |
    +------------------------------+----------------------------------------------+------------------------------+---------------------+
    | MFIX_CXXFLAGS_OVERRIDES      | User-defined C++ flags                       | valid C++ compiler flags     |   None              |
    +------------------------------+----------------------------------------------+------------------------------+---------------------+
    | ENABLE_FPE                   | Build with Floating-Point Exceptions checks  |   0/1                        |   0                 |
    +------------------------------+----------------------------------------------+------------------------------+---------------------+
    | AMREX_ENABLE_MPI             | Enable build with MPI                        |   0/1                        |   1                 |
    +------------------------------+----------------------------------------------+------------------------------+---------------------+
    | AMREX_ENABLE_OMP             | Enable build with OpenMP                     |   0/1                        |   0                 |
    +------------------------------+----------------------------------------------+------------------------------+---------------------+
    | AMREX_ENABLE_DP              | Enable double precision                      |   0/1                        |   1                 |
    +------------------------------+----------------------------------------------+------------------------------+---------------------+
    | AMREX_ENABLE_DP_PARTICLES    | Enable double precision in particles classes |   0/1                        |   1                 |
    +------------------------------+----------------------------------------------+------------------------------+---------------------+
    | AMREX_ENABLE_BASE_PROFILE    | Include profiling info                       |   0/1                        |   0                 |
    +------------------------------+----------------------------------------------+------------------------------+---------------------+
    | AMREX_ENABLE_TINY_PROFILE    | Include tiny profiling info                  |   0/1                        |   0                 |
    +------------------------------+----------------------------------------------+------------------------------+---------------------+
    | AMREX_ENABLE_COMM_PROFILE    | Include communicators profiling info         |   0/1                        |   0                 |
    +------------------------------+----------------------------------------------+------------------------------+---------------------+
    | AMREX_ENABLE_TRACE_PROFILE   | Include trace profiling info                 |   0/1                        |   0                 |
    +------------------------------+----------------------------------------------+------------------------------+---------------------+
    | AMREX_ENABLE_MEM_PROFILE     | Include memory profiling info                |   0/1                        |   0                 |
    +------------------------------+----------------------------------------------+------------------------------+---------------------+
    | AMREX_ENABLE_BACKTRACE       | Include backtrace info                       |   0/1                        |   0                 |
    +------------------------------+----------------------------------------------+------------------------------+---------------------+
    | AMREX_ENABLE_PROFPARSER      | Include profile parser                       |   0/1                        |   0                 |
    +------------------------------+----------------------------------------------+------------------------------+---------------------+
    | AMREX_ENABLE_PIC             | Build position-independent code              |   0/1                        |   0                 |
    +------------------------------+----------------------------------------------+------------------------------+---------------------+
    | AMREX_ENABLE_ASSERTION       | Build position-independent code              |   0/1                        |   0                 |
    +------------------------------+----------------------------------------------+------------------------------+---------------------+
    | AMREX_GIT_COMMIT             | AMReX commit to be used in the build         | valid git commit id/branch   |   None              |
    +------------------------------+----------------------------------------------+------------------------------+---------------------+
    | AMREX_INSTALL_DIR            | Global path to AMReX install directory       | valid global path            |   None (superbuild) |
    +------------------------------+----------------------------------------------+------------------------------+---------------------+

Note that SUPERBUILD mode is enabled automatically when ``AMREX_INSTALL_DIR``
is not given.

Example: build mfix with custom fortran flags, AMReX profiling enabled and
single precision particles:

.. highlight:: bash

::

    cmake -DMFIX_FFLAGS_OVERRIDES="custom flags" -DAMREX_ENABLE_BASE_PROFILE=1 -DAMREX_ENABLE_DP_PARTICLES=0 ..


Building MFIX-Exa using a separate AMReX installation (no superbuild)
---------------------------------------------------------------------

Build AMReX Library
^^^^^^^^^^^^^^^^^^^

Clone AMReX from the official Git repository and checkout the _development_
branch.

.. highlight:: bash

::

    git clone https://github.com/AMReX-Codes/amrex.git
    cd amrex
    git checkout development

Next, configure, build and install AMReX as follows:

.. highlight:: bash

::

    cmake AMREX_CONFIG_OPTIONS -DENABLE_PARTICLES=1 -DENABLE_FBASELIB=1 -DENABLE_EB=1 -DCMAKE_INSTALL_PREFIX:PATH=/absolute/path/to/installdir .
    make install

Here, ``AMREX_CONFIG_OPTIONS`` are optional configure options for AMReX. Please
refer to the AMReX user guide for a list of all the possible configuration
options. The only options required are ``-DENABLE_PARTICLES=1``,
``-DENABLE_FBASELIB=1``, and ``-DENABLE_EB=1``.


Building MFIX-Exa
^^^^^^^^^^^^^^^^^^

Clone and build MFIX-Exa.

.. highlight:: bash

::

    git clone http://mfix.netl.doe.gov/gitlab/exa/mfix.git
    mkdir build
    cd build
    cmake CONFIG_OPTIONS -DAMREX_INSTALL_DIR=/absolute/path/to/amrex/installdir ..
    make -j

Here, ``CONFIG_OPTIONS`` are MFiX-Exa specific configuration options, that is,
any option NOT prefixed by ``AMREX_`` in the table above. Options prefixed by
``AMREX_`` are always ignored when using an external AMReX installation.


A Few more notes on building MFIX-Exa
-------------------------------------

The system defaults compilers can be overwritten as follows:

.. highlight:: bash

::

    cmake -DCMAKE_CXX_COMPILER=<c++-compiler> -DCMAKE_Fortran_COMPILER=<f90-compiler> CONFIG_OPTIONS  ..

When building on a platform that uses the ``module`` utility, use either the above command (with full
path to the compilers) or the following:

.. highlight:: bash

::

    cmake -DCMAKE_CXX_COMPILER=CC -DCMAKE_Fortran_COMPILER=ftn CONFIG_OPTIONS  ..

