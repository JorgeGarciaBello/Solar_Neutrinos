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
    real(8) :: T1(3,3)
    real(8) :: T2(3,3)
    real(8) :: T3(3,3)
    real(8) :: T(3,3)
    real(8) :: complexPhaseFactor
    real(8) :: L
    
    t12=PI/4.0d0
    t23=PI/4.0d0
    t13=PI/4.0d0
    delta=1.0d0
    m1=(PI/4.0d0)*1.0E-3
    m2=(PI/4.0d0)*1.0E-3
    m1=(PI/4.0d0)*1.0E-3
    L=30.0E3
    P=1.0E6
    nu=2.0E0
    Ne=1.98E+30
    
    call tMatrix(T,t12,t23,t13,delta,m1,m2,m3,P,nu,Ne)
    print*, 'EStoy en el main program  tMatrix'
    print*, T(1,:)
    print*, T(2,:)
    print*, T(3,:)
    print*, T(1,1)+T(2,2)+T(3,3)
    print*, 'EStoy en el main program'
end program solar_neutrino