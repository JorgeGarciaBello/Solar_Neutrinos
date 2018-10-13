subroutine readFractionHEPSolarZone(HEP)
    implicit none
    real(8) :: HEP(1219)

    open(58,file='solar_model/neutrino_spectrum_data/fraction_of_hep_neutrinos_produced_zone.dat',status='old')
        read(58,*) HEP
    close(58)
    return
end subroutine readFractionHEPSolarZone