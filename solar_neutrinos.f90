program solar_neutrino
    implicit none
    real(8), parameter :: PI=3.141592653589793238462643d0
    real(8) :: val1, val2
    integer :: j,k
    double complex :: a,b
    double complex :: U(3,3)
    double complex :: U_1(3,3)
    real(8) :: t12,t23,t13,delta
    real(8) :: sm,aM              ! sm,aM are the squared mass difference m=m_21 y M=m_32
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
    double complex :: T(3,3)      ! T is a traceless matrix from the model
    double complex :: probabilityAmplitude
    double complex :: probabilityOfTransitionAB
    double complex :: Ls(3)       ! Ls is an array with the values of coefficients lambda    
    double complex :: result,result2,r1,r2,r3
    real(8) :: matterDensity
    real(8) :: jump
    real(8) :: eta,rEarth
    double complex :: MA(3,3), MB(3,3)
    double complex :: vectE(3)
    double complex :: lambdaMtrx(3,3)! lambdaMtrx is the matrix of the model
    double complex :: vectA(3)    ! vectA is the vector of the model

    
    t12=PI/4.0d0         ! equiv to 45 degrees
    t23=PI/4.0d0         ! equiv to 45 degrees
    t13=PI*0.027777778d0 ! equiv to 5 degrees
    delta=2.0d0
    sm=1E-4
    aM=1E-3

    eta=0.2d0
    rEarth=6378.d0
    L=2.0d0*eta*rEarth
    P=10.0d0
    
    nu=3
    Ne=1.0d-15

    print*, 'in main program'
    call mixingMatrix(U,t12,t23,t13,delta)
    call inverseMixingMatrix(U_1,t12,t23,t13,delta)
    print*,U(1,:)
    print*,U(2,:)
    print*,U(3,:)
    print*,'***********'
    print*,U_1(1,:)
    print*,U_1(2,:)
    print*,U_1(3,:)
    print*,'***********'
    print*, matmul(U,U_1)
    !jump=(10.0d-14 -Ne)/(10000.0d0)    
    !print*,(6.5821128d-22*299729458)**2
   

    !open(22,file='results/lamdasDiff12.dat')
    !open(23,file='results/lamdasDiff23.dat')
    !open(24,file='results/lamdasDiff13.dat')
    !do k=1,10000
    !    Ne = Ne + jump
    !    write(22,*) Ne,ABS(real(coefficientLambda(1,t12,t23,t13,delta,sm,aM,P,nu,Ne)  &
    !                           -coefficientLambda(2,t12,t23,t13,delta,sm,aM,P,nu,Ne)))
    !    write(23,*) Ne,ABS(real(coefficientLambda(2,t12,t23,t13,delta,sm,aM,P,nu,Ne)  &
    !                           -coefficientLambda(3,t12,t23,t13,delta,sm,aM,P,nu,Ne)))
    !    write(24,*) Ne,ABS(real(coefficientLambda(1,t12,t23,t13,delta,sm,aM,P,nu,Ne)  &
    !                           -coefficientLambda(3,t12,t23,t13,delta,sm,aM,P,nu,Ne)))
        !print*,k
    !enddo
    !close(22)
    !close(23)
    !close(24)

    !jump=(1.0d-12 -Ne)/(10000.0d0)    

    !open(21,file='results/probabilityChartwithCHangeofunidades2.dat')
    !do k=1,10000
    !    Ne = Ne + jump
    !    write(21,*) matterDensity(nu,Ne), real(probabilityOfTransitionAB(1,1,L,t12,t23,t13,delta,sm,aM,P,nu,Ne))
    !    print*,k
    !enddo
    !close(21)  
    
    
   end program solar_neutrino