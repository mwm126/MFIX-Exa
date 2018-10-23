
Time Discretization
===================

In the absence of reactions, we assume that the fluid density is unchanged.

We compute the fluid volume fraction directly from the particle locations.

Thus here we focus on the discretization of the momentum equation

In the predictor

-  Define :math:`U^{MAC,n}`, the face-centered (staggered) MAC velocity which is used for advection, using :math:`U^n`

-  Define an approximation to the new-time state, :math:`(\varepsilon_g \rho_g U)^{\ast}` by setting 

.. math:: (\varepsilon_g \rho_g U)^{\ast} = (\varepsilon_g \rho_g U)^n +  
           \Delta t \left( -\nabla \cdot (\varepsilon_g \rho_g U^{MAC} U_g) - \varepsilon_g \nabla {p_g}^{n-1/2} \right.

.. math:: \left. \nabla \cdot \tau^n + \sum_p \beta_p (V_p - {U_g}^{\ast}) + \rho_g g \right)

-  Project :math:`U^{\ast}` by solving

.. math:: \nabla \cdot \frac{\varepsilon_g}{\rho_g} \nabla \phi = \nabla \cdot \left( (\varepsilon_g  U)^{\ast}+ \Delta t \varepsilon_g \nabla {p_g}^{n-1/2} \right)

then defining

.. math:: U^{\ast \ast} = U^{\ast} - \frac{1}{\rho_g} \nabla \phi

and 

.. math:: {p_g}^{n+1/2, \ast} = \phi


In the corrector

-  Define :math:`U^{MAC,\ast \ast}` at the "new" time using :math:`U^{\ast \ast}`

-  Define a new approximation to the new-time state, :math:`(\varepsilon_g \rho_g U)^{\ast \ast \ast}` by setting  

.. math:: (\varepsilon_g \rho_g U)^{\ast \ast \ast} &= (\varepsilon_g \rho_g U)^n + \frac{\Delta t}{2} \left( - \nabla \cdot (\varepsilon_g \rho_g U^{MAC} U_g)^n - \nabla \cdot (\varepsilon_g \rho_g U^{MAC} U_g)^{\ast \ast}\right) + \\ &+ \frac{\Delta t}{2} \left( \nabla \cdot \tau^n + \nabla \cdot \tau^{\ast \ast} \right) + \Delta t \left( - \varepsilon_g \nabla {p_g}^{n+1/2,\ast} + \sum_p \beta_p (V_p - {U_g}^{\ast \ast \ast} + \rho_g g \right)

-  Project :math:`U^{\ast \ast \ast}` by solving

.. math:: \nabla \cdot \frac{\varepsilon_g}{\rho_g} \nabla \phi = \nabla \cdot \left( (\varepsilon_g  U)^{\ast \ast \ast} + \Delta t \varepsilon_g \nabla {p_g}^{n+1/2,\ast} \right)

then defining

.. math:: U^{n+1} = U^{\ast \ast \ast} - \frac{1}{\rho_g} \nabla \phi

and 

.. math:: {p_g}^{n+1/2} = \phi
