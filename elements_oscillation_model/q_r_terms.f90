real(8) function qrTerms(q_r,t12,t23,t13,delta,m1,m2,m3,P,nu,Ne)
    implicit none
    integer :: q_r    
    real(8) :: t12,t23,t13,delta  ! Are the three mixing angles and the CP-violation phase of the mixing matrix
    real(8) :: m1,m2,m3           ! m1,m2,m3 are the masses of the mass-eogenstates
    real(8) :: P                  ! P es el momento del neutrino
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino    
    real(8) :: Ne                 ! Ne is the electron density

    real(8) :: coefficientC       ! Is the function that return the coeffienct C of the characteristic polynomial of matrix T    
    real(8) :: c0, c1             ! Are the coeffienct C of the characteristic polynomial of matrix T

    c0=coefficientC(0,t12,t23,t13,delta,m1,m2,m3,P,nu,Ne)
    c1=coefficientC(1,t12,t23,t13,delta,m1,m2,m3,P,nu,Ne)

    select case(q_r)
        case(1)
            qrTerms=(c1/3.0d0)
        case(2)
            qrTerms=-(c0/2.0d0)
        case DEFAULT
            qrTerms=0.0d0
    end select
    return
end function qrTerms