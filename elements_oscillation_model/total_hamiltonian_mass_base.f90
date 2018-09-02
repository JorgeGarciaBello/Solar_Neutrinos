!################################################
!
!   totalHamiltonianMassBase: is a subroutine
!       that return the the total Hamiltonian 
!       which is the sum of hamiltonian in 
!       vasuum and the potential matrix in
!       mass base
!
!################################################
subroutine totalHamiltonianMassBase(t_Hm,t12,t23,t13,delta,m1,m2,m3,P,nu,Ne)
    implicit none
    real(8) :: t_Hm(3,3)          ! t_Hm is the sum of Hamiltonian in vacumm (mass base)  and the potental in the base of mass
    real(8) :: t12,t23,t13,delta  ! Are the three mixing angles and the CP-violation phase of the mixing matrix
    real(8) :: m1,m2,m3           ! m1,m2,m3 are the masses of the mass-eogenstates
    real(8) :: P                  ! P es el momento del neutrino
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino    
    real(8) :: Ne                 ! Ne is the electron density

    real(8) :: Hv(3,3)            ! Hv is the hamiltonian for the propagation of the neutrinos in vacuum
    real(8) :: Vm(3,3)            ! Vm is the potential matrix in mass base
    double complex :: U(3,3)      ! U is the mixing matrix of the oscillation model    
    double complex :: U_1(3,3)    ! U is the mixing matrix of the oscillation model    
    
    
    

    call hamiltonianInVacuum(Hv,m1,m2,m3,P)
    call potentialMatrixMassBase(Vm,U,U_1,t12,t23,t13,delta,nu,Ne)

    t_Hm=Hv+Vm
    return
end subroutine totalHamiltonianMassBase