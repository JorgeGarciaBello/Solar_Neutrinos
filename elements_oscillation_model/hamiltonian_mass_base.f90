!################################################
!
!   hamiltonian_mass: is a subroutine that load
!       the Hamiltonian-mass  in the 
!       Hm array
!
!################################################
subroutine hamiltonian_mass(Hm,nu,Ne)
    implicit none
    real(8) :: Hm(3,3)            ! Hm is the Hamiltonian in the mass base
    real(8) :: E1,E2,E3           ! E1,E2,E3 are the energies of the eigenstates of mass
    real(8) :: A                  ! A is the matter density

    real(8) :: matterDensity      ! matterDensity is the matter density function
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino
    real(8) :: Ne                 ! Ne is the electron density
    

    E1=1.0d0; E2=1.0d0; E3=1.0d0; A=matterDensity(nu,Ne)

    Hm(1,1)=E1+A;  Hm(1,2)=0.0d0; Hm(1,3)=0.0d0
    Hm(2,1)=0.0d0; Hm(2,2)=E2;    Hm(2,3)=0.0d0
    Hm(3,1)=0.0d0; Hm(3,2)=0.0d0; Hm(3,3)=E3

    return
end subroutine hamiltonian_mass