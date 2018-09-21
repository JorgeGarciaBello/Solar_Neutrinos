!################################################
!
!   matterDensity: is a functions that return
!       the matter density value for neutrinos 
!       (nu=1) or antineutrinos (nu=2) giving 
!       an electron density Ne
!
!################################################
real(8) function matterDensity(nu,Ne)
    implicit none
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino
    real(8) :: Ne                 ! Ne is the electron density
    real(8), parameter :: GF=1.16637d-5      ! Fermi constant [GeV^(-2)]
    !real(8), parameter :: GF=8.961876064d-47 ! Fermi constant [ev m^(3)]
    real(8), parameter :: SQRT2=1.414213562d0! SQRT is the value of square of 2    
    

    matterDensity=0.0d0
    select case(nu)
        case(1)
            matterDensity=SQRT2*GF*Ne
        case(2)
            matterDensity=-SQRT2*GF*Ne
        case(3)
            matterDensity=5.067731d9*Ne
        case default            
        print*, nu
        stop
            print*, 'Error: no existe la opcion-matterDensity=0.0'
            print*,'nu',nu
            print*,'Ne',Ne
    end select
end function matterDensity