program solar_neutrino
    implicit none
    real(8) :: val1, val2
    integer :: i,j,k
    double complex :: a,b

    real(8) :: mixing_matrix
    real(8) :: t12,t23,t13,delta

    t12=0.0
    t23=0.0
    t13=0.0
    delta=0.0

    val1 = mixing_matrix(1,3,t12,t23,t13,delta)
 

    

    print*, 'In solar_neutrino '
    print*, val1
   
    !call mixing_matrix(val1, val2)


end program solar_neutrino