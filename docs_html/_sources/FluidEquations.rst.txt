Here we describe the fluid variables, the governing equations, and the time discretization
of the fluid evolution.

Fluid Variables
===============

   +-----------------------+--------------------------------------------------+
   | Variable              | Definition                                       |
   +=======================+==================================================+
   | :math:`\rho_g`        | Fluid density                                    |
   +-----------------------+--------------------------------------------------+
   | :math:`\varepsilon_g` | Volume fraction of fluid (= 1 if no particles)   |
   +-----------------------+--------------------------------------------------+
   | :math:`U_g`           | Fluid velocity                                   |
   +-----------------------+--------------------------------------------------+
   | :math:`\tau`          | Viscous stress tensor                            |
   +-----------------------+--------------------------------------------------+
   | :math:`g`             | Gravitational acceleration                       |
   +-----------------------+--------------------------------------------------+

Fluid Equations
===============

Conservation of fluid mass:

.. math:: \frac{\partial (\varepsilon_g \rho_g)}{\partial t} + \nabla \cdot (\varepsilon_g \rho_g U_g)  = 0

Conservation of fluid momentum:

.. math:: \frac{ \partial (\varepsilon_g \rho_g U)}{\partial t} + \nabla \cdot (\varepsilon_g \rho_g U_g U_g) + \varepsilon_g \nabla p_g = \nabla \cdot \tau
           + \sum_{part} \beta_p (V_p - U_g) + \rho_g g

where :math:`\sum_p \beta_p (V_p - U_g)` is the drag term in which :math:`V_p` represents the particle velocity and :math:`\beta_p` is the drag coefficient associated with that particle

Conservation of fluid volume:

.. math:: \frac{\partial \varepsilon_g}{\partial t} + \nabla \cdot (\varepsilon_g  U_g)  = 0

Time Discretization
===============

In the absence of reactions, we assume that the fluid density is unchanged.

We compute the fluid volume fraction directly from the particle locations.

Thus here we focus on the discretization of the momentum equation
