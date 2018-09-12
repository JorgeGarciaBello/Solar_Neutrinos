!################################################
!
!   complexPhaseFactor: is a function that 
!       return the comple phase factor from 
!       the model of neutrinos oscillations
!       in matter
!
!################################################
double complex function complexPhaseFactor(t12,t23,t13,delta,m1,m2,m3,L,P,nu,Ne)
    implicit none
    real(8) :: t12,t23,t13,delta  ! Are the three mixing angles and the CP-violation phase of the mixing matrix
    real(8) :: m1,m2,m3           ! m1,m2,m3 are the masses of the mass-eogenstates
    real(8) :: L                  ! L is the length    
    real(8) :: P                  ! P es el momento del neutrino
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino    
    real(8) :: Ne                 ! Ne is the electron density

    real(8) :: traceHm            ! traceHm is the trace of total Hamiltonian-mass   
    
    complexPhaseFactor=exp(  cmplx( 0.0,-L*traceHm(t12,t23,t13,delta,m1,m2,m3,P,nu,Ne)/3.0d0 )  )
    return
end function complexPhaseFactor