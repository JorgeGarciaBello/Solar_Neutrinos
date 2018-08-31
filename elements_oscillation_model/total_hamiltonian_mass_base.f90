subroutine totalHamiltonianMassBase()
implicit none
real(8) :: Vm(3,3)            ! Vm is the potential matrix in mass base
double complex :: U(3,3)      ! U is the mixing matrix of the oscillation model    
double complex :: U_1(3,3)    ! U is the mixing matrix of the oscillation model    
real(8) :: t12,t23,t13        ! Are the mixing angles of hte oscillation model
real(8) :: delta              ! delta is the phase factor for CP violations
integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino    
real(8) :: Ne                 ! Ne is the electron density
real(8) :: potentialMatrixMassBase

call hamilt
call potentialMatrixMassBase(Vm,U,U_1,t12,t23,t13,delta,nu,Ne)



return
subroutine totalHamiltonianMassBase