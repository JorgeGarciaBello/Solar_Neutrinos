subroutine readEnergySpectra(B8_e_sptrm,F17_e_sptrm,HEP_e_sptrm,N13_e_sptrm,O15_e_sptrm,PP_e_sptrm)
    !The first colum is the nergy of the particle [MeV]
    !The second column is the percentage of the particles borned in the energy-row
    implicit none
    real(8) :: B8_e_sptrm(829,2) ! Neutrino energy spectrum from Boro-8 [MeV]
    real(8) :: F17_e_sptrm(500,2)! Neutrino energy spectrum from Florio-8 [MeV]
    real(8) :: HEP_e_sptrm(1000,2)! Neutrino energy spectrum from HEP reaction [MeV]
    real(8) :: N13_e_sptrm(200,2)! Neutrino energy spectrum from nitrogen-13 [MeV]
    real(8) :: O15_e_sptrm(500,2)! Neutrino energy spectrum from oxygen-13 [MeV][MeV]
    real(8) :: PP_e_sptrm(84,2)  ! Neutrino energy spectrum from oxygen-13 [MeV]    

    call read8BSolarNeutrinoEnergySpectrum(B8_e_sptrm)   !([MeV], #)
    call readF17SolarNeutrinoEnergySpectrum(F17_e_sptrm) !([MeV], #)
    call readHEPSolarNeutrinoEnergySpectrum(HEP_e_sptrm) !([MeV], #)
    call readN13SolarNeutrinoEnergySpectrum(N13_e_sptrm) !([MeV], #)
    call readO15SolarNeutrinoEnergySpectrum(O15_e_sptrm) !([MeV], #)
    call readPPSolarNeutrinoEnergySpectrum(PP_e_sptrm)   !([MeV], #)

    return
end subroutine readEnergySpectra