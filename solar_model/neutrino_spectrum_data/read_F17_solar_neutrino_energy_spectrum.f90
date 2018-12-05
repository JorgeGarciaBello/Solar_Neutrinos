subroutine readF17SolarNeutrinoEnergySpectrum(F17_e_sptrm)
    !The first colum is the nergy of the particle [MeV]
    !The second column is the percentage of the particles borned in the energy-row
    implicit none
    real(8) :: F17_e_sptrm(500,2)! Neutrino energy spectrum from Florio-17 [MeV]
    integer :: i,j

    open(42,file='solar_model/neutrino_spectrum_data/F17_solar_neutrino_energy_spectrum.dat',status='old')
        read(42,*) ((F17_e_sptrm(i,j), j=1,2), i=1,500)
    close(42)
    return
end subroutine readF17SolarNeutrinoEnergySpectrum