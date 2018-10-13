subroutine readData(B8_e_sptrm,F17_e_sptrm,HEP_e_sptrm,N13_e_sptrm,O15_e_sptrm,PP_e_sptrm,   &
                    solarRadios,logElectronDensity,PP,PEP,HEP,Oxygen15,Nitrogen13,Beryllium7,&
                    Florine17,Boron8)
    implicit none
    real(8) :: B8_e_sptrm(829,2) ! Neutrino energy spectrum from Boro-8 [MeV]
    real(8) :: F17_e_sptrm(500,2)! Neutrino energy spectrum from Florio-8 [MeV]
    real(8) :: HEP_e_sptrm(1000,2)! Neutrino energy spectrum from HEP reaction [MeV]
    real(8) :: N13_e_sptrm(200,2)! Neutrino energy spectrum from nitrogen-13 [MeV]
    real(8) :: O15_e_sptrm(500,2)! Neutrino energy spectrum from oxygen-13 [MeV]
    real(8) :: PP_e_sptrm(84,2)  ! Neutrino energy spectrum from oxygen-13 [MeV]    

    real(8) :: solarRadios(1219)  ! solarRadios is an array with the radii of the different layers of the Sun [1/Solar Rdio]
    real(8) :: logElectronDensity(1219)! Is an array with the Logarithm     
    real(8) :: PP(1219)           ! Fraction of pp neutrinos produced in the zone 
    real(8) :: PEP(1219)          ! Fraction of pep neutrinos produced in the zone
    real(8) :: HEP(1219)          ! Fraction of hep neutrinos produced in the zone
    real(8) :: Oxygen15(1219)     ! Fraction of oxygen 15 neutrinos produced in the zone
    real(8) :: Nitrogen13(1219)   ! Fraction of nitrogen 13 neutrinos produced in the zone
    real(8) :: Beryllium7(1219)   ! Fraction of beryllium 7 neutrinos produced in the zone
    real(8) :: Florine17(1219)    ! Fraction of florine 17 neutrinos produced in the zone
    real(8) :: Boron8(1219)       ! Fraction of boron 8 neutrinos produced in the zone  

    call read8BSolarNeutrinoEnergySpectrum(B8_e_sptrm)
    call readF17SolarNeutrinoEnergySpectrum(F17_e_sptrm)
    call readHEPSolarNeutrinoEnergySpectrum(HEP_e_sptrm)
    call readN13SolarNeutrinoEnergySpectrum(N13_e_sptrm)
    call readO15SolarNeutrinoEnergySpectrum(O15_e_sptrm)
    call readPPSolarNeutrinoEnergySpectrum(PP_e_sptrm)
    
    CALL readSolarRadios(solarRadios)
    CALL readSolarLogElectronDensity(logElectronDensity)
    CALL readFractionPPSolarZone(PP)
    CALL readFractionPEPSolarZone(PEP)
    CALL readFractionHEPSolarZone(HEP)
    CALL readFractionOxygen15SolarZone(Oxygen15)
    CALL readFractionNitrogen13SolarZone(Nitrogen13)
    CALL readFractionBeryllium7SolarZone(Beryllium7)
    CALL readFractionFlorine17SolarZone(Florine17)
    CALL readFractionBoron8SolarZone(Boron8)

    return
end subroutine readData