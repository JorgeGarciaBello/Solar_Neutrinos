real(8) function qrTerms(q_r,t12,t23,t13,delta,sm,aM,P,nu,Ne)
    implicit none
    integer :: q_r    
    real(8) :: t12,t23,t13,delta  ! Are the three mixing angles and the CP-violation phase of the mixing matrix
    real(8) :: sm,aM              ! sm,aM are the squared mass difference m=m_21 y M=m_32
    real(8) :: P                  ! P es el momento del neutrino
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino    
    real(8) :: Ne                 ! Ne is the electron density

    real(8) :: coefficientC       ! Is the function that return the coeffienct C of the characteristic polynomial of matrix T    
    real(8) :: c0, c1             ! Are the coeffienct C of the characteristic polynomial of matrix T

    c0=coefficientC(0,t12,t23,t13,delta,sm,aM,P,nu,Ne)
    c1=coefficientC(1,t12,t23,t13,delta,sm,aM,P,nu,Ne)

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