subroutine readFractionFlorine17SolarZone(Florine17)
    implicit none
    real(8) :: Florine17(1219)

    open(54,file='solar_model/neutrino_spectrum_data/fraction_of_florine17_neutrinos_produced_zone.dat',status='old')
        read(54,*) Florine17
    close(54)
    return
end subroutine readFractionFlorine17SolarZone