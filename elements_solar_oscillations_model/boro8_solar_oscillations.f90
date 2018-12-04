subroutine boro8SolarOsc(t12,t23,t13,delta,sm,aM,nu)
    implicit none
    real(8), parameter :: sunUnity=6.9598D+10 !6.957D+8 today in wikipedia! [m] (metros) from Rsun= 6.9598E+10 web page of John Bahcall
    real(8), parameter :: lengthSunEarth=149.6D9 ! Average of length between the Sun and Earth [m]
    real(8) :: t12,t23,t13,delta  ! Are the three mixing angles and the CP-violation phase of the mixing matrix
    real(8) :: sm,aM              ! sm,aM are the squared mass difference m=m_21 y M=m_32    
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino
    real(8) :: B8_solar_zone(1219)! B8_solar_zone is the 8boro created inthe solar zones
    real(8) :: B8_e_sptrm(829,2)  ! Neutrino energy spectrum from Boro-8 [MeV]
    real(8) :: solarRadios(1219)  ! solarRadios is an array with the radii of the different layers of the Sun [1/Solar Rdio]
    real(8) :: logElectronDensity(1219)! Is an array with the Logarithm 
                                       ! (to the base 10) of the electron density in units 
                                       ! of [cm^{-3}/N_A], where N_A is the Avogadro number
    real(8) :: ratio              ! Is the constant ratio of the solar layer []
    real(8) :: energy             ! is the energy of the neutrino 
    
    integer :: zone_step          ! is the index of the B8_solar_zone
    integer :: zone               ! is the index of the solar layer zone
    integer :: j                  ! is the index of the energy spectrum
    real(8) :: neu_8B             ! is the amount of neutrinos from de Boron with energy j and from the xone k 
    real(8) :: neu8BAllEnergy     ! is the total number of neutrinos in the solar zone "zone"
    real(8) :: neu8BAllZoneEnergy ! is the total number of neutrinos in the sun bye energy and zone
    double complex :: iterUfL(3,3)! iterUfL is the time evolution operator matrix in the flavour base iterative for diferents lengths and electron densities

    double complex :: iterativeProbabilityAmplitude! is the amplitud of probability function for a neutrino that was born is the zone 'zone' of the Sun
    real(8) :: solarProbabilityOfTransitionAB ! is the probability of transition for the solar model to limit of sun
    real(8) :: probabilityOfTransitionAB ! is the probability of transition for the solar model from solar radio to the earth
    integer :: flvr1              ! flvr1 is the flavour with which the neutrino is generated
    integer :: flvr2              ! flvr2 is the flavour that is transited 

    integer :: dimen(2),energy_step
    real(8) :: solarProbability
    real(8) :: vacuumProbability
    real(8) :: totalProbability

    flvr1=1; flvr2=1; ! sabor inicial electron, sabor a detectar electron
    
    call readFractionBoron8SolarZone(B8_solar_zone)
    !print*, 'B8_solar_zone'
    call read8BSolarNeutrinoEnergySpectrum(B8_e_sptrm)
    !print*, 'B8_e_sptrm'
    call readSolarRadios(solarRadios)
    !print*, 'solarRadios'
    call readSolarLogElectronDensity(logElectronDensity)
    !print*, 'logElectronDensity'        
    ratio=solarRadios(1)*(sunUnity) ![m] (metros)
    print*,'solarRadios' ,solarRadios(1)
    zone=1
    j=2
    dimen=shape(B8_e_sptrm); energy_step=dimen(1)
    zone_step=size(B8_solar_zone)
    print*,'zone_step', zone_step
    !stop
    open(21,file='elements_solar_oscillations_model/8_boro_sun_oscillation_core.dat')
    open(22,file='elements_solar_oscillations_model/8_boro_sun_llimit_earth_oscillation_core.dat')
    open(23,file='elements_solar_oscillations_model/8_boro_sun_earth_oscillation_core.dat')
    neu8BAllZoneEnergy=0.0D0
    do zone=1,zone_step
        neu8BAllEnergy=0.0D0 ! is the total number of neutrinos in the solar zone "zone"
        do j=1,energy_step
            energy=B8_e_sptrm(j,1)
            if(energy.Gt.0.0d0) then
                ! B8_solar_zone(k)  Neutrinos generados en la zona K
                ! B8_e_sptrm(j,2)   Neutrinos qgenerados con energía (j.2)            
                neu_8B=B8_solar_zone(zone)*B8_e_sptrm(j,2) ! Neutrinos generados en la zona "zone" y energía "energy-j"
                call iterativeTimeEvolutionOperator(iterUfL,zone,energy,ratio,t12,t23,t13,delta,sm,aM,nu,logElectronDensity)
                solarProbability=solarProbabilityOfTransitionAB(iterUfL,flvr1,flvr2)
                vacuumProbability=probabilityOfTransitionAB(flvr1,flvr2,lengthSunEarth,t12,t23,t13,delta,sm,aM,energy,nu,0.0D0)
                totalProbability=solarProbability*vacuumProbability
                ! cantidad de neutrinos de la capa solar "zone" y con energía "energy" que sobreviven al salir del sol
                neu8BAllEnergy=neu8BAllEnergy+neu_8B*totalProbability                                             
                !print*,'neu8BAllEnergy',neu8BAllEnergy
                !print*, 'solarProbabilityOfTransitionAB: ',solarProbability
                !print*, 'totalProbability: ',totalProbability
                !write(21,*) energy,solarProbability
                !write(22,*) energy,vacuumProbability
                !write(23,*) energy,totalProbability

                !probabilityOfTransitionAB(flvr1,flvr2,lengthSunEarth,t12,t23,t13,delta,sm,aM,energy,nu,0.0D0)
            endif
        enddo
        neu8BAllZoneEnergy=neu8BAllZoneEnergy+neu8BAllEnergy
        print*,'neu8BAllZoneEnergy',neu8BAllZoneEnergy
    enddo
    
    close(21)
    close(22)
    close(23)

    return
end subroutine
