program solar_neutrino
    implicit none
    real(8), parameter :: PI=3.141592653589793238462643d0
    real(8) :: val1, val2
    integer :: i,j,k
    double complex :: a,b
    double complex :: U(3,3)
    double complex :: U_1(3,3)
    real(8) :: t12,t23,t13,delta
    real(8) :: m1,m2,m3
    real(8) :: P
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino
    real(8) :: Ne                 ! Ne is the electron density    
    real(8) :: complexPhaseFactor
    double complex :: coefficientLambda
    real(8) :: L
    
    t12=PI/6.0d0!0.0D0!PI/3.0d0
    t23=PI/3.0d0!0.0D0!PI/3.0d0
    t13=PI/3.0d0!0.0D0!PI/3.0d0
    delta=0.0d0
    m1=(PI/2.0d0)*1.0E-3
    m2=(PI/3.0d0)*1.0E-3
    m3=(PI/4.0d0)*1.0E-3    
    P=1.0E6
    nu=2.0E0
    Ne=1.98E+5
    L=30.0E3
    

    print*,coefficientLambda(1,t12,t23,t13,delta,m1,m2,m3,P,nu,Ne)
    print*,coefficientLambda(2,t12,t23,t13,delta,m1,m2,m3,P,nu,Ne)
    print*,coefficientLambda(3,t12,t23,t13,delta,m1,m2,m3,P,nu,Ne)

   end program solar_neutrino