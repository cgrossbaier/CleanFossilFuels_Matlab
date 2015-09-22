# Single coal particle combustion
# README

An experiment I set up for a coursework I prepared at the University of Cambridge. You can find out more about this work by looking at my [Report] (https://github.com/cgrossbaier/CleanFossilFuels_Matlab/blob/master/Report/Report.pdf). 

![Alt text](https://github.com/cgrossbaier/CleanFossilFuels_Matlab/blob/master/fig/Plot_NoIgnition.eps “No Ignition“)

***
### Abstract
The study of single coal particle combustion provides an important insight into the general nature of solid combustion andallows us to better understand the combustion of pulverized coal. This report studied how the single coal particle combustionis influenced by several parameters. The influences of changing air temperature, wall temperature and particle size wasexamined, and the behaviours of particles from different coal types was evaluated. By using a one-film model implementedin Matlab, it was shown that an increase in both the wall and air temperature had similar effects on the coal particle - thecombustion process was faster and the temperature of the coal particle increased. Bigger particles took longer to burn, andshow lower maximum temperatures than smaller particles. The study of different coal types found that coal types with ahigh moisture content take a longer time to reach the same temperatures than coal types with less moisture.

***
### A little technical background
The equations governing the particle mass and energy were implemented and numerically solved in Matlab [6]. For the initial value problem with the equations 3, 4,5 and 6, the ode45 function was used. When the onefilm model with moisture was used, the equations 3, 5 10, 11 and 12 were applied. The initial temperature of the particle was set to 300K, and the initial mass of the particle, diameter and volatile mass were calculated as described in Subsection 2.1.With the help of the ”events”-option in the ode45 function, the first computation was stopped as soon as only ash was left from the particle. At this point, combustion stopped since no combustible mass was left and the ash particle was only exposed to radiation from the furnace wall and conduction from the furnace air. This process was then calculated in a second computation.When the temperature of the particle reached a stable point, hence radiation and conduction were in an equilibrium, the second computation was stopped.






