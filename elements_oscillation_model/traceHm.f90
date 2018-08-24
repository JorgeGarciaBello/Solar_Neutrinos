!################################################
!
!   traceHm: is a function that return the
!       trace of the Hamiltonian-mass matrix
!
!################################################
real(8) function traceHm(nu,Ne)
    implicit none    
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino
    real(8) :: Ne                 ! Ne is the electron density

    real(8) :: Hm(3,3)            ! Hm is the Hamiltonian in the mass base

    traceHm=0.0D0
    
    call hamiltonian_mass(Hm,nu,Ne)
    traceHm=Hm(1,1)+Hm(2,2)+Hm(3,3)
    return
end function traceHm