 #!/bin/bash

gfortran solar_neutrinos.f90 elements_oscillation_model/*.f90 packages/*.f90 chartsToCalibrate/*.f90 unitariness_tests/*.f90
./a.out

