double complex function coefficientLambda(Li,t12,t23,t13,delta,sm,aM,P,nu,Ne)
    implicit none
    integer :: Li                 ! Li is the number of coefficient lambda
    real(8) :: t12,t23,t13,delta  ! Are the three mixing angles and the CP-violation phase of the mixing matrix
    real(8) :: sm,aM              ! sm,aM are the squared mass difference m=m_21 y M=m_32
    real(8) :: P                  ! P es el momento del neutrino
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino    
    real(8) :: Ne                 ! Ne is the electron density
    
    real(8) :: coefficientC       ! is the function that return the coefficients c0,c1,c2    
    real(8) :: c0,c1,c2           ! are the coefficients c0,c1,c2 of the model   
    
    real(8) :: v13,v427           ! are the variables with 1/3 and 4/27
    real(8) :: val1,val2          ! are auxiliar variables

    c0=coefficientC(0,t12,t23,t13,delta,sm,aM,P,nu,Ne)
    c1=coefficientC(1,t12,t23,t13,delta,sm,aM,P,nu,Ne)
    c2=coefficientC(2,t12,t23,t13,delta,sm,aM,P,nu,Ne)    

    v13=(1.0d0/3.0d0)
    v427=(4.0d0/27.0d0)

    val1=sqrt(-v13*c1)*cos(  v13*ATAN( (1.0D0/c0)*sqrt(-c0**2-v427*c1**3) )     )
    val2=sqrt(-c1)*sin(      v13*ATAN( (1.0d0/c0)*sqrt(-c0**2-v427*c1**3) )     )

    select case(Li)
        case(1)
            coefficientLambda=cmplx(-val1+val2,0.0d0)
        case(2)
            coefficientLambda=cmplx(-val1-val2,0.0d0)
        case(3)
            coefficientLambda=cmplx(2.0d0*val1,0.0d0)
        case DEFAULT
            coefficientLambda=cmplx(0.0d0,0.0d0)
    end select

    return
end function coefficientLambda