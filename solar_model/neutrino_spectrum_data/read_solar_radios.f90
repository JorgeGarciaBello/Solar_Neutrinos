subroutine readSolarRadios(solarRadios)
    implicit none
    real(8) :: solarRadios(1219)  ! solarRadios is an array with the radii of the different layers of the Sun [1/Solar Rdio]
    ! Data taken from http://www.sns.ias.edu/~jnb/ in link:
    ! Distribution of neutrino fluxes in the BS05(AGS,OP) standard solar model model
    open(51,file='solar_model/neutrino_spectrum_data/solar_radios.dat',status='old')
        read(51,*) solarRadios
    close(51)
    return
end subroutine readSolarRadios