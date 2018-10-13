subroutine readFractionPPSolarZone(PP)
    implicit none
    real(8) :: PP(1219)

    open(60,file='solar_model/neutrino_spectrum_data/fraction_of_pp_neutrinos_produced_zone.dat',status='old')
        read(60,*) PP
    close(60)
    return
end subroutine readFractionPPSolarZone