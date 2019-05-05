.. role:: cpp(code)
   :language: c++

.. _Chap:Managing the Grid Hierarchy:

Managing the Grid Hierarchy
===========================

Computational load balancing is based on several different steps:

#. The first component of load balancing is the creation of individual grids, 
   i.e. defining the :cpp:`BoxArray` on which :cpp:`MultiFabs` will be built at each level 

#. The second component is distribution of these grids to MPI processes, 
   i.e. defining the :cpp:`DistributionMapping` with which :cpp:`MultiFabs` at that level will be built.
   How we do this depends on what strategy we specify and what work estimate we use 

.. toctree::
   :maxdepth: 1

   ManagingGridHierarchy
