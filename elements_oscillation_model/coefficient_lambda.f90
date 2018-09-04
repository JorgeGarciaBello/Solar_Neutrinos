double complex function coefficientLambda(Li,t12,t23,t13,delta,m1,m2,m3,P,nu,Ne)
    implicit none
    integer :: Li                 ! Li is the number of coefficient lambda
    real(8) :: t12,t23,t13,delta  ! Are the three mixing angles and the CP-violation phase of the mixing matrix
    real(8) :: m1,m2,m3           ! m1,m2,m3 are the masses of the mass-eogenstates
    real(8) :: P                  ! P es el momento del neutrino
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino    
    real(8) :: Ne                 ! Ne is the electron density

    real(8) :: coefficientS       ! is the function that return the coefficients s1 and s2
    real(8) :: s1,s2              ! are the coefficients s1 and s2 of the model
    real(8), PARAMETER :: ROOT3_2=0.866025404 ! ROOT3_2 is the square root of 3 divided by 2 

    s1=coefficientS(1,t12,t23,t13,delta,m1,m2,m3,P,nu,Ne)
    s2=coefficientS(2,t12,t23,t13,delta,m1,m2,m3,P,nu,Ne)

    print*,'s1',s1
    print*,'s2',s2

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
    return
end function coefficientLambda