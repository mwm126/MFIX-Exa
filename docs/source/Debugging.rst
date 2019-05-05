.. role:: cpp(code)
   :language: c++

.. _Chap:Debugging:

Debugging
=========

Debugging is an art.  Everyone has their own favorite method.  Here we
offer a few tips we have found to be useful.

Compiling in debug mode (e.g., :cpp:`make DEBUG=TRUE`) and running with
:cpp:`amrex.fpe_trap_invalid=1` in the inputs file can be helpful.
In debug mode, many compiler debugging flags are turned on and all
:cpp:`MultiFab`s are initialized to signaling NaNs.  The
:cpp:`amrex.fpe_trap_invalid` parameter will result in backtrace files
when a floating point exception occurs.  One can then examine those
files to track down the origin of the issue.

Writing a :cpp:`MultiFab` to disk with

.. highlight:: c++

::

    VisMF::Write(const FabArray<FArrayBox>& mf, const std::string& name);

and examining it with ``Amrvis`` (section :ref:`sec:amrvis` in the AMReX documeintation) 
can be helpful as well.  

You can also use the :cpp:`print_state` routine: 

.. highlight:: c++

::

    void print_state(const MultiFab& mf, const IntVect& cell, const int n=-1);

which outputs the data for a single cell.

Valgrind is another useful debugging tool.  Note that for runs using
more than one MPI process, one can tell valgrind to output to different 
files for different processes.  For example,

.. highlight:: console

::

    mpiexec -n 4 valgrind --leak-check=yes --track-origins=yes --log-file=vallog.%p ./mfix.exe ...
