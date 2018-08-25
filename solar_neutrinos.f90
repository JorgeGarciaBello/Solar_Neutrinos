program solar_neutrino
    implicit none
    real(8) :: val1, val2, PI
    integer :: i,j,k
    double complex :: a,b

    real(8) :: mixing_matrix
    real(8) :: t12,t23,t13,delta
    real(8) :: matrixA(3,3), matrixB(3,3), result(3,3)
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino
    real(8) :: Ne                 ! Ne is the electron density
    real(8) :: T(3,3)
    PI=3.141592653589793238462643d0

    nu=1
    Ne=0.0d0

    call tMatrix(T,nu,Ne)

    print*,'T(1,:)'
    print*,T(1,:)
    print*,T(2,:)
    print*,T(3,:)

    !matrixA(1,1)=1;matrixA(1,2)=1;matrixA(1,3)=1
    !matrixA(2,1)=1;matrixA(2,2)=1;matrixA(2,3)=1
    !matrixA(3,1)=1;matrixA(3,2)=1;matrixA(3,3)=1


    !matrixB = matrixA
    !result = MATMUL(matrixA, matrixB)
    !print*,'Matrix example'
    !print*, result



    !t12=0.0
    !t23=0.0
    !t13=PI/2.0
    !delta=0.0

    !val1 = mixing_matrix(1,1,t12,t23,t13,delta)    

    !print*, 'In solar_neutrino '
    !print*, val1
   
    !call mixing_matrix(val1, val2)


end program solar_neutrino