subroutine proofOfOneness()
    implicit none
    real(8) :: result
    double complex :: probabilityOfTransitionAB
    real(8) :: Pee, Pem, Pet
    integer :: i

    real(8), parameter :: PI=3.141592653589793238462643d0
    real(8) :: t12,t23,t13,delta
    real(8) :: sm,aM              ! sm,aM are the squared mass difference m=m_21 y M=m_32
    real(8) :: P    
    real(8) :: eta,rEarth
    real(8) :: L                  ! L is the length between the source of neutrinos an the position
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino
    real(8) :: Ne                 ! Ne is the electron density
    real(8),parameter :: scalaFactor=2.5399811853d10! scalaFactor is the scala factor to obtein length in [eV^{-1}]    
    
    t12=PI/4.0d0         ! equiv to 45 degrees
    t23=PI/4.0d0         ! equiv to 45 degrees
    t13=PI*0.027777778d0 ! equiv to 5 degrees
    delta=0.0d0
    sm=1E-4
    aM=1E-3
    P=10.0d9             ! Energía en [eV]
    eta=0.5d0
    rEarth=6378.d0       ! Longitud en [Km]
    L=2.0d0*eta*rEarth*scalaFactor
    nu=3
    Ne=1.0d-15

    do i=1,100
        !P=P+1.0d9
        L=L+10
        Pee = probabilityOfTransitionAB(3,2,L,t12,t23,t13,delta,sm,aM,P,nu,Ne)
        Pem = probabilityOfTransitionAB(3,1,L,t12,t23,t13,delta,sm,aM,P,nu,Ne)
        Pet = probabilityOfTransitionAB(3,3,L,t12,t23,t13,delta,sm,aM,P,nu,Ne)    
        result = Pee+Pem+Pet
        !print*, Pee, Pem, Pet
        print*, result
        print*, ''
    enddo

    return
end subroutine