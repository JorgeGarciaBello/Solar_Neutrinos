subroutine readO15SolarNeutrinoEnergySpectrum(O15_e_sptrm)
    !The first colum is the nergy of the particle [MeV]
    !The second column is the percentage of the particles borned in the energy-row
    implicit none    
    real(8) :: O15_e_sptrm(500,2)! Neutrino energy spectrum from oxygen-13 [MeV]
    integer :: i,j

    open(45,file='solar_model/neutrino_spectrum_data/O15_solar_neutrino_energy_spectrum.dat',status='old')
        read(45,*) ((O15_e_sptrm(i,j), j=1,2), i=1,500)
    close(45)
    return
end subroutine readO15SolarNeutrinoEnergySpectrum