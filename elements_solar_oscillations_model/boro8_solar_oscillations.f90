subroutine boro8SolarOsc(t12,t23,t13,delta,sm,aM,nu)
    implicit none
    real(8), parameter :: sunUnity=6.957D+8
    real(8) :: t12,t23,t13,delta  ! Are the three mixing angles and the CP-violation phase of the mixing matrix
    real(8) :: sm,aM              ! sm,aM are the squared mass difference m=m_21 y M=m_32    
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino
    real(8) :: B8_solar_zone(1219)! B8_solar_zone is the 8boro created inthe solar zone
    real(8) :: B8_e_sptrm(829,2)  ! Neutrino energy spectrum from Boro-8 [MeV]
    real(8) :: solarRadios(1219)  ! solarRadios is an array with the radii of the different layers of the Sun [1/Solar Rdio]
    real(8) :: logElectronDensity(1219)! Is an array with the Logarithm 
                                       ! (to the base 10) of the electron density in units 
                                       ! of cm^{-3}/N_A, where N_A is the Avogadro number
    real(8) :: ratio              ! Is the constant ratio of the solar layer []
    real(8) :: energy             ! is the energy of the neutrino 
    
    integer :: zone               ! is the index of the solar layer zone
    integer :: j                  ! is the index of the energy spectrum
    real(8) :: neu_8B             ! is the amount of neutrinos from de Boron with energy j and from the xone k 
    double complex :: iterUfL(3,3)! iterUfL is the time evolution operator matrix in the flavour base iterative for diferents lengths and electron densities

    double complex :: iterativeProbabilityAmplitude! is the amplitud of probability function for a neutrino that was born is the zone 'zone' of the Sun
    
    call readFractionBoron8SolarZone(B8_solar_zone)
    !print*, 'B8_solar_zone'
    call read8BSolarNeutrinoEnergySpectrum(B8_e_sptrm)
    !print*, 'B8_e_sptrm'

    call readSolarRadios(solarRadios)
    !print*, 'solarRadios'
    call readSolarLogElectronDensity(logElectronDensity)
    !print*, 'logElectronDensity'
        
    ratio=solarRadios(1)
    print*,'solarRadios' ,solarRadios(1)
    zone=1
    j=2

    energy=B8_e_sptrm(j,1)   
    
    ! B8_solar_zone(k)  Neutrinos generados en la zona K
    ! B8_e_sptrm(j,2)   Neutrinos qgenerados con energía (j.2)
    
    neu_8B=B8_solar_zone(zone)*B8_e_sptrm(j,2) ! Neutrinos generados en la zona k y energía (j,2)
    
    call iterativeTimeEvolutionOperator(iterUfL,zone,energy,ratio, &
                                        t12,t23,t13,delta,sm,aM,nu,logElectronDensity)
    return
end subroutine
