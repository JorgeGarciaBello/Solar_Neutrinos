subroutine chartPemInVaccum()
    implicit none
    real(8), parameter :: PI=3.141592653589793238462643d0
    real(8) :: t12,t23,t13,delta
    real(8) :: sm,aM              ! sm,aM are the squared mass difference m=m_21 y M=m_32
    real(8) :: P    
    real(8) :: eta,rEarth
    real(8) :: L                  ! L is the length between the source of neutrinos an the position
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino
    real(8) :: Ne                 ! Ne is the electron density    

    real(8) :: probabilityOfTransitionAB
    real(8) :: matterDensity
    real(8) :: jump
    integer :: k

    double complex :: lambdaMtrx(3,3)! lambdaMtrx is the matrix of the model
    double complex :: Ls(3)       ! Ls is an array with the values of coefficients lambda    
    double complex :: T(3,3)      ! T is a traceless matrix from the model
    double complex :: U(3,3)      ! U is the mixing matrix of the oscillation model
    double complex :: t_Hm(3,3)   ! t_Hm is the sum of Hamiltonian in vacumm (mass base)  and the potental in the base of mass
    
    t12=PI/4.0d0         ! equiv to 45 degrees
    t23=0.0d0!PI/4.0d0   ! equiv to 45 degrees
    t13=0.0d0!PI*0.027777778d0 ! equiv to 5 degrees
    delta=0.0
    sm=1E-4              ! [eV^2]
    aM=1E-3              ! [eV^2]
    L=1.0d0              ! [Km]   
    P=1.0d0              ! Energía en [GeV]    
    nu=3
    Ne=0.0


    !print*,'Hamiltoniano'
    !call totalHamiltonianMassBase(t_Hm,t12,t23,t13,delta,sm,aM,P,nu,Ne)
    !print*,t_Hm(1,:)
    !print*,t_Hm(2,:)
    !print*,t_Hm(3,:)

    !call mixingMatrix(U,t12,t13,t23,delta)
    !print*, U(1,:)
    !print*, U(2,:)
    !print*, U(3,:)
   
    print*,'chartPemVaccum'
    open(33,file='results/chartPemVaccum.dat')
    do k=1,10000
        write(33,*) L/P, probabilityOfTransitionAB(1,2,L,t12,t23,t13,delta,sm,aM,P,nu,Ne)
        L=L + 9.9999d0
    enddo
    close(33)
    return
end subroutine chartPemInVaccum