subroutine readNeutrinoFractionsProducedByZone(neutrinoFractionByZone)
    implicit none
    real(8) :: neutrinoFractionByZone(1219,10)! is the data set for the neutrino oscillation in matter
    integer :: i,j
    ! Description of the data in neutrinoFractionByZone
    !
    ! 1)  Radius of the zone in units of one solar radius
    ! 2)  Logarithm (to the base 10) of the electron density in units of cm^{-3}/N_A, where N_A is the Avogadro number
    ! 3)  Fraction of pp neutrinos produced in the zone 
    ! 4)  Fraction of boron 8 neutrinos produced in the zone
    ! 5)  Fraction of nitrogen 13 neutrinos produced in the zone
    ! 6)  Fraction of oxygen 15 neutrinos produced in the zone
    ! 7)  Fraction of florine 17 neutrinos produced in the zone
    ! 8)  Fraction of beryllium 7 neutrinos produced in the zone
    ! 9)  Fraction of pep neutrinos produced in the zone
    ! 10) Fraction of hep neutrinos produced in the zone

    open(47,file='solar_model/data_for_solar_neutrino_oscillations.dat',status='old')
        read(47,*) ((neutrinoFractionByZone(i,j),  j=1,10), i=1,1219)    
    close(47)
    return
end subroutine readNeutrinoFractionsProducedByZone