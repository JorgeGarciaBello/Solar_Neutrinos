program solar_neutrino
    implicit none
    real(8), parameter :: PI=3.141592653589793238462643d0
    real(8) :: val1, val2
    integer :: i,j,k
    double complex :: a,b
    double complex :: U(3,3)
    double complex :: U_1(3,3)
    real(8) :: t12,t23,t13,delta
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino
    real(8) :: Ne                 ! Ne is the electron density
    real(8) :: T1(3,3)
    real(8) :: T2(3,3)
    real(8) :: T3(3,3)
    
    t12=PI/4.0d0
    t23=PI/4.0d0
    t13=PI/4.0d0
    delta=1.0d0

    print*, 'EStoy en el main program'
    call mixingMatrix(U,t12,t23,t13,delta)

    call inverseMixingMatrix(U_1,t12,t23,t13,delta)

end program solar_neutrino