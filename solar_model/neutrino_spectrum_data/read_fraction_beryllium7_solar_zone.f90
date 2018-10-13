subroutine readFractionBeryllium7SolarZone(Beryllium7)
    implicit none
    real(8) :: Beryllium7(1219)

    open(55,file='solar_model/neutrino_spectrum_data/fraction_of_beryllium7_neutrinos_produced_zone.dat',status='old')
        read(55,*) Beryllium7
    close(55)
    return
end subroutine readFractionBeryllium7SolarZone