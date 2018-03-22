.. role:: cpp(code)
   :language: c++


.. _sec:particle-basics:

Particle Basics
===============

In MFiXi-Exa, particles are managed by the :cpp:`MFIXParticleContainer` class.
This class is derived from AMReX's :cpp:`NeighbourParticleContainer` and
handles all of the particle data. Most importantly,
:cpp:`MFIXParticleContainer` also provides the functions for solving the
particle dynamics (based on particle-particle, particle-fluid, and
particle-wall forces). Most importantly, :cpp:`MFIXParticleContainer` also
provides the functions for solving the particle dynamics (based on
particle-particle, particle-fluid, and particle-wall forces).


Particle Dynamics
-----------------


