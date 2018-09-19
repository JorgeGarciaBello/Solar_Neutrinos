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
    double complex :: Vf(3,3)     ! Vf is the hamiltonian for the propagation of the neutrinos in vacuum
    double complex :: Vm(3,3)     ! Vm is the potential matrix in mass basm
    double complex :: Hdiff(3,3)  ! Hdiff is the hamiltonian differential 
    double complex :: Hdiag(3,3)  ! Hdiag is the hamiltonian differential 
    double complex :: Hv(3,3)     ! Hv is the hamiltonian for the propagation of the neutrinos in vacuum
    double complex :: traceHm
    double complex :: inverseLambdaMtrx(3,3)! Inverse matrix
    
    t12=PI/4.0d0         ! equiv to 45 degrees
    t23=PI/4.0d0         ! equiv to 45 degrees
    t13=PI*0.027777778d0 ! equiv to 5 degrees
    delta=0.00000000d0
    sm=1E-4
    aM=1E-3

    eta=0.2d0
    rEarth=6378.d0
    L=2.0d0*eta*rEarth
    P=10.0d0
    
    nu=3
    Ne=1.0d-15
    
    !print*, 'eigenvalues lambda: '
    !call lambdaFromEISPACK(Ls,t12,t23,t13,delta,sm,aM,P,nu,Ne)
    !print*, Ls(1)
    !print*, Ls(2)
    !print*, Ls(3)

    !print*, 'vectE:'
    !call vectorE(vectE,L,t12,t23,t13,delta,sm,aM,P,nu,Ne)
    !print*,vectE(1)
    !print*,vectE(2)
    !print*,vectE(3)
    !PRINT*,'lambda MATRIX: '
    !CALL lambdaMatrix(lambdaMtrx,L,t12,t23,t13,delta,sm,aM,P,nu,Ne)
    !PRINT*,lambdaMtrx(1,:)
    !PRINT*,lambdaMtrx(2,:)
    !PRINT*,lambdaMtrx(3,:)
    !PRINT*,'inverse lambda MATRIX:'
    !call inverseMatrix(lambdaMtrx,inverseLambdaMtrx)
    !PRINT*,inverseLambdaMtrx(1,:)
    !PRINT*,inverseLambdaMtrx(2,:)
    !PRINT*,inverseLambdaMtrx(3,:)

    !PRINT*, 'PRODUCTO LAMDA LAMDA INVERSA:'
    !U=matmul(inverseLambdaMtrx,lambdaMtrx)
    !print*,U(1,:)
    !print*,U(2,:)
    !print*,U(3,:)
    !PRINT*, 'vector A:'
    !call vectorA(vectA,L,t12,t23,t13,delta,sm,aM,P,nu,Ne)
    !print*,vectA(1)
    !print*,vectA(2)
    !print*,vectA(3)   
    
    !PRINT*, 'Fase global phi:'
    !print*, complexPhaseFactor(t12,t23,t13,delta,sm,aM,L,P,nu,Ne)

    !pRINT*, 'OPERADOR D EEVOLUCION TEMPORAL EN BASE DE MASAS:'
    !call timeEvolutionOperatorMassBase(UmL,L,t12,t23,t13,delta,sm,aM,P,nu,Ne)
    !print*,UmL(1,:)
    !print*,UmL(2,:)
    !print*,UmL(3,:)


    !call totalHamiltonianMassBase(t_Hm,t12,t23,t13,delta,sm,aM,P,nu,Ne)
    !print*,'******total_hamiltonian'
    !print*,t_Hm(1,:)
    !print*,t_Hm(2,:)
    !print*,t_Hm(3,:)
    call chart1Pee()
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