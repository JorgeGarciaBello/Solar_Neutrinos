!################################################
!
!   traceHm: is a function that return the
!       trace of the Hamiltonian-mass matrix
!
!################################################
real(8) function traceHm(t12,t23,t13,delta,m1,m2,m3,P,nu,Ne)
    implicit none
    real(8) :: t12,t23,t13,delta  ! Are the three mixing angles and the CP-violation phase of the mixing matrix
    real(8) :: m1,m2,m3           ! m1,m2,m3 are the masses of the mass-eogenstates
    real(8) :: P                  ! P es el momento del neutrino
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino    
    real(8) :: Ne                 ! Ne is the electron density

    real(8) :: t_Hm(3,3)          ! t_Hm is the sum of Hamiltonian in vacumm (mass base)  and the potental in the base of mass
    
    traceHm=0.0D0

    call totalHamiltonianMassBase(t_Hm,t12,t23,t13,delta,m1,m2,m3,P,nu,Ne)
    traceHm=t_Hm(1,1)+t_Hm(2,2)+t_Hm(3,3)
    return
end function traceHm