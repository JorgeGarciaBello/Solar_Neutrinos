subroutine readFractionBoron8SolarZone(B8_solar_zone)
    implicit none
    real(8) :: B8_solar_zone(1219)

    open(53,file='solar_model/neutrino_spectrum_data/fraction_of_boron8_neutrinos_produced_zone.dat',status='old')
        read(53,*) B8_solar_zone
    close(53)
    return
end subroutine readFractionBoron8SolarZone