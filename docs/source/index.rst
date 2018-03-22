.. MFiX-Exa documentation master file, created by
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to MFiX-Exa's documentation
===================================

MFiX-Exa is a multi-phase flow simulation tool based on `MFiX-Classic
<http://mfix.netl.doe.gov>`_, incorporating the massively parallel,
block-structured adaptive mesh refinement (AMR) functionality of `AMReX
<http://amrex-codes.github.io>`_. MFiX-Exa is developed at LBNL and NETL, and
as part of the DOE's Exascale Computing Project.

The code for now lives at NETL; instructions for how to get access to the code
will be given below.

.. toctree::
   :maxdepth: 2
   :caption: Contents:

   Introduction
   Particles


See the User's Guide for more about MFiX-Exa
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To build the User's Guide,

.. highlight:: bash

::

    cd doc/UsersGuide
    make

This will build a pdf of the old MFiX-Exa User's Guide, which contains
information about the equations being solved, run-time parameters,
checkpoint/restart capability, options for visualization and more. Most of this
information will enventually be migrated to these help pages.

A pdf version of this guide can be compiled using sphinx using ``latexmk``.
Ensure that you have ``latexmk`` installed on your system [#footnote:latexmk]_.
Then run [#footnote:latex]_:

.. highlight:: bash

::

    make latexpdf


Notice
------

Neither the United States Government nor any agency thereof, nor any of their
employees, makes any warranty, expressed or implied, or assumes any legal
liability or responsibility for the accuracy, completeness, or usefulness of
any information, apparatus, product, or process disclosed or represents that
its use would not infringe privately owned rights.

* MFiX is provided without any user support for applications in the user's
  immediate organization. It should not be redistributed in whole or in part.

* The use of MFIX is to be acknowledged in any published paper based on
  computations using this software by citing the MFIX theory manual. Some of
  the submodels are being developed by researchers outside of NETL. The use of
  such submodels is to be acknowledged by citing the appropriate papers of the
  developers of the submodels.

* The authors would appreciate receiving any reports of bugs or other
  difficulties with the software, enhancements to the software, and accounts of
  practical applications of this software.


Disclaimer
^^^^^^^^^^

This report was prepared as an account of work sponsored by an agency of the
United States Government. Neither the United States Government nor any agency
thereof, nor any of their employees, makes any warranty, express or implied, or
assumes any legal liability or responsibility for the accuracy, completeness,
or usefulness of any information, apparatus, product, or process disclosed, or
represents that its use would not infringe privately owned rights. Reference
herein to any specific commercial product, process, or service by trade name,
trademark, manufacturer, or otherwise does not necessarily constitute or imply
its endorsement, recommendation, or favoring by the United States Government or
any agency thereof. The views and opinions of authors expressed herein do not
necessarily state or reflect those of the United States Government or any
agency thereof.


Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`

.. [#footnote:latexmk] On Ubuntu, ``latexmk`` can be installed using ``apt
    install latexmk``. On macOS, ``latexmk`` installed using the ``TexLive
    Utility`` application.

.. [#footnote:latex] The template used by ``latexmk`` uses the following packages:
        1. tabulary
        2. varwidth
        3. framed
        4. wrapfig
        5. capt-of
        6. needspace
        7. courier
