Building MFiX-Exa with CMake
============================

To build MFiX-Exa, first get the source, run ``cmake`` to configure and generate
Makefiles, and run ``make`` to build MFiX-Exa.

Throughout this section, ``builddir`` will be used as the name of the directory
used for building MFiX-Exa.


Getting the Source
------------------

Use Git to clone MFiX-Exa from the Gitlab repository. (Requires a user account
for the NETL MFiX-Exa Gitlab server.)

.. code:: shell

    > git clone http://mfix.netl.doe.gov/gitlab/exa/mfix.git
    > cd mfix

The rest of the build instructions assume that the current directory is
``mfix``, the top directory of the MFiX-Exa repo.


Default AMReX (recommended)
~~~~~~~~~~~~~~~~~~~~~~~~~~~

By default, AMReX is downloaded and built as part of the MFiX-Exa build process
(**SUPERBUILD** mode). This method is recommended to ensure the
configuration options for MFiX-Exa and AMReX are compatible.

Proceed to :ref:`Configuring`.

.. note::

      When running ``cmake``, ``subprojects/amrex`` will be cloned from
      https://github.com/AMReX-Codes/amrex if it does not already exist. You can
      also clone it manually if you want:

      .. code:: shell

          > git submodule update --init --recursive  #  OPTIONAL: cmake will do this automatically

Custom AMReX
~~~~~~~~~~~~

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

The ``my-amrex-branch`` will then be used when building MFiX-Exa.

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

To update the AMReX submodule reference by MFiX-Exa:

.. code:: shell

    > git add subprojects/amrex
    > git commit -m 'Updating AMReX version'

This will only update the AMReX SHA-1 referenced by MFiX-Exa. Uncommitted AMReX
changes and untracked AMReX files under ``subprojects/amrex`` are not added by
``git add subprojects/amrex``. Change directories to ``subprojects/amrex`` and
commit any AMReX changes first before ``git add subprojects/amrex``.

.. note::

    Only update the AMReX submodule reference in coordination with the other
    MFiX-Exa developers!

Proceed to :ref:`Configuring`.


.. _external_amrex:

External AMReX
~~~~~~~~~~~~~~

It is also possible to build MFiX-Exa with an existing AMReX installation.

For instructions on building AMReX with CMake, refer to the `AMReX user guide
<https://amrex-codes.github.io/amrex/docs_html/BuildingAMReX.html#building-with-cmake>`_

When building AMReX, the options ``ENABLE\_PARTICLES=yes``,
``ENABLE\_AMRDATA=yes``, and ``ENABLE\_EB=yes`` are required by MFiX-Exa.

.. highlight:: console

::

    > cd /path/to/amrex/source
    > cmake -S . -B build \
          -DENABLE_PARTICLES=yes \
          -DENABLE_AMRDATA=yes \
          -DENABLE_EB=yes \
          [other amrex options] \
          -DCMAKE_INSTALL_PREFIX:PATH=/absolute/path/to/installdir
    > make -C build install

If AMReX is built with the option:

.. highlight:: console

::

    -DCMAKE_INSTALL_PREFIX:PATH=/absolute/path/to/amrex/installdir

Then MFiX-Exa should set ``AMREX_ROOT`` to that directory when running
``cmake``:

.. highlight:: console

::

    -DAMREX_ROOT=/absolute/path/to/amrex/installdir

Proceed to :ref:`Configuring`.


.. _Configuring:

Configuring and Generating Makefiles
------------------------------------

Run ``cmake`` to generate Makefiles for building MFiX-Exa:

.. highlight:: console

::

    > cmake -S . -B builddir

Proceed to :ref:`Building`.

.. note::

    By default MFiX-Exa is built with MPI support. Use ``-DENABLE_MPI=NO`` to
    build without MPI.


Specifying Options
~~~~~~~~~~~~~~~~~~

.. highlight:: console

::

    > cmake -S . -B builddir \
        [amrex options] \
        [mfix options]


In the above snippet, ``[amrex options]`` is a list of any of the AMReX
configuration options listed in the `AMReX User Guide.
<https://amrex-codes.github.io/amrex/docs_html/BuildingAMReX.html#building-with-cmake>`_
``[mfix options]`` indicates any of the configuration option listed in the table
below.

+-------------------------+----------------------------+--------------------------------+----------+
| Option name             | Description                | Possible values                | Default  |
|                         |                            |                                | value    |
+=========================+============================+================================+==========+
| ``CMAKE_BUILD_TYPE``    | Debug vs Release build     |  Debug, Release, RelWithDebInfo| Release  |
+-------------------------+----------------------------+--------------------------------+----------+
| ``CMAKE_Fortran_FLAGS`` | User-defined Fortran flags | See your compiler manual       | None     |
+-------------------------+----------------------------+--------------------------------+----------+
| ``CMAKE_CXX_FLAGS``     | User-defined C++ flags     | See your compiler manual       | None     |
+-------------------------+----------------------------+--------------------------------+----------+
| ``CMAKE_CUDA_FLAGS``    | User-defined CUDA flags    | See your compiler manual       | None     |
+-------------------------+----------------------------+--------------------------------+----------+
| ``ENABLE_MPI``          | Enable MPI support         | no/yes                         | yes      |
+-------------------------+----------------------------+--------------------------------+----------+
| ``ENABLE_OMP``          | Enable OpenMP support      | no/yes                         | no       |
+-------------------------+----------------------------+--------------------------------+----------+
| ``ENABLE_CUDA``         | Enable CUDA support        | no/yes                         | no       |
+-------------------------+----------------------------+--------------------------------+----------+
| ``ENABLE_HYPRE``        | Enable HYPRE support       | no/yes                         | no       |
+-------------------------+----------------------------+--------------------------------+----------+
| ``ENABLE_FPE``          | Build with Floating-Point  | no/yes                         | no       |
|                         | Exceptions checks          |                                |          |
+-------------------------+----------------------------+--------------------------------+----------+


Specifying Compilers
~~~~~~~~~~~~~~~~~~~~

The default system default compilers can be overwritten as follows:

.. code:: shell

    > cmake -S . -B builddir \
          -DCMAKE_CXX_COMPILER=<c++-compiler> \
          -DCMAKE_Fortran_COMPILER=<f90-compiler>

.. note::

    If ``ENABLE_MPI`` is set (the default), then ``CMAKE_CXX_COMPILER`` should
    be a compiler wrapper such as ``mpic++``, or there will likely be build
    errors. Likewise, ``CMAKE_Fortran_COMPILER`` should be set to ``mpifort``
    (or whatever is your MPI Fortran wrapper).


Specifying external AMReX
~~~~~~~~~~~~~~~~~~~~~~~~~

If building with :ref:`external_amrex`, specify the path to AMReX with
``-DAMREX_ROOT``:

.. highlight:: console

::

    > cmake -S . -B builddir \
        -DAMREX_ROOT=/absolute/path/to/amrex/installdir

Passing ``-DAMREX_ROOT=/absolute/path/to/amrex/installdir`` instructs CMake to
search ``/absolute/path/to/amrex/installdir``, and then search system paths, for
an available AMReX installation.

Alternatively, set the ``AMREX_ROOT`` environmental variable instead of passing
it as a command line option.

.. note::

   MFiX-Exa needs to be built with the same CMake options used to build the
   external AMReX installation. This is another reason when the default
   (Superbuild) option is recommended.


.. _Building:

Building
--------

To build MFiX-Exa:

.. code:: shell

    > make -C builddir

To build all test cases:

.. code:: shell

    > make -C builddir build_tests
