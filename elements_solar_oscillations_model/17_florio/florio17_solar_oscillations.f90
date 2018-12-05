subroutine florio17SolarOsc(t12,t23,t13,delta,sm,aM,nu)
    implicit none
    real(8), parameter :: sunUnity=6.9598D+10 !6.957D+8 today in wikipedia! [m] (metros) from Rsun= 6.9598E+10 web page of John Bahcall
    real(8), parameter :: lengthSunEarth=149.6D9 ! Average of length between the Sun and Earth [m]
    real(8) :: t12,t23,t13,delta  ! Are the three mixing angles and the CP-violation phase of the mixing matrix
    real(8) :: sm,aM              ! sm,aM are the squared mass difference m=m_21 y M=m_32    
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino
    real(8) :: Florine17(1219)    ! F17_solar_zone is the 8boro created inthe solar zones
    real(8) :: F17_e_sptrm(829,2) ! Neutrino energy spectrum from Boro-8 [MeV]
    real(8) :: solarRadios(1219)  ! solarRadios is an array with the radii of the different layers of the Sun [1/Solar Rdio]
    real(8) :: logElectronDensity(1219)! Is an array with the Logarithm 
                                       ! (to the base 10) of the electron density in units 
                                       ! of [cm^{-3}/N_A], where N_A is the Avogadro number
    real(8) :: ratio              ! Is the constant ratio of the solar layer []
    real(8) :: energy             ! is the energy of the neutrino 
    
    integer :: zone_step          ! is the index of the F17_solar_zone
    integer :: zone               ! is the index of the solar layer zone
    integer :: j                  ! is the index of the energy spectrum
    real(8) :: neuF17             ! is the amount of neutrinos from de Boron with energy j and from the xone k 
    real(8) :: neuF17AllEnergy     ! is the total number of neutrinos in the solar zone "zone"
    real(8) :: neuF17AllZoneEnergy ! is the total number of neutrinos in the sun bye energy and zone
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
    
    call readFractionFlorine17SolarZone(Florine17)
    !print*, 'Florine17', Florine17
    call readF17SolarNeutrinoEnergySpectrum(F17_e_sptrm)
    !print*, 'F17_e_sptrmm',F17_e_sptrm(:,:)
    !print*, 'F17_e_sptrmm',F17_e_sptrm(:,2)
    call readSolarRadios(solarRadios)
    !print*, 'solarRadios'
    call readSolarLogElectronDensity(logElectronDensity)
    !print*, 'logElectronDensity'        
    ratio=solarRadios(1)*(sunUnity) ![m] (metros)
    !print*,'solarRadios' ,solarRadios(1)
    
    dimen=shape(F17_e_sptrm); energy_step=dimen(1)
    zone_step=size(Florine17)
    !print*,'zone_step', zone_step    
    open(21,file='elements_solar_oscillations_model/17_florio/17_florine_sun_oscillation_core.dat')
    open(22,file='elements_solar_oscillations_model/17_florio/17_florine_sun_llimit_earth_oscillation_core.dat')
    open(23,file='elements_solar_oscillations_model/17_florio/17_florine_sun_earth_oscillation_core.dat')
    neuF17AllZoneEnergy=0.0D0
    do zone=1,zone_step
        neuF17AllEnergy=0.0D0 ! is the total number of neutrinos in the solar zone "zone"
        do j=1,energy_step
            energy=F17_e_sptrm(j,1)
            if(energy.Gt.0.0d0) then
                ! Florine17(k)  Neutrinos generados en la zona K
                ! F17_e_sptrm(j,2)   Neutrinos qgenerados con energía (j.2)            
                neuF17=Florine17(zone)*F17_e_sptrm(j,2) ! Neutrinos generados en la zona "zone" y energía "energy-j"
                call iterativeTimeEvolutionOperator(iterUfL,zone,energy,ratio,t12,t23,t13,delta,sm,aM,nu,logElectronDensity)
                solarProbability=solarProbabilityOfTransitionAB(iterUfL,flvr1,flvr2)
                vacuumProbability=probabilityOfTransitionAB(flvr1,flvr2,lengthSunEarth,t12,t23,t13,delta,sm,aM,energy,nu,0.0D0)
                totalProbability=solarProbability*vacuumProbability
                ! cantidad de neutrinos de la capa solar "zone" y con energía "energy" que sobreviven al salir del sol
                neuF17AllEnergy=neuF17AllEnergy+neuF17*totalProbability                                             
                !print*,'neuF17AllEnergy',neuF17AllEnergy
                !print*, 'solarProbabilityOfTransitionAB: ',solarProbability
                !print*, 'totalProbability: ',totalProbability
                write(21,*) energy,solarProbability
                write(22,*) energy,vacuumProbability
                write(23,*) energy,totalProbability

                !probabilityOfTransitionAB(flvr1,flvr2,lengthSunEarth,t12,t23,t13,delta,sm,aM,energy,nu,0.0D0)
            endif
        enddo
        neuF17AllZoneEnergy=neuF17AllZoneEnergy+neuF17AllEnergy
        print*,'neuF17AllZoneEnergy',neuF17AllZoneEnergy
    enddo
    
    close(21)
    close(22)
    close(23)

    return
end subroutine florio17SolarOsc