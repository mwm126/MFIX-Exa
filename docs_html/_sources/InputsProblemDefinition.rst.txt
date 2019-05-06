Problem Definition
==================

The following inputs must be preceded by "amr."

+-------------------+-----------------------------------------------------------------------+-------------+-----------+
|                   | Description                                                           |   Type      | Default   |
+===================+=======================================================================+=============+===========+
| max_level         | Maximum level of refinement allowed (0 when single-level)             |    Int      | None      |
+-------------------+-----------------------------------------------------------------------+-------------+-----------+
| n_cell            | Number of cells at level 0 in each coordinate direction               |    Int      | None      |
+-------------------+-----------------------------------------------------------------------+-------------+-----------+
| max_grid_size_x   | Maximum number of cells at level 0 in each grid in x-direction        |    Int      | 32        |
+-------------------+-----------------------------------------------------------------------+-------------+-----------+
| max_grid_size_y   | Maximum number of cells at level 0 in each grid in y-direction        |    Int      | 32        |
+-------------------+-----------------------------------------------------------------------+-------------+-----------+
| max_grid_size_z   | Maximum number of cells at level 0 in each grid in z-direction        |    Int      | 32        |
+-------------------+-----------------------------------------------------------------------+-------------+-----------+
| blocking_factor_x | Each grid must be divisible by blocking_factor_x in x-direction       |    Int      |  8        |
+-------------------+-----------------------------------------------------------------------+-------------+-----------+
| blocking_factor_y | Each grid must be divisible by blocking_factor_y in y-direction       |    Int      |  8        |
+-------------------+-----------------------------------------------------------------------+-------------+-----------+
| blocking_factor_z | Each grid must be divisible by blocking_factor_z in z-direction       |    Int      |  8        |
+-------------------+-----------------------------------------------------------------------+-------------+-----------+

The following inputs must be preceded by "geometry."

+-----------------+-----------------------------------------------------------------------+-------------+-----------+
|                 | Description                                                           |   Type      | Default   |
+=================+=======================================================================+=============+===========+
| coord_sys       | 0 for Cartesian                                                       |   Int       |   0       |
+-----------------+-----------------------------------------------------------------------+-------------+-----------+
| is_periodic     | 1 for true, 0 for false (one value for each coordinate direction)     |   Ints      | 0 0 0     |
+-----------------+-----------------------------------------------------------------------+-------------+-----------+
| prob_lo         | Low corner of physical domain (physical not index space)              |   Reals     | None      |
+-----------------+-----------------------------------------------------------------------+-------------+-----------+
| prob_hi         | High corner of physical domain (physical not index space)             |   Reals     | None      |
+-----------------+-----------------------------------------------------------------------+-------------+-----------+

The following inputs must be preceded by "mfix."

+----------------------+-----------------------------------------------------------------------+-------------+--------------+
|                      | Description                                                           |   Type      | Default      |
+======================+=======================================================================+=============+==============+
| geometry             | Which type of EB geometry are we using?                               |   String    |              |
+----------------------+-----------------------------------------------------------------------+-------------+--------------+

Setting basic EB walls can be specified by inputs preceded by "xlo", "xhi", "ylo", "yhi", "zlo", and "zhi"

+--------------------+---------------------------------------------------------------------------+-------------+-----------+
|                    | Description                                                               |   Type      | Default   |
+====================+===========================================================================+=============+===========+
| type               | Used to define boundary type. Available options include:                  |  String     |  None     |
|                    |                                                                           |             |           |
|                    | * 'pi'  or 'pressure_inflow'                                              |             |           |
|                    | * 'po'  or 'pressure_outflow'                                             |             |           |
|                    | * 'mi'  or 'mass_inflow'                                                  |             |           |
|                    | * 'nsw' or 'no_slip_wall'                                                 |             |           |
+--------------------+---------------------------------------------------------------------------+-------------+-----------+
| pressure           | Sets boundary pressure for pressure inflows, outflows and mass inflows    |    Real     |  None     |
+--------------------+---------------------------------------------------------------------------+-------------+-----------+
| velocity           | Sets boundary velocity for mass inflows                                   |    Real     |  None     |
+--------------------+---------------------------------------------------------------------------+-------------+-----------+
| location           | Specifies an offset from the domain boundary for no-slip walls            |    Real     |  None     |
+--------------------+---------------------------------------------------------------------------+-------------+-----------+

To specify multiple mass inflows (e.g., define a jet and uniform background flow), provide multiple velocities for the region and define the physical extents of the sub-region. The first velocity is applied to the entire flow plane. Subsequent velocities are successively applied to the specified sub-regions. If multiple sub-regions overlap, the velocity of last specified region is used. An example of a uniform mass inflow with a square-jet centered at (0.5x0.5) is given below.


.. code-block:: none

   xlo.type = "mi"
   xlo.velocity = 0.01  0.10

   xlo.ylo =            0.25
   xlo.yhi =            0.75
   xlo.zlo =            0.25
   xlo.zhi =            0.75
