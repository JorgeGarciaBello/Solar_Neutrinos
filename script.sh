 #!/bin/bash

gfortran solar_neutrinos.f90 elements_oscillation_model/*.f90 packages/*.f90 chartsToCalibrate/*.f90 unitariness_tests/*.f90 elements_solar_oscillations_model/*.f90 elements_solar_oscillations_model/8_boro/*.f90 elements_solar_oscillations_model/13_nitrogen/*.f90 elements_solar_oscillations_model/15_oxygen/*.f90 elements_solar_oscillations_model/17_florio/*.f90 elements_solar_oscillations_model/pp_chain/*.f90 solar_model/neutrino_spectrum_data/*.f90
./a.out

