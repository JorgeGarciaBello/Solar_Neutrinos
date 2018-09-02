subroutine totalHamiltonianMassBase(t_Hm,m1,m2,m3,P)
    implicit none
    real(8) :: t_Hm(3,3)              ! t_Hm is the sum of Hamiltonian in vacumm (mass base)  and the potental in the base of mass
    real(8) :: m1,m2,m3               ! m1,m2,m3 are the masses of the mass-eogenstates
    real(8) :: P                      ! P es el momento del neutrino

    real(8) :: Hv(3,3)                ! Hv is the hamiltonian for the propagation of the neutrinos in vacuum
    real(8) :: Vm(3,3)                ! Vm is the potential matrix in mass base
    double complex :: U(3,3)          ! U is the mixing matrix of the oscillation model    
    double complex :: U_1(3,3)        ! U is the mixing matrix of the oscillation model    
    real(8) :: t12,t23,t13            ! Are the mixing angles of hte oscillation model
    real(8) :: delta                  ! delta is the phase factor for CP violations
    integer :: nu                     ! nu is 1 for neutrinos an 2 for antineutrino    
    real(8) :: Ne                     ! Ne is the electron density

    call hamiltonianInVacuum(Hv,m1,m2,m3,P)
    call potentialMatrixMassBase(Vm,U,U_1,t12,t23,t13,delta,nu,Ne)

    t_Hm=Hv+Vm
    return
end subroutine totalHamiltonianMassBase