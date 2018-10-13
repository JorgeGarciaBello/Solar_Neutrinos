subroutine readFractionPEPSolarZone(PEP)
    implicit none
    real(8) :: PEP(1219)

    open(59,file='solar_model/neutrino_spectrum_data/fraction_of_pep_neutrinos_produced_zone.dat',status='old')
        read(59,*) PEP
    close(59)
    return
end subroutine readFractionPEPSolarZone