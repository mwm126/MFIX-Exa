Building MFiX-Exa with CMake
============================

CMake build is a two-step process. First ``cmake`` is invoked to create
configuration files and makefiles in a chosen directory (``builddir``).
Next, the actual build is performed by invoking ``make`` from within ``builddir``.
The CMake build process is summarized as follows:

.. highlight:: console

::

    mkdir /path/to/builddir
    cd    /path/to/builddir
    cmake [options] -DCMAKE_BUILD_TYPE=[Debug|Release|RelWithDebInfo|MinSizeRel] /path/to/mfix
    make

In the above snippet, ``[options]`` indicates one or more options for the
customization of the build, as described later in this section.
If the option ``CMAKE_BUILD_TYPE`` is omitted,
``CMAKE_BUILD_TYPE=Release`` is assumed.

There are two modes to build MFiX-Exa with cmake:

o **STANDALONE:** MFiX-Exa source code is built separately and linked to an existing
AMReX installation. This is ideal for continuous integration severs (CI)
and regression testing applications. AMReX library version and configuration options
must meet MFiX-Exa requirements.

o **SUPERBUILD (recommended):** AMReX is downloaded and built as part
of the MFiX-Exa build process. This method is strongly encouraged as it
ensures that the configuration options for MFiX-Exa and AMReX are consistent.


**STANDALONE** instructions
---------------------------------------------------------------------

Build AMReX Library
~~~~~~~~~~~~~~~~~~~

Clone AMReX from the official Git repository and checkout the
*development* branch:

.. code:: shell

    > git clone https://github.com/AMReX-Codes/amrex.git
    > cd amrex
    > git checkout development

Next, configure, build and install AMReX as follows:

.. code:: shell

    > mkdir build
    > cd build
    > cmake -DCMAKE_BUILD_TYPE=[Debug|Release|RelWithDebInfo|MinSizeRel] -DENABLE_PARTICLES=yes -DENABLE_AMRDATA=yes -DENABLE_EB=yes [other amrex options] -DCMAKE_INSTALL_PREFIX:PATH=/absolute/path/to/installdir ..
    > make install

The options **ENABLE\_PARTICLES=yes**, **ENABLE\_AMRDATA=yes**, and **ENABLE\_EB=yes** are required by MFiX-Exa. ``[other amrex options]`` in the snippet above refers to any other AMReX configuration option in addition to the required ones. Please refer to the `AMReX user guide <https://amrex-codes.github.io/amrex/docs_html/BuildingAMReX.html#building-with-cmake>`_ for more details on building AMReX with CMake.


Building MFiX-Exa
~~~~~~~~~~~~~~~~~

Clone and build MFiX-Exa:

.. code:: shell

    > git clone http://mfix.netl.doe.gov/gitlab/exa/mfix.git
    > mkdir build
    > cd build
    > cmake -DCMAKE_BUILD_TYPE=[Debug|Release|RelWithDebInfo|MinSizeRel] [mfix options] -DAMReX_ROOT=/absolute/path/to/amrex/installdir ..
    > make -j


Passing ``-DAMReX_ROOT=/absolute/path/to/amrex/installdir`` instructs CMake to search
``/absolute/path/to/amrex/installdir`` before searching system paths
for an available AMReX installation.
``AMReX_ROOT`` can also be set as an environmental variable instead of passing it as a command line option.


``[mfix options]`` indicates any of the configuration option listed in the table below.

+-----------------+------------------------------+------------------+-------------+
| Option name     | Description                  | Possible values  | Default     |
|                 |                              |                  | value       |
+=================+==============================+==================+=============+
| CMAKE\_Fortran\ | User-defined Fortran flags   | valid Fortran    | None        |
| _FLAGS          |                              | compiler flags   |             |
+-----------------+------------------------------+------------------+-------------+
| CMAKE\_CXX\     | User-defined C++ flags       | valid C++        | None        |
| _FLAGS          |                              | compiler flags   |             |
+-----------------+------------------------------+------------------+-------------+
| CMAKE\_CUDA\    | User-defined CUDA flags      | valid CUDA       | None        |
| _FLAGS          |                              | compiler flags   |             |
+-----------------+------------------------------+------------------+-------------+
| ENABLE\_MPI     | Enable build with MPI        | no/yes           | yes         |
|                 |                              |                  |             |
+-----------------+------------------------------+------------------+-------------+
| ENABLE\_OMP     | Enable build with OpenMP     | no/yes           | no          |
|                 |                              |                  |             |
+-----------------+------------------------------+------------------+-------------+
| ENABLE\_CUDA    | Enable build with CUDA       | no/yes           | no          |
|                 |                              |                  |             |
+-----------------+------------------------------+------------------+-------------+
| ENABLE\_HYPRE   | Enable HYPRE support         | no/yes           | no          |
|                 |                              |                  |             |
+-----------------+------------------------------+------------------+-------------+
| ENABLE\_FPE     | Build with Floating-Point    | no/yes           | no          |
|                 | Exceptions checks            |                  |             |
+-----------------+------------------------------+------------------+-------------+


SUPERBUILD Instructions (recommended)
-------------------------------------

If no AMReX installation is found on the system, or if one is found but does not meet MFiX-Exa requirements, MFiX-Exa CMake falls back to **SUPERBUILD** mode.
When building in **SUPERBUILD** mode, the AMReX git repo is checked out via a git submodule before AMReX CMake build system is included into MFiX-Exa CMake infrastructure. Consequently, MFiX-Exa CMake inherents AMReX's CMake targets and configuration options, that is, MFiX-Exa and AMReX are configured and built as a single entity.


Assuming no valid AMReX installation is present on the target system, and ``AMReX_ROOT`` is not set in the environment, the following code will build  MFiX-Exa in **SUPERBUILD** mode:

.. code:: shell

    > git clone http://mfix.netl.doe.gov/gitlab/exa/mfix.git
    > cd mfix
    > mkdir build
    > cd build
    > cmake [amrex options] -DCMAKE_BUILD_TYPE=[Debug|Release|RelWithDebInfo|MinSizeRel] ..
    > make -j

``[amrex options]`` is a list of any of the AMReX configuration options listed in the `AMReX user guide <https://amrex-codes.github.io/amrex/docs_html/BuildingAMReX.html#building-with-cmake>`_


Working with the AMReX submodule
--------------------------------

For MFiX-Exa development or testing, you may need to build with a different
branch or release of AMReX.

The ``subprojects/amrex`` directory is a Git repo, so use all standard Git
commands. Either ``cd subprojects/amrex`` to run Git commands in the ``amrex``
directory, or use ``git -C subprojects/amrex`` in the MFiX-Exa repo. For
instance, to build with the ``my-amrex-branch`` branch of the AMReX repo:

.. code:: shell

    > git -C subprojects/amrex checkout my-amrex-branch
    > git status
    ...
    modified:   subprojects/amrex (new commits)

The branch ``my-amrex-branch`` will then be used when building MFiX-Exa.

To revert to the default version of the AMReX submodule, run ``git submodule
update``:

.. code:: shell

    > git submodule update
    > git status
    ...
    nothing to commit, working tree clean

You can edit, commit, pull, and push AMReX changes from ``subprojects/amrex``.
AMReX development is outside the scope of this document. Run ``git status`` in
the top-level MFix-Exa repo to see whether the AMReX submodule has new commits,
modified files, or untracked files.

The CMake variables ``AMREX_GIT_COMMIT_DEVELOP`` and
``AMREX_GIT_COMMIT_DEVELOP`` have been removed. Instead, to update the AMReX
submodule referenced by MFiX-Exa:

.. code:: shell

    > git -C subprojects/amrex checkout UPDATED_AMREX_COMMIT_SHA1
    > git add subprojects/amrex
    > git commit -m 'Updating AMReX version'

This will only update the AMReX SHA-1 referenced by MFiX-Exa. Uncommitted AMReX
changes and untracked AMReX files under ``subprojects/amrex`` are not added by
``git add subprojects/amrex``. (To commit to the AMReX repo, change directories
to ``subprojects/amrex`` and run Git commands there, before ``git add
subprojects/amrex``.)

.. note::

    Only update the AMReX submodule reference in coordination with the other
    MFiX-Exa developers!


Few more notes on building MFiX-Exa
-----------------------------------

The system defaults compilers can be overwritten as follows:

.. code:: shell

    > cmake -DCMAKE_CXX_COMPILER=<c++-compiler> -DCMAKE_Fortran_COMPILER=<f90-compiler> [options]  ..

When building on a platform that uses the ``module`` utility, use either
the above command (with full path to the compilers) or the following:

.. code:: shell

    > cmake -DCMAKE_CXX_COMPILER=CC -DCMAKE_Fortran_COMPILER=ftn [options] ..

MFiX-Exa uses the same compiler flags used to build AMReX, unless
``CMAKE_Fortran_FLAGS``/``CMAKE_CXX_FLAGS`` is explicitly provided, or
the environmental variables ``FFLAGS``/``CXXFLAGS`` are set.
