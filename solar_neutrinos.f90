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
    real(8) :: probabilityOfTransitionAB
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

    real(8) :: B8_e_sptrm(829,2) ! Neutrino energy spectrum from Boro-8 [MeV]
    real(8) :: F17_e_sptrm(500,2)! Neutrino energy spectrum from Florio-8 [MeV]
    real(8) :: HEP_e_sptrm(1000,2)! Neutrino energy spectrum from HEP reaction [MeV]
    real(8) :: N13_e_sptrm(200,2)! Neutrino energy spectrum from nitrogen-13 [MeV]
    real(8) :: O15_e_sptrm(500,2)! Neutrino energy spectrum from oxygen-13 [MeV]
    real(8) :: PP_e_sptrm(84,2)  ! Neutrino energy spectrum from oxygen-13 [Mev]
    real(8) :: solarRadios(1219)  ! solarRadios is an array with the radii of the different layers of the Sun [1/Solar Rdio]
    real(8) :: logElectronDensity(1219)! Is an array with the Logarithm     
    real(8) :: PP(1219)           ! Fraction of pp neutrinos produced in the zone 
    real(8) :: PEP(1219)          ! Fraction of pep neutrinos produced in the zone
    real(8) :: HEP(1219)          ! Fraction of hep neutrinos produced in the zone
    real(8) :: Oxygen15(1219)     ! Fraction of oxygen 15 neutrinos produced in the zone
    real(8) :: Nitrogen13(1219)   ! Fraction of nitrogen 13 neutrinos produced in the zone
    real(8) :: Beryllium7(1219)   ! Fraction of beryllium 7 neutrinos produced in the zone
    real(8) :: Florine17(1219)    ! Fraction of florine 17 neutrinos produced in the zone
    real(8) :: Boron8(1219)       ! Fraction of boron 8 neutrinos produced in the zone  

    double complex :: iterUfL(3,3)! iterUfL is the time evolution operator matrix in the flavour base iterative for diferents lengths and electron densities
    real(8) :: a_density(1219)    ! a_density is an array with the corresponding electron densities
    
    t12=PI/4.0d0         ! equiv to 45 degrees
    t23=PI/4.0d0         ! equiv to 45 degrees
    t13=PI*0.027777778d0 ! equiv to 5 degrees
    delta=0.00000000d0
    sm=1E-4              ! [eV^2]
    aM=1E-3              ! [eV^2]
    eta=0.2d0
    rEarth=6378.d0       ! 6378.d0 [Km]
    L=2.0d0*eta*rEarth   ! [Km]
    P=10.0d9             ! [GeV]
    nu=1
    Ne=1.0d-15

    !call chart1Pee()
    call chart2Pee()
    call chart3Pee()

    !call boro8SolarOsc(t12,t23,t13,delta,sm,aM,nu)
    !call readData(B8_e_sptrm,F17_e_sptrm,HEP_e_sptrm,N13_e_sptrm,O15_e_sptrm,PP_e_sptrm,   &
    !                solarRadios,logElectronDensity,PP,PEP,HEP,Oxygen15,Nitrogen13,Beryllium7,&
    !                Florine17,Boron8)
  
    
   end program solar_neutrino