subroutine read8BSolarNeutrinoEnergySpectrum(B8_e_sptrm)
    !The first colum is the nergy of the particle [MeV]
    !The second column is the percentage of the particles borned in the energy-row
    implicit none
    real(8) :: B8_e_sptrm(829,2) ! Neutrino energy spectrum from Boro-8 [MeV]
    integer :: i,j

    open(41,file='solar_model/neutrino_spectrum_data/B8_solar_neutrino_energy_spectrum.dat',status='old')
        read(41,*) ((B8_e_sptrm(i,j),  j=1,2), i=1,829)
    close(41)
    return
end subroutine read8BSolarNeutrinoEnergySpectrum