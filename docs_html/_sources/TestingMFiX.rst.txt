Running the MFIX Test Suite
===========================

MFiX-Exa comes with several tests aimed at evaluating software functionalities.
The source files as well as the required input files for each test are located
in the ``tests`` directory. The ``tests`` directory is copied to the build
directory during MFIX-Exa configuration process. When a test is run (see
below), output files are stored in ``build_dir/tests/test-name``.

There are various dependencies for comparing test results.

* To compare results to archived flow slices stored in ``AUTOTEST``
  directories with the case files, the environment variable ``FEXTRACT``
  must point to the location of the AMReX `fextract` utility located
  in the directory, ``amrex/Tools/PostProcessing/F_Src``. Additionally,
  ``numdiff`` must be installed for comparing results.

* To compare point-by-point field data, the environment variable
  ``FCOMPARE`` must point the AMReX utility ``plt_compare_diff_grids``
  found in the directory, ``amrex/Tools/PostProcessing/F_Src``.
  Additionally, the environment variable ``MFIX_BENCHMARKS_HOME``
  must point to the location of a local regression test data set.
  See :ref:`sec:test:generate_data` for instructions on
  creating a local regression test data set.


Run all tests
^^^^^^^^^^^^^

.. highlight:: bash

::

    cd to mfix-build-dir
    ctest


List all tests (without running them)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. highlight:: bash

::

    cd to mfix-build-dir
    ctest -N


Run a particular test by the index listed in ``ctest -N``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. highlight:: bash

::

    cd to mfix-build-dir
    ctest -I 3,3             # run the third test


Run a particular test by name
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. highlight:: bash

::

    cd to mfix-build-dir
    ctest -R DEM01  # running all tests with "DEM01" in the test name


Run a particular test via make
------------------------------

.. highlight:: bash

::

    cd to mfix-build-dir
    make run_DEM01-x  # running "DEM01-x" and output to the screen


Run specific
^^^^^^^^^^^^

If the environment variable GRID is defined, it specifies which grid types to
run for the test(s).  If GRID variable is not defined, the default is to run
the tests for all grid types.

.. highlight:: bash

::

    env GRID="tiled" ctest -R DEM01  # running all tests with "DEM01" for tiled grid
    env GRID="single multiple" ctest -R DEM01  # running all tests with "DEM01" for single grid and multiple grid
    ctest -R DEM01  # running all tests with "DEM01" for all grid types (single, multiple, tiled)


Run a user-defined case
^^^^^^^^^^^^^^^^^^^^^^^

.. highlight:: bash

::

    ./mfix inputs-myrun

``inputs-myrun`` is a text file containing the AMReX input parameters; this can
be named anything as long as it is the **first** argument following the
executable. Note that many of the problem parameters are still defined in
``mfix.dat``.


Regression testing
------------------

.. _sec:test:generate_data:

Generating local regression test data
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Developers are encouraged to create local benchmark data for regression testing
prior to committing code the GitLab repository.

1. Create a location to store benchmark data and clone the MFiX and AMReX
   repositories.

.. highlight:: bash

::

    mkdir /home/user/exa-rt
    mkdir /home/user/exa-rt/benchmark
    cd /home/user/exa-rt
    git clone http://mfix.netl.doe.gov/gitlab/exa/mfix.git
    git clone https://github.com/AMReX-Codes/amrex.git


2. Create a local copy the regression test setup file from the MFiX repository.

.. highlight:: bash

::

    cp mfix/RegressionTesting/MFIX-tests.ini MFIX-local.ini


3. Edit the local setup file. Specify the top level directories for test and
   web output under the ``[main]`` heading.

.. highlight:: ini

::

    [main]
    testTopDir = /home/user/exa-rt/benchmark
    webTopDir  = /home/user/exa-rt/web


Specify the AMReX source directory location under the ``[AMReX]`` heading.

.. highlight:: ini

::

    [AMReX]
    dir    = /home/user/exa-rt/amrex
    branch = development


Specify the MFIX-Exa source directory location under the ``[source]`` heading.

.. highlight:: ini

::

    [source]
    dir    = /home/user/exa-rt/mfix
    branch = develop


4. Run the AMReX regression test tool. The second argument is a user supplied
   comment.

.. highlight:: bash

::

    cd /home/user/exa-rt
    amrex/Tools/RegressionTesting/regtest.py --make_benchmarks "MFIX" MFIX-local.ini


Prerequisite: Environment Dependencies on Joule (Joule specific)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

For the Joule environment, load the gnu module and set environment variables
first. If not on Joule, skip this step.

.. highlight:: bash

::

    module load gnu/6.1.0
    export CC=/nfs/apps/Compilers/GNU/6.1.0/bin/gcc
    export CXX=/nfs/apps/Compilers/GNU/6.1.0/bin/g++
    export F77=/nfs/apps/Compilers/GNU/6.1.0/bin/gfortran
    export FC=/nfs/apps/Compilers/GNU/6.1.0/bin/gfortran
