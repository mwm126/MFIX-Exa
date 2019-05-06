.. _Chap:Inputs:

Load Balancing
==============

The following inputs must be preceded by "amr" and determine whether we use the "dual grid" approach.

+----------------------+-----------------------------------------------------------------------+-------------+--------------+
|                      | Description                                                           |   Type      | Default      |
+======================+=======================================================================+=============+==============+
| regrid_int           | How often to regrid (in number of steps at level 0)                   |   Int       |    -1        |
|                      |  if regrid_int = -1 then no regridding will occur                     |             |              |
+----------------------+-----------------------------------------------------------------------+-------------+--------------+
| dual_grid            | If true then use the "dual_grid" approach for load balancing          |   Bool      | False        |
+----------------------+-----------------------------------------------------------------------+-------------+--------------+

The following inputs must be preceded by "mfix" and determine how we create grids and do load balancing:

+----------------------+-----------------------------------------------------------------------+-------------+--------------+
|                      | Description                                                           |   Type      | Default      |
+======================+=======================================================================+=============+==============+
| load_balance_fluid   | Only relevant if (dual_grid); if so do we also regrid mesh data       |  Int        | 1            |
+----------------------+-----------------------------------------------------------------------+-------------+--------------+
| load_balance_type    | What strategy to use for load balancing                               |  String     | FixedSize    |
|                      | Options are "FixedSize", "KDTree" or "Knapsack"                       |             |              |
+----------------------+-----------------------------------------------------------------------+-------------+--------------+
| knapsack_weight_type | What weighting function to use if using Knapsack load balancing       |  String     | RunTimeCosts |
|                      | Options are "RunTimeCosts" or "NumParticles""                         |             |              |
+----------------------+-----------------------------------------------------------------------+-------------+--------------+

