#!/bin/bash
gfortran solar_neutrinos.f90 elements_oscillation_model/*.f90 chartsToCalibrate/*.f90
./a.out
