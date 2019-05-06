.. _Chap:Inputs:

Monitors/User-defined Spatial Averaging
=======================================

The following inputs must be preceded by "amr" and control checkpoint/restart. n is the number of monitors specified. 

+------------------+-----------------------------------------------------------------------+-------------+-----------+
|                  | Description                                                           |   Type      | Default   |
+==================+=======================================================================+=============+===========+
| avg_int          | Interval, in number of CFD dt's, to write output                      |  Int        | -1        |
+------------------+-----------------------------------------------------------------------+-------------+-----------+
| avg_file         | Base file name which is appended with type data type (vel_p, p_g,     |  String     | avg_region|
|                  | ep_g or vel_g), number of this type of averaging and extension, .csv  |             |           |
+------------------+-----------------------------------------------------------------------+-------------+-----------+
| avg_vel_p        | Average and save particle velocity (if 1)                             |  n*Int      | 0         |
+------------------+-----------------------------------------------------------------------+-------------+-----------+
| avg_p_g          | Average and save fluid-phase pressure (if 1)                          |  n*Int      | 0         |
+------------------+-----------------------------------------------------------------------+-------------+-----------+
| avg_ep_g         | Average and save fluid-phase volume fraction (if 1)                   |  n*Int      | 0         |
+------------------+-----------------------------------------------------------------------+-------------+-----------+
| avg_vel_g        | Average and save fluid-phase velocity (if 1)                          |  n*Int      | 0         |
+------------------+-----------------------------------------------------------------------+-------------+-----------+
| avg_region_x_w   | Lower bound of averaging region in x-direction                        |  n*Real     | None      |
+------------------+-----------------------------------------------------------------------+-------------+-----------+
| avg_region_x_e   | Upper bound of averaging region in x-direction                        |  n*Real     | None      |
+------------------+-----------------------------------------------------------------------+-------------+-----------+
| avg_region_y_s   | Lower bound of averaging region in y-direction                        |  n*Real     | None      |
+------------------+-----------------------------------------------------------------------+-------------+-----------+
| avg_region_y_n   | Upper bound of averaging region in y-direction                        |  n*Real     | None      |
+------------------+-----------------------------------------------------------------------+-------------+-----------+
| avg_region_z_b   | Lower bound of averaging region in z-direction                        |  n*Real     | None      |
+------------------+-----------------------------------------------------------------------+-------------+-----------+
| avg_region_z_t   | Upper bound of averaging region in z-direction                        |  n*Real     | None      |
+------------------+-----------------------------------------------------------------------+-------------+-----------+



.. comment::

  amr.avg_int = 10
  amr.avg_file = "uio"

  amr.avg_vel_p =        1       0        0
  amr.avg_p_g   =        0       1        1
  amr.avg_ep_g  =        0       0        0
  amr.avg_vel_g =        0       0        0

  amr.avg_region_x_w =   0.000   0.0000   0.0002
  amr.avg_region_x_e =   0.008   0.0000   0.0002
  amr.avg_region_y_s =   0.000   0.000    0.000
  amr.avg_region_y_n =   0.002   0.002    0.002
  amr.avg_region_z_b =   0.000   0.000    0.000
  amr.avg_region_z_t =   0.002   0.002    0.002












