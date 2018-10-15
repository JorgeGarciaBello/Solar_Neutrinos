!################################################
!
!   matterDensity: is a functions that return
!       the matter density value for neutrinos 
!       (nu=1) or antineutrinos (nu=2) giving 
!       an electron density Ne
!
!################################################
real(8) function matterDensity(nu,Ne) ! Units [eV]
    implicit none
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino
    real(8) :: Ne                 ! Ne is the electron density
    real(8), parameter :: sqrt2GF=7.6324D-14! Fermi constant [eV cm^{3}/N_A]
    real(8), parameter :: N_A=6.0221415D23  ! N_A is the Avogadro's number [1/mol]

    matterDensity=0.0d0
    select case(nu)
        case(1)
            !matterDensity=(sqrt2GF/N_A)*Ne
            matterDensity=(sqrt2GF)*Ne
        case(2)
            !matterDensity=-(sqrt2GF/N_A)*Ne
            matterDensity=-(sqrt2GF)*Ne

        case default
            print*, nu            
            print*, 'Error: no existe la opcion-matterDensity=0.0'
            print*,'nu',nu
            print*,'Ne',Ne
            stop
    end select
end function matterDensity