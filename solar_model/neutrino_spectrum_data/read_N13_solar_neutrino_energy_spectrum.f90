subroutine readN13SolarNeutrinoEnergySpectrum(N13_e_sptrm)
    !The first colum is the nergy of the particle [MeV]
    !The second column is the percentage of the particles borned in the energy-row
    implicit none
    real(8) :: N13_e_sptrm(200,2)! Neutrino energy spectrum from nitrogen-13 [MeV]
    integer :: i,j

    open(44,file='solar_model/neutrino_spectrum_data/N13_solar_neutrino_energy_spectrum.dat',status='old')
        read(44,*) ((N13_e_sptrm(i,j), j=1,2), i=1,200)
    close(44)
    return
end subroutine readN13SolarNeutrinoEnergySpectrum