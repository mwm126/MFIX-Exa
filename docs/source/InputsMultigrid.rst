.. _Chap:InputsMultigrid:

Multigrid Inputs
================

The following inputs can be set directly in the AMReX solver classes but we 
set them via the MFiX-Exa routines because we may want different inputs for the 
differnt solvers called by MFiX-Exa.

These control the nodal projection and must be preceded by "mfix":

+-------------------------+-----------------------------------------------------------------------+-------------+--------------+
|                         |  Description                                                          |   Type      | Default      |
+-------------------------+-----------------------------------------------------------------------+-------------+--------------+
| mg_verbose              |  Verbosity of multigrid solver in nodal projection                    |    Int      |   0          |
+-------------------------+-----------------------------------------------------------------------+-------------+--------------+
| mg_cg_verbose           |  Verbosity of BiCGStab solver in nodal projection                     |    Int      |   0          |
+-------------------------+-----------------------------------------------------------------------+-------------+--------------+
| mg_rtol                 |  Relative tolerance in nodal projection                               |    Real     |   1.e-11     | 
+-------------------------+-----------------------------------------------------------------------+-------------+--------------+
| mg_atol                 |  Absolute tolerance in nodal projection                               |    Real     |   1.e-14     | 
+-------------------------+-----------------------------------------------------------------------+-------------+--------------+
| mg_maxiter              |  Maximum number of iterations in the nodal projection                 |    Int      |              | 
+-------------------------+-----------------------------------------------------------------------+-------------+--------------+
| mg_cg_maxiter           |  Maximum number of iterations in the nodal projection                 |    Int      |              | 
|                         |  bottom solver if using bicg, cg, bicgcg or cgbicg                    |             |              |
+-------------------------+-----------------------------------------------------------------------+-------------+--------------+
| mg_max_coarsening_level |  Maximum number of coarser levels to allowin the nodal projection     |    Int      |              | 
|                         |  If set to 0, the bottom solver will be called at the current level   |             |              |
+-------------------------+-----------------------------------------------------------------------+-------------+--------------+
| bottom_solver_type      |  Which bottom solver to use in the nodal projection                   |  String     |   bicgcg     |
|                         |  Options are bicgstab, cg, cgbicg, smoother or hypre                  |             |              | 
+-------------------------+-----------------------------------------------------------------------+-------------+--------------+

These control the MAC projection and must be preceded by "mac":

+-------------------------+-----------------------------------------------------------------------+-------------+--------------+
|                         | Description                                                           |   Type      | Default      |
+======================+=======================================================================+=============+=================+
| mg_verbose              |  Verbosity of multigrid solver in MAC projection                      |    Int      |   0          |
+-------------------------+-----------------------------------------------------------------------+-------------+--------------+
| mg_cg_verbose           |  Verbosity of BiCGStab solver in MAC projection                       |    Int      |   0          |
+-------------------------+-----------------------------------------------------------------------+-------------+--------------+
| mg_rtol                 |  Relative tolerance in MAC projection                                 |    Real     |   1.e-11     | 
+-------------------------+-----------------------------------------------------------------------+-------------+--------------+
| mg_atol                 |  Absolute tolerance in MAC projection                                 |    Real     |   1.e-14     | 
+-------------------------+-----------------------------------------------------------------------+-------------+--------------+
| mg_maxiter              |  Maximum number of iterations in the MAC projection                   |    Int      |              | 
+-------------------------+-----------------------------------------------------------------------+-------------+--------------+
| mg_cg_maxiter           |  Maximum number of iterations in the MAC projection                   |    Int      |              | 
|                         |  bottom solver if using bicg, cg, bicgcg or cgbicg                    |             |              |
+-------------------------+-----------------------------------------------------------------------+-------------+--------------+
| mg_max_coarsening_level |  Maximum number of coarser levels to allow in the nodal projection    |    Int      |              | 
|                         |  If set to 0, the bottom solver will be called at the current level   |             |              |
+-------------------------+-----------------------------------------------------------------------+-------------+--------------+
| bottom_solver_type      |  Which bottom solver to use in the MAC projection                     |  String     |   bicgcg     |
|                         |  Options are bicgstab, cg, cgbicg, smoother or hypre                  |             |              | 
+-------------------------+-----------------------------------------------------------------------+-------------+--------------+

These control the diffusion solver and must be preceded by "diff":
The following inputs must be preceded by "diff" 

+----------------------+-----------------------------------------------------------------------+-------------+--------------+
|                      | Description                                                           |   Type      | Default      |
+======================+=======================================================================+=============+==============+
| mg_verbose           |  Verbosity of linear solver for diffusion solve                       |    Int      |   0          |
+----------------------+-----------------------------------------------------------------------+-------------+--------------+
| mg_cg_verbose        |  Verbosity of BiCGStab solver in diffusion solve                      |    Int      |   0          |
+----------------------+-----------------------------------------------------------------------+-------------+--------------+
| mg_rtol              |  Relative tolerance in diffusion solve                                |    Real     |   1.e-11     | 
+----------------------+-----------------------------------------------------------------------+-------------+--------------+
| mg_atol              |  Absolute tolerance in diffusion solve                                |    Real     |   1.e-14     | 
+----------------------+-----------------------------------------------------------------------+-------------+--------------+
| bottom_solver_type   |  Which bottom solver to use in the diffusion solve                    |  String     |   bicgcg     |
|                      |  Options are bicgstab, cg, cgbicg, smoother or hypre                  |             |              | 
+----------------------+-----------------------------------------------------------------------+-------------+--------------+
