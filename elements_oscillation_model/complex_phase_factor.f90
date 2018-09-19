!################################################
!
!   complexPhaseFactor: is a function that 
!       return the comple phase factor from 
!       the model of neutrinos oscillations
!       in matter
!
!################################################
double complex function complexPhaseFactor(t12,t23,t13,delta,sm,aM,L,P,nu,Ne)
    implicit none
    real(8) :: t12,t23,t13,delta  ! Are the three mixing angles and the CP-violation phase of the mixing matrix
    real(8) :: sm,aM              ! sm,aM are the squared mass difference m=m_21 y M=m_32
    real(8) :: L                  ! L is the length    
    real(8) :: P                  ! P es el momento del neutrino
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino    
    real(8) :: Ne                 ! Ne is the electron density

    double complex :: traceHm     ! traceHm is the trace of total Hamiltonian-mass   
    
    complexPhaseFactor=exp(  cmplx( 0.0d0,-L)                          &
                             *traceHm(t12,t23,t13,delta,sm,aM,P,nu,Ne) &
                             /3.0d0                                    &
                          )
    return
end function complexPhaseFactor