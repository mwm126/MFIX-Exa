.. _Chap:CITesting :

Continuous Integration
======================

The following regression tests are run every time a commit is pushed to the main
MFiX-Exa repository on the NETL gitlab.

For each of the tests in the chart below, there are
three directional variations; these are identified in the repository as, 
for example, FLD01-x, FLD01-y, and FLD01-z.  

For each direction, where appropriate, there are multiple versions, with the following notations:

  * SGS: single grid serial

  * MGS: multiple grid serial

  * TGS: tiled grid serial

  * MGP: multiple grid parallel

Below Ng = number of grids, Npa = number of particles, Np = number of MPI ranks.

All the FLD cases are fluid-only.
All the DEM cases are particle-only except for DEM06 and DEM07 which are fluid and particles;
these both use the "BVK2" drag type.
In all cases the particle data were read in from "particle_input.dat"

None of these tests have non-rectangular geometry.

"NSW" means "No Slip Wall" and "Per" is "periodic."
"MI/PO" refers to Mass     Inflow at the low end of the domain and Pressure Outflow at the high end.
"PI/PO" refers to Pressure Inflow at the low end of the domain and Pressure Outflow at the high end.

Additional detail about these problems is given in tests/README.md

Fluid-only tests:

+-------+----------+----------------+-----+----+-----------------+
| Test  | nx ny nz | bc_x bc_y bc_z | Ng  | Np | Description     |
+=======+==========+================+=====+====+=================+
| FLD01 | 8  4  4  |  Per NSW Per   |     |    |                 |
+-------+----------+----------------+-----+----+-----------------+
|       | SGS      |                |  1  | 1  | Poiseuille Flow |
|       |          |                |     |    | (periodic)      |
|       | MGS      |                |  2  | 1  |                 |
|       |          |                |     |    |                 |
|       | MGP      |                |  2  | X  |                 |
+-------+----------+----------------+-----+----+-----------------+
| FLD02 | 80 16 16 | MI/PO NSW NSW  |     | 1  |                 |
+-------+----------+----------------+-----+----+-----------------+
|       | SGS      |                |  1  | 1  | Couette flow in |
|       |          |                |     |    | rectangular     |
|       | MGS      |                |  40 | 1  | channel         |
|       |          |                |     |    |                 |
|       | MGP      |                |  40 | X  |                 |
+-------+----------+----------------+-----+----+-----------------+
| FLD03 | 8  8  4  |  PI/PO NSW Per |     |    |                 |
+-------+----------+----------------+-----+----+-----------------+
|       | SGS      |                |  1  | 1  | Poiseuille Flow |
|       |          |                |     |    | (pressure       |
|       | MGS      |                |  4  | 1  | inflow /        |
|       |          |                |     |    | pressure        |
|       | MGP      |                |  4  | X  | outflow)        |
+-------+----------+----------------+-----+----+-----------------+

Single-grid, single-process (SGS) particle-only tests:

+-------+----------+----------------+-----+--------------------+
| Test  | nx ny nz | bc_x bc_y bc_z | Npa | Description        |
+=======+==========+================+=====+====================+
| DEM01 | 2 5 5    | NSW Per Per    | 1   | Freely falling     |
|       |          |                |     | particle with      |
|       |          |                |     | wall collision     |
+-------+----------+----------------+-----+--------------------+
| DEM02 | 2 5 5    | NSW Per Per    | 1   | Multiple bounces   |
|       |          |                |     | with bounce height |
|       |          |                |     | measured           |
+-------+----------+----------------+-----+--------------------+
| DEM03 | 2 5 5    | NSW Per Per    | 2   | Two stacked        |
|       |          |                |     | compressed         |
|       |          |                |     | particles          |
+-------+----------+----------------+-----+--------------------+
| DEM04 | 4 4 4    | NSW Per Per    | 1   | Single particle    |
|       |          |                |     | slipping on a      |
|       |          |                |     | rough surface      |
+-------+----------+----------------+-----+--------------------+
| DEM05 | 5 2 5    | Per Per Per    | 93  | Oblique particle   |
|       |          |                |     | collisions         |
|       |          |                |     |                    |
+-------+----------+----------------+-----+--------------------+


Coupled particle/fluid tests:

+-------+-----+----------+----------------+------+----+----+----------------------+
| Test  |     | nx ny nz | bc_x bc_y bc_z | Npa  | Ng | Np | Description          |
+=======+=====+==========+================+======+====+====+======================+
| DEM06 |     | 50 5 5   | NSW NSW NSW    | 1    |    |    |                      |
+-------+-----+----------+----------------+------+----+----+----------------------+
|       | SGS |          |                |      | 1  | 1  | Single particle      |
|       |     |          |                |      |    |    | falling under        |
|       | MGS |          |                |      | 10 | 1  | gravity, reaching    |
|       |     |          |                |      |    |    | terminal velocity    |
|       | MGP |          |                |      | 10 | X  |                      |
+-------+-----+----------+----------------+------+----+----+----------------------+
| DEM07 |     | 20 20 20 | Per Per Per    | 1222 |    |    |                      |
+-------+-----+----------+----------------+------+----+----+----------------------+
|       | SGS |          |                |      | 1  | 1  | Homogeneous          |
|       |     |          |                |      |    |    | cooling system       |
|       | MGS |          |                |      | 8  | 1  |                      |
|       |     |          |                |      |    |    |                      |
|       | MGP |          |                |      | 8  | X  |                      |
+-------+-----+----------+----------------+------+----+----+----------------------+
