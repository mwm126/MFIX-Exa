.. _Chap:NightlyTesting :

Nightly Tests
=============

The following regression tests are run nightly with MFiX-Exa.   The plotfiles generated in each night's test 
are compared with the benchmark plotfiles using the AMReX :cpp:`fcompare` utility to compare the mesh data
and :cpp:`particle_compare` to compare the particle data.

The results of these tests can be found at https://ccse.lbl.gov/pub/RegressionTesting/MFIX-Exa/

Below Ng = number of grids, Np = number of MPI ranks.

+-------------------+----+-------+------+--------+----+----+--------------------------+
| Test              | nx | bc_x  | EB   | Npart  | Ng | Np | What does this test?     |
|                   | ny | bc_y  |      |        |    |    |                          |
|                   | nz | bc_z  |      |        |    |    |                          |
+===================+====+=======+======+========+====+====+==========================+
| BENCH01-Size0001  | 32 | Per   | None | 5005   | 1  | 1  | Triply periodic          |
|                   | 32 | Per   |      |        |    |    |                          |
|                   | 32 | Per   |      |        |    |    |                          |
+-------------------+----+-------+------+--------+----+----+--------------------------+
| BENCH01-Size0001  | 64 | Per   | None | 40040  | 8  | 4  | Replicate                |
|  replicate        | 64 | Per   |      |        |    |    |                          |
|                   | 64 | Per   |      |        |    |    |                          |
+-------------------+----+-------+------+--------+----+----+--------------------------+
| BENCH01-Size0001  | 32 | Per   | None | 5005   | 8  | 4  | Restart                  |
|  restart          | 32 | Per   |      |        |    |    |                          |
|                   | 32 | Per   |      |        |    |    |                          |
+-------------------+----+-------+------+--------+----+----+--------------------------+
| BENCH02-Size0001  | 10 | Per   | None | 1611   | 1  | 1  | NSW with periodic        |
|                   | 10 | NSW   |      |        |    |    |                          |
|                   | 10 | Per   |      |        |    |    |                          |
+-------------------+----+-------+------+--------+----+----+--------------------------+
| BENCH03-Size0001  |  4 | Per   | None | 2500   | 1  | 1  | MI/PO with periodic      |
|                   | 50 | MI/PO |      |        |    |    |                          |
|                   |  4 | Per   |      |        |    |    |                          |
+-------------------+----+-------+------+--------+----+----+--------------------------+
| BENCH04-Size0001  |  4 | Per   | None | 224    | 1  | 1  | Triply periodic          |
|                   | 50 | Per   |      |        |    |    |                          |
|                   |  4 | Per   |      |        |    |    |                          |
+-------------------+----+-------+------+--------+----+----+--------------------------+
| BENCH05-Size0008  | 40 | MI/PI | Cyl  | 7949   | 4  | 4  | EB -- parallel           |
|                   | 10 |   IG  |      | (Auto) |    |    |                          |
|                   | 10 |   IG  |      |      ) |    |    |                          |
+-------------------+----+-------+------+--------+----+----+--------------------------+
| BENCH05-Size0008  | 40 | MI/PI | Cyl  | 7968   | 4  | 1  | EB -- serial             |
|  serial           | 10 |    IG |      | (Auto) |    |    |                          |
|                   | 10 |    IG |      |        |    |    |                          |
+-------------------+----+-------+------+--------+----+----+--------------------------+
| BENCH05-Size0008  | 40 | MI/PI | Cyl  | 157106 | 16 | 4  | Regrid & dual grid       |
|  wide             | 40 |   IG  |      | (Auto) |    |    |                          |
|                   | 40 |   IG  |      |        |    |    |                          |
+-------------------+----+-------+------+--------+----+----+--------------------------+
| BENCH06-Size0008  | 40 |  Per  | Cyl  | 627    | 4  | 1  | EB -- serial             |
|  serial           | 10 |   IG  |      | (Auto) |    |    | with periodic            |
|                   | 10 |   IG  |      |        |    |    |                          |
+-------------------+----+-------+------+--------+----+----+--------------------------+
| BENCH06-Size0008  | 40 |  Per  | Cyl  | 624    | 4  | 4  | EB -- parallel           |
|                   | 10 |   IG  |      | (Auto) |    |    | with periodic            |
|                   | 10 |   IG  |      |        |    |    |                          |
+-------------------+----+-------+------+--------+----+----+--------------------------+
| DEM01-x_single    |  4 |  NSW  | None |   1    | 1  | 1  | Particle  only           |
|                   |  4 |  NSW  |      |        |    |    |                          |
|                   |  4 |  NSW  |      |        |    |    |                          |
+-------------------+----+-------+------+--------+----+----+--------------------------+
| DEM03-z_single    |  5 |  Per  | None |   2    | 1  | 1  | Particles only           |
|                   |  5 |  Per  |      |        |    |    |                          |
|                   |  2 |  NSW  |      |        |    |    |                          |
+-------------------+----+-------+------+--------+----+----+--------------------------+
| DEM04-z_single    |  4 |  NSW  | None |   1    | 1  | 1  | Particle  only           |
|                   |  4 |  Per  |      |        |    |    |                          |
|                   |  4 |  Per  |      |        |    |    |                          |
+-------------------+----+-------+------+--------+----+----+--------------------------+
| DEM05-z_single    |  5 |  Per  | None |   93   | 1  | 1  | Particle  only           |
|   LSD             |  2 |  Per  |      |        |    |    |                          |
|                   |  5 |  Per  |      |        |    |    |                          |
+-------------------+----+-------+------+--------+----+----+--------------------------+
| DEM06-z_multiple  |  5 |  Per  | None |   1    | 10 | 4  | Particle  only           |
|                   |  5 |  Per  |      |        |    |    |                          |
|                   | 50 |  NSW  |      |        |    |    |                          |
+-------------------+----+-------+------+--------+----+----+--------------------------+
