subroutine readFractionNitrogen13SolarZone(Nitrogen13)
    implicit none
    real(8) :: Nitrogen13(1219)

    open(56,file='solar_model/neutrino_spectrum_data/fraction_of_nitrogen13_neutrinos_produced_zone.dat',status='old')
        read(56,*) Nitrogen13
    close(56)
    return
end subroutine readFractionNitrogen13SolarZone