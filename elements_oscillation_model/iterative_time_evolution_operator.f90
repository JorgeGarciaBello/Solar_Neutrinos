subroutine iterativeTimeEvolutionOperator(iterUfL,P,ld,t12,t23,t13,delta,sm,aM,nu)
    implicit none
    double complex :: iterUfL(3,3)! iterUfL is the time evolution operator matrix in the flavour base iterative for diferents lengths and electron densities
    real(8) :: P                  ! P es el momento del neutrino
    real(8) :: ld(1219,2)         ! ls is an array with the lengths of the solar ratio and the corresponding electron densities   
    real(8) :: t12,t23,t13,delta  ! Are the three mixing angles and the CP-violation phase of the mixing matrix
    real(8) :: sm,aM              ! sm,aM are the squared mass difference m=m_21 y M=m_32    
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino
    
    integer :: k
    double complex :: UfL(3,3)    ! UfL is the time evolution operator matrix in the flavour base
    double complex :: I(3,3)      ! I is the identity matrix

    call identityMatrix(I)
    iterUfL=I
    do k=1,1219
        call timeEvolutionOperatorFlavourBase(UfL,ld(k,1),t12,t23,t13,delta,sm,aM,P,nu,ld(k,2))
        iterUfL=matmul(UfL,iterUfL)
    enddo
    return
end subroutine iterativeTimeEvolutionOperator