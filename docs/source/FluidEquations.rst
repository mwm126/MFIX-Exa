Fluid Equations
===============

We define the following fluid variables:

where :math:`\rho_g = ` fluid density (assumed to be constant in the absence of reactions)

where :math:`\varepsilon_g = ` volume fraction of fluid (accounts only for displacement of fluid by particle, does not account for the EB walls)

where :math:`U_g = ` fluid velocity

where :math:`p_g = ` fluid pressure

where :math:`tau = ` viscous stress tensor

where :math:`g = ` gravitational acceleration 

where :math:`\beta_p = ` drag coefficient associated with a particle

where :math:`V_p = ` velocity associated with a particle

Below are the governing equations for the fluid:

Conservation of fluid mass:

.. math:: \frac{\partial (\varepsilon_g \rho_g)}{\partial t} + \nabla \cdot (\varepsilon_g \rho_g U_g)  = 0

Conservation of fluid momentum:

.. math:: \frac{ \partial (\varepsilon_g \rho_g U)}{\partial t} + \nabla \cdot (\varepsilon_g \rho_g U_g U_g) + \varepsilon_g \nabla p_g = \nabla \cdot \tau
           + \sum_{part} \beta_p (V_p - U_g) + \rho_g g

where :math:`\sum_p \beta_p (V_p - U_g)` is the drag term in which :math:`V_p` represents the particle velocity.

Conservation of fluid volume:

.. math:: \frac{\partial \varepsilon_g}{\partial t} + \nabla \cdot (\varepsilon_g  U_g)  = 0

