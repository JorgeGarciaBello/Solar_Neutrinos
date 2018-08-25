!################################################
!
!   tMatrix: is a subroutine that load
!       the T-matrix (3,3)
!
!################################################
subroutine tMatrix(T,nu,Ne)
    implicit none
    real(8) :: T(3,3)             ! T is a traceless matrix from the model
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino
    real(8) :: Ne                 ! Ne is the electron density

    real(8) :: Hm(3,3)            ! Hm is the Hamiltonian in the mass base
    real(8) :: I(3,3)             ! I is the identity matrix
    real(8) :: traceHm,trHm       ! traceHm is the trace of the Hamiltonian-mass

    real(8) :: result1(3,3),result2(3,3),result3(3,3)

    trHm=traceHm(nu,Ne)

    call hamiltonian_mass(Hm,nu,Ne)
    call identityMatrix(I)

    T=Hm-((trHm/3.0d0)*I)
    return
end subroutine tMatrix