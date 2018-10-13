subroutine readSolarLogElectronDensity(logElectronDensity)
    implicit none
    real(8) :: logElectronDensity(1219)! Is an array with the Logarithm 
                                       ! (to the base 10) of the electron density in units 
                                       ! of cm^{-3}/N_A, where N_A is the Avogadro number
    open(52,file='solar_model/neutrino_spectrum_data/solar_logarithm_of_the_electron_density.dat',status='old')
        read(52,*) logElectronDensity
    close(52)
    return
end subroutine readSolarLogElectronDensity