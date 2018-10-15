subroutine boro8SolarOsc()
    implicit none
    real(8) :: B8_solar_zone(1219)! B8_solar_zone is the 8boro created inthe solar zone
    real(8) :: solarRadios(1219)  ! solarRadios is an array with the radii of the different layers of the Sun [1/Solar Rdio]
    real(8) :: logElectronDensity(1219)! Is an array with the Logarithm 
                                       ! (to the base 10) of the electron density in units 
                                       ! of cm^{-3}/N_A, where N_A is the Avogadro number
    real(8) :: ratio              ! Is the constant ratio of the solar layer []
    real(8) :: electronDensity    ! Is the electron density in unitis of []
    integer :: k
    call readFractionBoron8SolarZone(B8_solar_zone)
    call readSolarRadios(solarRadios)
    call readSolarLogElectronDensity(logElectronDensity)
    ratio=solarRadios(1)
    electronDensity=10.d00**logElectronDensity(k)

    B8_solar_zone(k)*()


end subroutine
