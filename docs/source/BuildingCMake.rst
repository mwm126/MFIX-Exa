Building MFiX-Exa with CMake
============================

There are two options to building MFiX-Exa with cmake:

o **SUPERBUILD (default):** Utilities download and build AMReX as part
of the MFiX-Exa build process. This method is strongly encouraged as it
ensures configure options for MFiX-Exa and AMReX are consistent.

o **Using an existing AMReX Library:** MFiX-Exa is linked to an existing
AMReX installation. This is ideal for continuous integration severs (CI)
and regression testing applications. AMReX library version must meet
MFiX-Exa requirements.

SUPERBUILD Instructions (recommended)
-------------------------------------

When building in **SUPERBUILD** mode, MFiX-Exa build system will take
care of downloading, configuring and installing AMReX as part of the
MFiX-Exa build. The following commands build MFiX-Exa and AMReX in a
single step.

.. code:: shell

    > git clone http://mfix.netl.doe.gov/gitlab/exa/mfix.git
    > cd mfix
    > mkdir build
    > cd build
    > cmake CONFIG_OPTIONS ..
    > make -j

AMReX is built the first time the ``make`` command is issued. No
external installation of AMReX is needed. However, internet access to
the AMReX github repository is required. The optional string
``CONFIG_OPTIONS`` allows to customize the build of both AMReX and
MFiX-Exa. ``CONFIG_OPTIONS`` is a list of one or more configuration
options given in the form **-D**\ *OPTION=VALUE*\ \`.

The table below lists configuration options, possible values, and their
effect on the build. Options prefixed by ``AMREX_`` are specific to the
build of AMReX.

+-----------------+------------------------------+------------------+-------------+
| Option name     | Description                  | Possible values  | Default     |
|                 |                              |                  | value       |
+=================+==============================+==================+=============+
| DEBUG           | Build in debug mode          | ON/OFF           | OFF         |
+-----------------+------------------------------+------------------+-------------+
| CMAKE\_Fortran\ | User-defined Fortran flags   | valid F90        | None        |
| _FLAGS          | for MFiX build               | compiler flags   |             |
+-----------------+------------------------------+------------------+-------------+
| CMAKE\_CXX\_FLA | User-defined C++ flags for   | valid C++        | None        |
| GS              | MFiX build                   | compiler flags   |             |
+-----------------+------------------------------+------------------+-------------+
| AMREX\_Fortran\ | User-defined Fortran flags   | valid F90        | None        |
| _FLAGS          | for AMReX build              | compiler flags   |             |
+-----------------+------------------------------+------------------+-------------+
| AMREX\_CXX\_FLA | User-defined C++ flags for   | valid C++        | None        |
| GS              | AMReX build                  | compiler flags   |             |
+-----------------+------------------------------+------------------+-------------+
| ENABLE\_MPI     | Enable build with MPI        | 0/1              | 1           |
|                 |                              |                  |             |
+-----------------+------------------------------+------------------+-------------+
| ENABLE\_OMP     | Enable build with OpenMP     | 0/1              | 0           |
|                 |                              |                  |             |
+-----------------+------------------------------+------------------+-------------+
| ENABLE\_FPE     | Build with Floating-Point    | 0/1              | 0           |
|                 | Exceptions checks            |                  |             |
+-----------------+------------------------------+------------------+-------------+
| ENABLE\_PTESTS  | Include tests for projection | 0/1              | 0           |
|                 | method in Ctest suite        |                  |             |
+-----------------+------------------------------+------------------+-------------+
| ENABLE\_STESTS  | Include tests for SIMPLE     | 0/1              | 1           |
|                 | method in Ctest suite        |                  |             |
+-----------------+------------------------------+------------------+-------------+
| AMREX\_ENABLE\_ | Enable build with MPI        | 0/1              | 1           |
| MPI             |                              |                  |             |
+-----------------+------------------------------+------------------+-------------+
| AMREX\_ENABLE\_ | Enable build with OpenMP     | 0/1              | 0           |
| OMP             |                              |                  |             |
+-----------------+------------------------------+------------------+-------------+
| AMREX\_ENABLE\_ | Enable double precision      | 0/1              | 1           |
| DP              |                              |                  |             |
+-----------------+------------------------------+------------------+-------------+
| AMREX\_ENABLE\_ | Enable double precision in   | 0/1              | 1           |
| DP\_PARTICLES   | particles classes            |                  |             |
+-----------------+------------------------------+------------------+-------------+
| AMREX\_ENABLE\_ | Include profiling info       | 0/1              | 0           |
| BASE\_PROFILE   |                              |                  |             |
+-----------------+------------------------------+------------------+-------------+
| AMREX\_ENABLE\_ | Include tiny profiling info  | 0/1              | 0           |
| TINY\_PROFILE   |                              |                  |             |
+-----------------+------------------------------+------------------+-------------+
| AMREX\_ENABLE\_ | Include communicators        | 0/1              | 0           |
| COMM\_PROFILE   | profiling info               |                  |             |
+-----------------+------------------------------+------------------+-------------+
| AMREX\_ENABLE\_ | Include trace profiling info | 0/1              | 0           |
| TRACE\_PROFILE  |                              |                  |             |
+-----------------+------------------------------+------------------+-------------+
| AMREX\_ENABLE\_ | Include memory profiling     | 0/1              | 0           |
| MEM\_PROFILE    | info                         |                  |             |
+-----------------+------------------------------+------------------+-------------+
| AMREX\_ENABLE\_ | Include backtrace info       | 0/1              | 0           |
| BACKTRACE       |                              |                  |             |
+-----------------+------------------------------+------------------+-------------+
| AMREX\_ENABLE\_ | Include profile parser       | 0/1              | 0           |
| PROFPARSER      |                              |                  |             |
+-----------------+------------------------------+------------------+-------------+
| AMREX\_ENABLE\_ | Build position-independent   | 0/1              | 0           |
| PIC             | code                         |                  |             |
+-----------------+------------------------------+------------------+-------------+
| AMREX\_ENABLE\_ | Build position-independent   | 0/1              | 0           |
| ASSERTION       | code                         |                  |             |
+-----------------+------------------------------+------------------+-------------+
| AMREX\_GIT\_COM | AMReX commit to be used in   | valid git commit | None        |
| MIT             | the build                    | id/branch        |             |
+-----------------+------------------------------+------------------+-------------+
| AMREX\_INSTALL\ | Global path to AMReX install | valid global     | None        |
| _DIR            | directory                    | path             | (superbuild |
|                 |                              |                  | )           |
+-----------------+------------------------------+------------------+-------------+

``SUPERBUILD mode is enabled automatically when AMREX_INSTALL_DIR is not given.``

Example: build mfix with custom fortran flags, AMReX profiling enabled
and single precision particles:

::

    cmake -DMFiX_FFLAGS_OVERRIDES="custom flags" -DAMREX_ENABLE_BASE_PROFILE=1 -DAMREX_ENABLE_DP_PARTICLES=0 ..

Building MFiX-Exa using a separate AMReX installation (no superbuild)
---------------------------------------------------------------------

Build AMReX Library
~~~~~~~~~~~~~~~~~~~

Clone AMReX from the official Git repository and checkout the
*development* branch.

.. code:: shell

    > git clone https://github.com/AMReX-Codes/amrex.git
    > cd amrex
    > git checkout development

Next, configure, build and install AMReX as follows:

.. code:: shell

    > cmake AMREX_CONFIG_OPTIONS -DENABLE_PARTICLES=1 -DENABLE_AMRDATA=1 -DENABLE_EB=1 -DCMAKE_INSTALL_PREFIX:PATH=/absolute/path/to/installdir .
    > make install

Here,\ ``AMREX_CONFIG_OPTIONS`` are optional configure options for
AMReX. Please refer to the AMReX user guide for a list of all the
possible configuration options. The only options required are
**-DENABLE\_PARTICLES=1**, **-DENABLE\_AMRDATA=1**, and
**-DENABLE\_EB=1**.

Building MFiX-Exa
~~~~~~~~~~~~~~~~~

Clone and build MFiX-Exa.

.. code:: shell

    > git clone http://mfix.netl.doe.gov/gitlab/exa/mfix.git
    > mkdir build
    > cd build
    > cmake CONFIG_OPTIONS -DAMREX_INSTALL_DIR=/absolute/path/to/amrex/installdir ..
    > make -j

Here, ``CONFIG_OPTIONS`` are MFiX-Exa specific configuration options,
that is, any option NOT prefixed by ``AMREX_`` in the table above.
Options prefixed by ``AMREX_`` are always ignored when using an external
AMReX installation.

Few more notes on building MFiX-Exa
-----------------------------------

The system defaults compilers can be overwritten as follows:

.. code:: shell

    > cmake -DCMAKE_CXX_COMPILER=<c++-compiler> -DCMAKE_Fortran_COMPILER=<f90-compiler> CONFIG_OPTIONS  ..

When building on a platform that uses the ``module`` utility, use either
the above command (with full path to the compilers) or the following:

.. code:: shell

    > cmake -DCMAKE_CXX_COMPILER=CC -DCMAKE_Fortran_COMPILER=ftn CONFIG_OPTIONS  ..

MFiX-Exa uses the same compiler flags used to build AMReX, unless
``CMAKE_Fortran_FLAGS``/``CMAKE_CXX_FLAGS`` is explicitly provided, or
the environmental variables ``FFLAGS``/``CXXFLAGS`` are set.
