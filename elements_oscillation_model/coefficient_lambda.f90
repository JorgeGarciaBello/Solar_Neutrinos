double complex function coefficientLambda(Li,t12,t23,t13,delta,sm,aM,P,nu,Ne)
    implicit none
    integer :: Li                 ! Li is the number of coefficient lambda
    real(8) :: t12,t23,t13,delta  ! Are the three mixing angles and the CP-violation phase of the mixing matrix
    real(8) :: sm,aM              ! sm,aM are the squared mass difference m=m_21 y M=m_32
    real(8) :: P                  ! P es el momento del neutrino
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino    
    real(8) :: Ne                 ! Ne is the electron density

    real(8) :: coefficientS       ! is the function that return the coefficients s1 and s2
    real(8) :: coefficientC       ! is the function that return the coefficients c0,c1,c2
    real(8) :: s1,s2              ! are the coefficients s1 and s2 of the model
    real(8) :: c0,c1,c2           ! are the coefficients c0,c1,c2 of the model
    real(8), PARAMETER :: ROOT3_2=0.866025404 ! ROOT3_2 is the square root of 3 divided by 2 

    integer :: form
    real(8) :: v13,v427           ! are the variables with 1/3 and 4/27

    s1=coefficientS(1,t12,t23,t13,delta,sm,aM,P,nu,Ne)
    s2=coefficientS(2,t12,t23,t13,delta,sm,aM,P,nu,Ne)

    c0=coefficientC(0,t12,t23,t13,delta,sm,aM,P,nu,Ne)
    c1=coefficientC(1,t12,t23,t13,delta,sm,aM,P,nu,Ne)
    c2=coefficientC(2,t12,t23,t13,delta,sm,aM,P,nu,Ne)

    v13=(1.0d0/3.0d0)
    v427=(4.0d0/27.0d0)

    !print*,'s1',s1
    !print*,'s2',s2
    form=2 ! form es 1 para las lamdas definidas como complejos y 2 para no complejos
    select case (form)
        case(1)
            select case(Li)
                case(1)
                    coefficientLambda=cmplx((-0.5d0*(s1+s2)),(ROOT3_2*(s1-s2)))
                case(2)
                    coefficientLambda=cmplx((-0.5d0*(s1+s2)),-(ROOT3_2*(s1-s2)))
                case(3)
                    coefficientLambda=cmplx((s1+s2),0.0d0)
                case DEFAULT
                    coefficientLambda=cmplx(0.0d0,0.0d0)
            end select
        case(2)
            select case(Li)
                case(1)
                    coefficientLambda=cmplx(-sqrt(-v13*c1)*cos(v13*ATAN((1.0D0/c0)*sqrt(-c0**2-v427*c1**3))) &
                                            +sqrt(-c1)*sin(v13*ATAN((1.0d0/c0)*sqrt(-c0**2-v427*c1**3))),0.0d0)
                case(2)
                    coefficientLambda=cmplx(-sqrt(-v13*c1)*cos(v13*ATAN((1.0D0/c0)*sqrt(-c0**2-v427*c1**3))) &
                                            -sqrt(-c1)*sin(v13*ATAN((1.0d0/c0)*sqrt(-c0**2-v427*c1**3))),0.0d0)
                case(3)
                    coefficientLambda=cmplx(2.0d0*sqrt(-v13*c1)*cos(v13*ATAN((1.0d0/c0)*sqrt(-c0**2-v427*c1**3))),0.0d0)
                case DEFAULT
                    coefficientLambda=cmplx(0.0d0,0.0d0)
            end select
        case DEFAULT

        end select
    return
end function coefficientLambda