!################################################
!
!   hamiltonianInVacuum: is a subroutine that 
!       load the hamiltonian-vacuum-matrix 
!
!################################################
subroutine hamiltonianInVacuum(Hv,E1,E2,E3,m1,m2,m3,P)
    implicit none
    real(8) :: Hv(3,3)            ! Hv is the hamiltonian for the propagation of the neutrinos in vacuum
    real(8) :: E1,E2,E3           ! E1,E2,E3 are the energies for mass-eigenstates
    real(8) :: m1,m2,m3           ! m1,m2,m3 are the masses of the mass-eogenstates
    real(8) :: P                  ! P es el momento del neutrino

    E1=sqrt(m1**2+P**2); E2=sqrt(m2**2+P**2); E3=sqrt(m3**2+P**2)

    Hv(1,1)=E1;    Hv(1,2)=0.0d0; Hv(1,3)=0.0d0
    Hv(2,1)=0.0d0; Hv(2,2)=E2;    Hv(2,3)=0.0d0
    Hv(3,1)=0.0d0; Hv(3,2)=0.0d0; Hv(3,3)=E3

    return
end subroutine hamiltonianInVacuum