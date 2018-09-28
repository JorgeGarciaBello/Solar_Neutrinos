subroutine readData(B8_e_sptrm,F17_e_sptrm,HEP_e_sptrm,N13_e_sptrm,O15_e_sptrm,PP_e_sptrm,   &
                    neutrinoFractionByZone)
    implicit none
    real(8) :: B8_e_sptrm(829,2) ! Neutrino energy spectrum from Boro-8
    real(8) :: F17_e_sptrm(500,2)! Neutrino energy spectrum from Florio-8
    real(8) :: HEP_e_sptrm(1000,2)! Neutrino energy spectrum from HEP reaction
    real(8) :: N13_e_sptrm(200,2)! Neutrino energy spectrum from nitrogen-13
    real(8) :: O15_e_sptrm(500,2)! Neutrino energy spectrum from oxygen-13
    real(8) :: PP_e_sptrm(84,2)  ! Neutrino energy spectrum from oxygen-13
    real(8) :: neutrinoFractionByZone(1219,10)! is the data set for the neutrino oscillation in matter

    call readEnergySpectra(B8_e_sptrm,F17_e_sptrm,HEP_e_sptrm,N13_e_sptrm,O15_e_sptrm,PP_e_sptrm)
    call readNeutrinoFractionsProducedByZone(neutrinoFractionByZone)

    return
end subroutine readData