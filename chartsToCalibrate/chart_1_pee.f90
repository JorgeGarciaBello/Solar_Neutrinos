subroutine chart1Pee()
    implicit none
    real(8), parameter :: PI=3.141592653589793238462643d0
    real(8), parameter :: N_A=6.0221415D23  ! N_A is the Avogadro's number [1/mol]
    real(8) :: t12,t23,t13,delta
    real(8) :: sm,aM              ! sm,aM are the squared mass difference m=m_21 y M=m_32
    real(8) :: P    
    real(8) :: eta,rEarth
    real(8) :: L                  ! L is the length between the source of neutrinos an the position
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino
    real(8) :: Ne                 ! Ne is the electron density
    real(8) :: Ne1,Ne2            ! Ne1, Ne2 is the electron density intervals

    !real(8),parameter :: scalaFactor=2.5399811853d10! scalaFactor is the scala factor to obtein length in [eV^{-1}]

    real(8) :: probabilityOfTransitionAB    
    real(8) :: matterDensity
    real(8) :: jump
    integer :: k
    
    t12=PI/4.0d0         ! equiv to 45 degrees
    t23=PI/4.0d0         ! equiv to 45 degrees
    t13=PI*0.027777778d0 ! equiv to 5 degrees
    delta=0.0d0
    sm=1E-4
    aM=1E-3
    P=10.0d0             ! Energía en [GeV]
    eta=0.2d0
    rEarth=6378.d0       ! Longitud en [Km]
    L=2.0d0*eta*rEarth
    nu=1
    Ne1=3.612742147D-50*N_A**2 ![cm^{-3}/N_A] Se debe multiplicar por N_A**2 para obtener las dimensiones deseadas de [N_A/cm^{-3}] !0.789265983d22
    Ne2=3.612742147D-47*N_A**2 ![cm^{-3}/N_A] Se debe multiplicar por N_A**2 para obtener las dimensiones deseadas de [N_A/cm^{-3}] !0.789265983d22

    jump=(Ne2 -Ne1)/(10000.0d0)
    print*,'Chart1Pee'
    open(26,file='results/chart1Pee_unidades_solares.dat')
    do k=1,10000
        Ne1 = Ne1 + jump
        write(26,*) matterDensity(nu,Ne1), probabilityOfTransitionAB(1,1,L,t12,t23,t13,delta,sm,aM,P,nu,Ne1)
    enddo
    close(26)
    return
end subroutine chart1Pee