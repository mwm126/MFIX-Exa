Fluid Equations
===============

Below are the governing equations for the fluid:

Conservation of fluid mass:

.. math:: \frac{\partial (\varepsilon_g \rho_g)}{\partial t} + \nabla \cdot (\varepsilon_g \rho_g U_g)  = 0

Conservation of fluid momentum:

.. math:: \frac{ \partial (\varepsilon_g \rho_g U)}{\partial t} + \nabla \cdot (\varepsilon_g \rho_g U_g U_g) + \varepsilon_g \nabla p_g = \nabla \cdot \tau + {\bf g} 
           + \sum_{part} \beta (V_{part} - U_g)

Conservation of fluid volume:

where :math:`\sum_{part} \beta (V_{part} - U_g)` is the drag term in which :math:`V_{part}` represents the particle velocity.

.. math:: \frac{\partial \varepsilon_g}{\partial t} + \nabla \cdot (\varepsilon_g  U_g)  = 0

