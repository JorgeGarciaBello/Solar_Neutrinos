!################################################
!
!   hamiltonianInVacuum: is a subroutine that 
!       load the hamiltonian-vacuum-matrix 
!
!################################################
subroutine hamiltonianInVacuum(Hv,sm,aM,P)
    implicit none
    double complex :: Hv(3,3)     ! Hv is the hamiltonian for the propagation of the neutrinos in vacuum
    real(8) :: sm,aM              ! sm,aM are the squared mass difference m=m_21 y M=m_32
    real(8) :: P                  ! P es el momento del neutrino o la enerǵia total

    double complex :: Hdiff(3,3)  ! Hdiff is the hamiltonian differential 
    double complex :: Hdiag(3,3)  ! Hdiag is the hamiltonian differential 
    
    print*, 'hamiltonianInVacuum'
    call hamiltonianDiff(Hdiff,sm,aM,P)
    print*,'Hdiff',Hdiff
    print*,'sm',sm
    print*,'aM',aM
    print*,'P',P
    call hamiltonianDiag(Hdiag)
    print*,'Hdiag',Hdiag

    Hv = Hdiff + Hdiag
    return
end subroutine hamiltonianInVacuum