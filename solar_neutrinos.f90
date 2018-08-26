program solar_neutrino
    implicit none
    real(8), parameter :: PI=3.141592653589793238462643d0
    real(8) :: val1, val2
    integer :: i,j,k
    double complex :: a,b
    real(8) :: U(3,3)
    real(8) :: t12,t23,t13,delta   
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino
    real(8) :: Ne                 ! Ne is the electron density
    real(8) :: T(3,3)
    
    t12=0.0d0
    t23=0.0d0
    t13=PI/2.0d0
    delta=1.0d0
    call mixingMatrix(U,t12,t23,t13,delta)

    print*, U(1,:)
    print*, U(2,:)
    print*, U(3,:)
    !nu=1
    !Ne=0.0d0
    !call tMatrix(T,nu,Ne)

end program solar_neutrino