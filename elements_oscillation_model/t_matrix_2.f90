!################################################
!
!   tMatrix2: is a subroutine that load
!       the T-matrix squared (3,3)
!
!################################################
subroutine tMatrix2(T2,t12,t23,t13,delta,m1,m2,m3,P,nu,Ne)
    implicit none
    real(8) :: T2(3,3)            ! T2 is the T-matrix squared
    real(8) :: t12,t23,t13,delta  ! Are the three mixing angles and the CP-violation phase of the mixing matrix
    real(8) :: m1,m2,m3           ! m1,m2,m3 are the masses of the mass-eogenstates
    real(8) :: P                  ! P es el momento del neutrino
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino    
    real(8) :: Ne                 ! Ne is the electron density

    real(8) :: T(3,3)             ! T is the T-matrix of the model

    call tMatrix(T,t12,t23,t13,delta,m1,m2,m3,P,nu,Ne)    
    T2 = matmul(T,T)
    return
end subroutine tMatrix2