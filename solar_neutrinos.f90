program solar_neutrino
    implicit none
    real(8), parameter :: PI=3.141592653589793238462643d0
    real(8) :: val1, val2
    integer :: j,k
    double complex :: a,b
    double complex :: U(3,3)
    double complex :: U_1(3,3)
    real(8) :: t12,t23,t13,delta
    real(8) :: m1,m2,m3
    real(8) :: P
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino
    real(8) :: Ne                 ! Ne is the electron density    
    double complex :: complexPhaseFactor
    double complex :: coefficientLambda
    real(8) :: L
    real(8) :: I(3,3)
    double complex :: UfL(3,3)    ! UfL is the time evolution operator matrix in the flavour base
    double complex :: UmL(3,3)    ! UmL is the time evolution operator matrix in the mass base
    double complex :: Vm(3,3)     ! Vm is the potential matrix in mass base
    double complex :: t_Hm(3,3)   ! t_Hm is the sum of Hamiltonian in vacumm (mass base)  and the potental in the base of mass

    
    t12=PI/4.0d0!0.0D0!PI/3.0d0
    t23=PI/4.0d0!0.0D0!PI/3.0d0
    t13=PI/4.0d0!0.0D0!PI/3.0d0
    delta=3.0d0
    m1=(PI/2.5d0)*1.0E-3
    m2=(PI/3.5d0)*1.0E-3
    m3=(PI/2.0d0)*1.0E-3    
    P=1.0E6
    nu=2.0E0
    Ne=1.98E+2
    L=30.0E3
   

    call totalHamiltonianMassBase(t_Hm,t12,t23,t13,delta,m1,m2,m3,P,nu,Ne)
    !print*, complexPhaseFactor(t12,t23,t13,delta,m1,m2,m3,L,P,nu,Ne)
    print*,'t_Hm'
    print*,t_Hm(1,:)
    print*,t_Hm(2,:)
    print*,t_Hm(3,:)
    !print*, '**************'

    !print*,U_1(1,:)
    !print*,U_1(2,:)
    !print*,U_1(3,:)
   end program solar_neutrino