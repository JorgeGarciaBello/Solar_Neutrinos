real(8) function coefficientS(Si,t12,t23,t13,delta,m1,m2,m3,P,nu,Ne)
    implicit none
    integer :: Si                 ! Si es the number of coeffient S
    real(8) :: t12,t23,t13,delta  ! Are the three mixing angles and the CP-violation phase of the mixing matrix
    real(8) :: m1,m2,m3           ! m1,m2,m3 are the masses of the mass-eogenstates
    real(8) :: P                  ! P es el momento del neutrino
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino    
    real(8) :: Ne                 ! Ne is the electron density

    real(8) :: qrTerms            ! is the function that return the values of coefficients r y q
    real(8) :: r,q                ! r,q are the coefficients r y q of the oscillatin in matter model

    q=qrTerms(1,t12,t23,t13,delta,m1,m2,m3,P,nu,Ne)
    r=qrTerms(2,t12,t23,t13,delta,m1,m2,m3,P,nu,Ne)

    select case(Si)
        case(1)
            coefficientS=(r+SQRT(q**3+r**2))**(1/3)
        case(2)
            coefficientS=(r-SQRT(q**3+r**2))**(1/3)
        case DEFAULT
            coefficientS=0.0d0
    end select

    return
end function coefficientS