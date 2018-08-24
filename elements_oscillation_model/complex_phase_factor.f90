!################################################
!
!   complexPhaseFactor: is a function that 
!       return the comple phase factor from 
!       the model of neutrinos oscillations
!       in matter
!
!################################################
real(8) function complexPhaseFactor(L,nu,Ne)
    implicit none
    real(8) :: L                  ! L is the length
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino
    real(8) :: Ne                 ! Ne is the electron density

    real(8) :: traceHm            ! traceHm is the trace of Hamiltonian-mass   
    
    complexPhaseFactor=exp(  cmplx( 0.0,-L*traceHm(nu,Ne) )  )
    return
end function complexPhaseFactor