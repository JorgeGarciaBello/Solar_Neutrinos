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
    real(8) :: Ne                 ! Ne is the electron density [N_A/cm^{3}]
    real(8), parameter :: sqrt2GF=7.6324D-14! Fermi constant [eV cm^{3}/N_A]
    real(8), parameter :: N_A=6.0221415D23  ! N_A is the Avogadro's number [1/mol]

    matterDensity=0.0d0
    !print*, 'Ne in matterDensity: ', Ne
    matterDensity=(sqrt2GF)*Ne ! Utilizar para cuando Ne = [N_A/cm^{3}], en el caso la densidad en el Sol dada por John Bahcall
                               ! los datos vienen dados en  [cm^{-3}/N_A] por lo que hay que multiplicarlos por N_A**2
    select case(nu)
        case(1)
            matterDensity=matterDensity            
        case(2)
            matterDensity=-matterDensity            
        case default
            print*, nu            
            print*, 'Error: no existe la opcion-matterDensity=0.0'
            print*,'nu',nu
            print*,'Ne',Ne
            stop
    end select
end function matterDensity