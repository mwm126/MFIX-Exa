.. _Chap:CITesting :

Continuous Integration
======================

The following regression tests are run every time a commit is pushed to the main
MFiX-Exa repository on the NETL gitlab.

For each of the tests in the chart below, we have identified the "-x" version
in the table, but each of the tests also has a "-y" version and a "-z" version.

Similarly -- for many of these tests there are multiple versions, 
with the following notations:

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

+-------------------+----+-------+--------+----+----+----------------------+
| Test              | nx | bc_x  | Npa    | Ng | Np | Description          |
|                   | ny | bc_y  |        |    |    |                      |
|                   | nz | bc_z  |        |    |    |                      |
+===================+====+=======+========+====+====+======================+
| FLD01-x:SGS       | 8  | Per   | 0      | 1  | 1  |                      |
|                   |    |       |        |    |    |  Poiseuille Flow     |
| MGS               | 4  | NSW   |        | 2  | 1  |   (periodic)         |
|                   |    |       |        |    |    |                      |
| MGP               | 4  | Per   |        | 2  |    |                      |
+-------------------+----+-------+--------+----+----+----------------------+
| FLD02-x:SGS       | 80 | MI/PO | 0      | 1  | 1  |                      |
|                   |    |       |        |    |    | Flow in              |
| MGS               | 16 | NSW   |        | 40 | 1  | rectangular channel  |
|                   |    |       |        |    |    | with mass inflow     |
| MGP               | 16 | NSW   |        | 40 |    |                      |
+-------------------+----+-------+--------+----+----+----------------------+
| FLD03-x:SGS       | 8  | PI/PO | 0      | 1  | 1  |                      |
|                   |    |       |        |    |    |  Poiseuille Flow     |
| MGS               | 8  | NSW   |        | 4  | 1  |   (pressure          |
|                   |    |       |        |    |    |    inflow / outflow  |
| MGP               | 4  | Per   |        | 4  |    |                      |
+-------------------+----+-------+--------+----+----+----------------------+
| DEM01:SGS         | 2  | NSW   | 1      | 1  | 1  | Particle  only       |
|                   |    |       |        |    |    |                      |
|                   | 5  | Per   |        |    |    |                      |
|                   |    |       |        |    |    |                      |
|                   | 5  | Per   |        |    |    |                      |
+-------------------+----+-------+--------+----+----+----------------------+
| DEM02:SGS         | 2  | NSW   | 1      | 1  | 1  | Particle  only       |
|                   |    |       |        |    |    |                      |
|                   | 5  | Per   |        |    |    |                      |
|                   |    |       |        |    |    |                      |
|                   | 5  | Per   |        |    |    |                      |
+-------------------+----+-------+--------+----+----+----------------------+
| DEM03:SGS         | 2  | NSW   | 2      | 1  | 1  | Particle  only       |
|                   |    |       |        |    |    |                      |
|                   | 5  | Per   |        |    |    |                      |
|                   |    |       |        |    |    |                      |
|                   | 5  | Per   |        |    |    |                      |
+-------------------+----+-------+--------+----+----+----------------------+
| DEM04:SGS         | 4  | NSW   | 1      | 1  | 1  | Particle  only       |
|                   |    |       |        |    |    |                      |
|                   | 4  | Per   |        |    |    |                      |
|                   |    |       |        |    |    |                      |
|                   | 4  | Per   |        |    |    |                      |
+-------------------+----+-------+--------+----+----+----------------------+
| DEM05:SGS         | 5  | Per   | 93     | 1  | 1  | Particle  only       |
|                   | 2  | Per   |        |    |    |                      |
|                   | 5  | Per   |        |    |    |                      |
+-------------------+----+-------+--------+----+----+----------------------+
| DEM06-x:SGS       | 50 | NSW   | 1      | 1  | 1  |                      |
|                   |    |       |        |    |    |  Particle collisions |
| MGS               | 5  | NSW   |        | 10 | 1  |                      |
|                   |    |       |        |    |    |                      |
| MGP               | 5  | NSW   |        | 10 |    |                      |
+-------------------+----+-------+--------+----+----+----------------------+
| DEM07-x           | 20 | Per   | 1222   | 1  | 1  |                      |
|                   |    |       |        |    |    |                      |
| MGS               | 20 | Per   |        | 8  | 1  |                      |
|                   |    |       |        |    |    |                      |
| MGP               | 20 | Per   |        | 8  |    |                      |
+-------------------+----+-------+--------+----+----+----------------------+
