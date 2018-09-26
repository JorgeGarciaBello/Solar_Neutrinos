subroutine readEnergySpectra(B8_e_sptrm,F17_e_sptrm,HEP_e_sptrm,N13_e_sptrm,O15_e_sptrm,PP_e_sptrm)
    implicit none
    real(8) :: B8_e_sptrm(829,2) ! Neutrino energy spectrum from Boro-8
    real(8) :: F17_e_sptrm(500,2)! Neutrino energy spectrum from Florio-8
    real(8) :: HEP_e_sptrm(1000,2)! Neutrino energy spectrum from HEP reaction
    real(8) :: N13_e_sptrm(200,2)! Neutrino energy spectrum from nitrogen-13
    real(8) :: O15_e_sptrm(500,2)! Neutrino energy spectrum from oxygen-13
    real(8) :: PP_e_sptrm(84,2)  ! Neutrino energy spectrum from oxygen-13
    integer :: i,j

    open(41,file='solar_model/neutrino_spectrum_data/B8_solar_neutrino_energy_spectrum.dat',status='old')
    open(42,file='solar_model/neutrino_spectrum_data/F17_solar_neutrino_energy_spectrum.dat',status='old')
    open(43,file='solar_model/neutrino_spectrum_data/HEP_solar_neutrino_energy_spectrum.dat',status='old')
    open(44,file='solar_model/neutrino_spectrum_data/N13_solar_neutrino_energy_spectrum.dat',status='old')
    open(45,file='solar_model/neutrino_spectrum_data/O15_solar_neutrino_energy_spectrum.dat',status='old')
    open(46,file='solar_model/neutrino_spectrum_data/PP_solar_neutrino_energy_spectrum.dat',status='old')
        read(41,*) ((B8_e_sptrm(i,j),  j=1,2), i=1,829)
        read(42,*) ((F17_e_sptrm(i,j), j=1,2), i=1,500)
        read(43,*) ((HEP_e_sptrm(i,j), j=1,2), i=1,1000)
        read(44,*) ((N13_e_sptrm(i,j), j=1,2), i=1,200)
        read(45,*) ((O15_e_sptrm(i,j), j=1,2), i=1,500)
        read(46,*) ((PP_e_sptrm(i,j),  j=1,2), i=1,84)
    close(41)
    close(42)
    close(43)
    close(44)
    close(45)
    close(46)
    return
end subroutine readEnergySpectra