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

+-------+-----+----+-------+----+----+----------------------+
| Test  |     | nx | bc_x  | Ng | Np | Description          |
|       |     | ny | bc_y  |    |    |                      |
|       |     | nz | bc_z  |    |    |                      |
+=======+=====+====+=======+====+====+======================+
| FLD01 | SGS | 8  | Per   | 1  | 1  | Poiseuille Flow      |
|       |     |    |       |    |    | (periodic)           |
|       | MGS | 4  | NSW   | 2  | 1  |                      |
|       |     |    |       |    |    |                      |
|       | MGP | 4  | Per   | 2  |    |                      |
+-------+-----+----+-------+----+----+----------------------+
| FLD02 | SGS | 80 | MI/PO | 1  | 1  | Couette flow in      |
|       |     |    |       |    |    | rectangular channel  |
|       | MGS | 16 | NSW   | 40 | 1  |                      |
|       |     |    |       |    |    |                      |
|       | MGP | 16 | NSW   | 40 |    |                      |
+-------+-----+----+-------+----+----+----------------------+
| FLD03 | SGS | 8  | PI/PO | 1  | 1  | Poiseuille Flow      |
|       |     |    |       |    |    | (pressure inflow     |
|       | MGS | 8  | NSW   | 4  | 1  | pressure outflow)    |
|       |     |    |       |    |    |                      |
|       | MGP | 4  | Per   | 4  |    |                      |
+-------+-----+----+-------+----+----+----------------------+

Single-grid, single-process (SGS) particle-only tests:

+-------+----+-------+--------+----------------------+
| Test  | nx | bc_x  | Npa    | Description          |
|       | ny | bc_y  |        |                      |
|       | nz | bc_z  |        |                      |
+-------+----+-------+--------+----------------------+
| DEM01 | 2  | NSW   | 1      | Freely falling       |
|       | 5  | Per   |        | particle with        |
|       | 5  | Per   |        | wall collision       |
+-------+----+-------+--------+----------------------+
| DEM02 | 2  | NSW   | 1      | Multiple bounces     |
|       | 5  | Per   |        | with bounce height   |
|       | 5  | Per   |        | measured             |
+-------+----+-------+--------+----------------------+
| DEM03 | 2  | NSW   | 2      | Two stacked          |
|       | 5  | Per   |        | compressed particles |
|       | 5  | Per   |        |                      |
+-------+----+-------+--------+----------------------+
| DEM04 | 4  | NSW   | 1      | Single particle      |
|       | 4  | Per   |        | slipping on a        |
|       | 4  | Per   |        | rough surface        |
+-------+----+-------+--------+----------------------+
| DEM05 | 5  | Per   | 93     | Oblique particle     |
|       | 2  | Per   |        | collisions           |
|       | 5  | Per   |        |                      |
+-------+----+-------+--------+----------------------+


Coupled particle/fluid tests:

+------+-----+----+-------+--------+----+----+----------------------+
| Test |     | nx | bc_x  | Npa    | Ng | Np | Description          |
|      |     | ny | bc_y  |        |    |    |                      |
|      |     | nz | bc_z  |        |    |    |                      |
+------+-----+----+-------+--------+----+----+----------------------+
| DEM06| SGS | 50 | NSW   | 1      | 1  | 1  | Single particle      |
|      |     |    |       |        |    |    | falling under        |
|      | MGS | 5  | NSW   |        | 10 | 1  | gravity, reaching    |
|      |     |    |       |        |    |    | terminal velocity    |
|      | MGP | 5  | NSW   |        | 10 |    |                      |
+------+-----+----+-------+--------+----+----+----------------------+
| DEM07| SGS | 20 | Per   | 1222   | 1  | 1  | Homogeneous          |
|      |     |    |       |        |    |    | cooling system       |
|      | MGS | 20 | Per   |        | 8  | 1  |                      |
|      |     |    |       |        |    |    |                      |
|      | MGP | 20 | Per   |        | 8  |    |                      |
+------+-----+----+-------+--------+----+----+----------------------+
