
Time Discretization
===============

In the absence of reactions, we assume that the fluid density is unchanged.

We compute the fluid volume fraction directly from the particle locations.

Thus here we focus on the discretization of the momentum equation

In the predictor

#. Define :math:`U^{MAC}`, the face-centered (staggered) MAC velocity which is used for advection.

#. Define an approximation to the new-time state, :math:`(\varepsilon_g \rho_g U)^{\ast}` by setting 

.. math:: (\varepsilon_g \rho_g U)^{\ast} = (\varepsilon_g \rho_g U)^n +  
           \Delta t ( -\nabla \cdot (\varepsilon_g \rho_g U^{MAC} U_g) + \varepsilon_g \nabla {p_g}^{n-1/2} + 
           \nabla \cdot \tau^n + \sum_{part} \beta_p (V_p - {U_g}^{\ast}) + \rho_g g )

#. Project :math:`U^{\ast}` by solving

.. math:: \nabla \cdot \frac{\varepsilon_g}{\rho_g} \nabla \phi = \nabla \cdot (\varepsilon_g  U)^{\ast}

then defining

.. math:: (\varepsilon_g  U)^{n+1} = (\varepsilon_g  U)^{***} - \frac{\varepsilon_g}{\rho_g} \nabla \phi

and 

.. math:: {p_g}^{n+1/2, \ast} = {p_g}^{n-1/2} + \phi


In the corrector

#. Define an approximation to the new-time state,:math:`(\varepsilon_g \rho_g U)^{\ast \ast \ast}` by setting  

.. math::  (\varepsilon_g \rho_g U)^{\ast \ast \ast} = (\varepsilon_g \rho_g U)^n + 
           \Delta t ( (-1/2) \nabla \cdot (\varepsilon_g \rho_g U^{MAC} U_g)^n -(1/2) \nabla \cdot (\varepsilon_g \rho_g U^{MAC} U_g)^{\ast \ast} 
          + \varepsilon_g \nabla {p_g}^{n+1/2,\ast} + (1/2) \nabla \cdot \tau^n + (1/2) \nabla \cdot \tau^{\ast \ast} + 
            \sum_{part} \beta_p (V_p - {U_g}^{\ast \ast}) + \rho_g g )

#. Project :math:`U^{\ast \ast \ast}` by solving

.. math:: \nabla \cdot \frac{\varepsilon_g}{\rho_g} \nabla \phi = \nabla \cdot (\varepsilon_g  U)^{\ast \ast \ast}

then defining

.. math:: (\varepsilon_g  U)^{n+1} = (\varepsilon_g  U)^{\ast \ast \ast} - \frac{\varepsilon_g}{\rho_g} \nabla \phi

and 

.. math:: {p_g}^{n+1/2} = {p_g}^{n-1/2} + \phi
