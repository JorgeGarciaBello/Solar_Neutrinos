subroutine readFractionOxygen15SolarZone(Oxygen15)
    implicit none
    real(8) :: Oxygen15(1219)

    open(57,file='solar_model/neutrino_spectrum_data/fraction_of_oxygen15_neutrinos_produced_zone.dat',status='old')
        read(57,*) Oxygen15
    close(57)
    return
end subroutine readFractionOxygen15SolarZone