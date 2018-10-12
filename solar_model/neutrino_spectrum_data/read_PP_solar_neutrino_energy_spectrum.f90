subroutine readPPSolarNeutrinoEnergySpectrum(PP_e_sptrm)
    !The first colum is the nergy of the particle [MeV]
    !The second column is the percentage of the particles borned in the energy-row
    implicit none    
    real(8) :: PP_e_sptrm(84,2)  ! Neutrino energy spectrum from oxygen-13 [MeV]
    integer :: i,j

    open(46,file='solar_model/neutrino_spectrum_data/PP_solar_neutrino_energy_spectrum.dat',status='old')
        read(46,*) ((PP_e_sptrm(i,j),  j=1,2), i=1,84)
    close(46)
    return
end subroutine readPPSolarNeutrinoEnergySpectrum