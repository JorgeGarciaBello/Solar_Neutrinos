!################################################
!
!   potentialMatrixMassBase: is a subroutine 
!       that load the potential Vf matrix 
!
!################################################
subroutine potentialMatrixMassBase(Vm,U,U_1,t12,t23,t13,delta,nu,Ne)
    implicit none
    real(8) :: Vm(3,3)            ! Vm is the potential matrix in mass base
    double complex :: U(3,3)      ! U is the mixing matrix of the oscillation model    
    double complex :: U_1(3,3)    ! U is the mixing matrix of the oscillation model    
    real(8) :: t12,t23,t13        ! Are the mixing angles of hte oscillation model
    real(8) :: delta              ! delta is the phase factor for CP violations
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino    
    real(8) :: Ne                 ! Ne is the electron density
    
    real(8) :: Vf(3,3)            ! Vf is the hamiltonian for the propagation of the neutrinos in vacuum
    
    call mixingMatrix(U,t12,t23,t13,delta)
    call inverseMixingMatrix(U_1,t12,t23,t13,delta)
    call potentialMatrixFlavourBase(Vf,nu,Ne)    
    

    Vm=matmul( matmul(U_1,Vf),U )

    return
end subroutine potentialMatrixMassBase