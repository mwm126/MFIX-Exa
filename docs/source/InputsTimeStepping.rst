.. sec:InputsTimeStepping:

Time Stepping
=============

The following inputs must be preceded by "amr."   Note that if both are specified, both criteria
are used and the simulation still stop when the first criterion is hit.  In the case of unsteady flow,
the simulation will stop when either the number of steps reaches max_step or time reaches stop_time.
In the case of unsteady flow, the simulation will stop when either the tolerance (difference between
subsequent steps) is reached or the number of iterations reaches the maximum number specified.

+------------------+-----------------------------------------------------------------------+-------------+-----------+
|                  | Description                                                           |   Type      | Default   |
+==================+=======================================================================+=============+===========+
| max_step         | Maximum number of time steps to take                                  |    Int      |  -1       |
+------------------+-----------------------------------------------------------------------+-------------+-----------+
| stop_time        | Maximum time to reach                                                 |    Real     | -1.0      |
+------------------+-----------------------------------------------------------------------+-------------+-----------+

The following inputs must be preceded by "mfix."

+----------------------+-----------------------------------------------------------------------+-------------+--------------+
|                      | Description                                                           |   Type      | Default      |
+======================+=======================================================================+=============+==============+
| fixed_dt             | Should we use a fixed timestep?                                       |    Int      |   0          |
+----------------------+-----------------------------------------------------------------------+-------------+--------------+
| dt_min               | Abort if dt gets smaller than this value                              |    Real     |  1.e-6       |
+----------------------+-----------------------------------------------------------------------+-------------+--------------+
| dt_max               | Maximum value of dt if calculating with cfl                           |    Real     |  1.e14       |
+----------------------+-----------------------------------------------------------------------+-------------+--------------+
| cfl                  | CFL constraint (dt < cfl * dx / u) if fixed_dt not 1                  |    Real     |   0.5        |
+----------------------+-----------------------------------------------------------------------+-------------+--------------+

The following inputs must be preceded by "mfix" and are only relevant if running a problem to steady state.
Currently, the criterion for setting "steady_state" to true is if "dt" is undefined in mfix.dat

+-----------------------+-----------------------------------------------------------------------+-------------+------------+
|                       | Description                                                           |   Type      | Default    |
+=======================+=======================================================================+=============+============+
| steady_state_tol      | Tolerance for checking if we have reached steady state                |   Real      | 1.e-5      |
+-----------------------+-----------------------------------------------------------------------+-------------+------------+
| steady_state_max_iter | Maximum number of allowed iterations to converge to steady state      |   Int       | 100000000  |
+-----------------------+-----------------------------------------------------------------------+-------------+------------+


Setting the Time Step 
=====================

There are several ways that the inputs are used to determine what time step 
is used in the evolution of the fluid-particle system in MFiX-Exa.   

1) In a pure particle case, the "mfix.fixed_dt", if specified, is only used to determine the frequency
of outputs, it has no effect on the dt used in the particle evaluation.  [WHAT HAPPENS IF FIXED_DT 
NOT SPECIFIED?]

That is determined by the following calculation:

2) In a pure fluid case, there are two options:

  * If you want to fix the dt, simply set :cpp:`mfix.fixed_dt = XXX` and the fluid time
    step will always be that number.  [SHOULD WE ABORT IF YOU ALSO SET CFL?  OR SPECIFY
    THAT FIXED_DT OVERRIDES CFL?]

  * If you want to let the code determine the appropriate time step using the advective CFL
    condition, then set :cpp:`mfix.cfl = 0.5` for example, and the fluid time step will
    be computed to be dt = 0.5 * dx / max(vel).

Note that these choices apply to steady state calculations as well as unsteady runs.


3) In a coupled particle-fluid case, dt is set as in the pure-fluid case.  In this case
   the particle time step is first computed as in the particle-only case, then is adjusted
   so that an integral number of particle steps fit into a single fluid time step.

[HOW ARE DT_MIN AND DT_MAX USED???]
