double complex function coefficientC(Ci,t12,t23,t13,delta,m1,m2,m3,P,nu,Ne)
    implicit none
    integer :: Ci                 ! Ci is the number of coeffienct C of the characteristic polynomial of matrix T 
    double complex :: T(3,3)             ! T is a traceless matrix from the model
    real(8) :: t12,t23,t13,delta  ! Are the three mixing angles and the CP-violation phase of the mixing matrix
    real(8) :: m1,m2,m3           ! m1,m2,m3 are the masses of the mass-eogenstates
    real(8) :: P                  ! P es el momento del neutrino
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino    
    real(8) :: Ne                 ! Ne is the electron density

    select case(Ci)
        case(0)
            call tMatrix(T,t12,t23,t13,delta,m1,m2,m3,P,nu,Ne)
            coefficientC = -(   T(1,1)+T(2,2)+T(3,3)  )
        case(1)
            call tMatrix(T,t12,t23,t13,delta,m1,m2,m3,P,nu,Ne)
            coefficientC =  T(1,1)*T(2,2)-T(1,2)*T(2,1) &
                           +T(1,1)*T(3,3)-T(1,3)*T(3,1) &
                           +T(2,2)*T(3,3)-T(2,3)*T(3,2)
        case(2)
            coefficientC = 0.0d0
        case DEFAULT
            coefficientC = 0.0d0
    end select    
    return
end function coefficientC