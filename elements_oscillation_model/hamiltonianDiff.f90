!################################################
!
!   hamiltonianDiff: is a subroutine that 
!       load the hamiltonian-diff-matrix 
!
!################################################
subroutine hamiltonianDiff(Hdiff,sm,aM,P)
    implicit none
    double complex :: Hdiff(3,3)  ! Hdiff is the hamiltonian differential 
    real(8) :: sm,aM                ! sm,aM are the squared mass difference m=m_21 y M=m_32
    real(8) :: P                  ! P es el momento del neutrino o la enerǵia total       

    Hdiff(1,1)=cmplx(-sm/(2.0d0*P),0.0d0);  Hdiff(1,2)=0.0d0;      Hdiff(1,3)=0.0d0
    Hdiff(2,1)=0.0d0;                      Hdiff(2,2)=0.0d0;      Hdiff(2,3)=0.0d0
    Hdiff(3,1)=0.0d0;                      Hdiff(3,2)=0.0d0;      Hdiff(3,3)=cmplx(aM/(2.0d0*P),0.0d0)
    return
end subroutine hamiltonianDiff