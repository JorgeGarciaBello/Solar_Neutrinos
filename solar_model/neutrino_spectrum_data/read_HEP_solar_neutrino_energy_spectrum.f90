subroutine readHEPSolarNeutrinoEnergySpectrum(HEP_e_sptrm)
    !The first colum is the nergy of the particle [MeV]
    !The second column is the percentage of the particles borned in the energy-row
    implicit none    
    real(8) :: HEP_e_sptrm(1000,2)! Neutrino energy spectrum from HEP reaction [MeV]
    integer :: i,j

    open(43,file='solar_model/neutrino_spectrum_data/HEP_solar_neutrino_energy_spectrum.dat',status='old')
        read(43,*) ((HEP_e_sptrm(i,j), j=1,2), i=1,1000)
    close(43)
    return
end subroutine readHEPSolarNeutrinoEnergySpectrum