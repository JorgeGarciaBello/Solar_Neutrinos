subroutine iterativeTimeEvolutionOperator(iterUfL,P,ld,t12,t23,t13,delta,sm,aM,nu,a_density)
    implicit none
    double complex :: iterUfL(3,3)! iterUfL is the time evolution operator matrix in the flavour base iterative for diferents lengths and electron densities
    real(8) :: P                  ! P es el momento del neutrino, total energy
    real(8) :: ld                 ! ls is the lengths of the solar ratios and the corresponding electron densities
    real(8) :: a_density(1219)    ! a_density is an array with the corresponding electron densities
    real(8) :: t12,t23,t13,delta  ! Are the three mixing angles and the CP-violation phase of the mixing matrix
    real(8) :: sm,aM              ! sm,aM are the squared mass difference m=m_21 y M=m_32    
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino
    
    integer :: k
    double complex :: UfL(3,3)    ! UfL is the time evolution operator matrix in the flavour base
    double complex :: I(3,3)      ! I is the identity matrix

    call identityMatrix(I)
    iterUfL=I
    do k=1,1219
        call timeEvolutionOperatorFlavourBase(UfL,ld,t12,t23,t13,delta,sm,aM,P,nu,exp(a_density(k)))
        iterUfL=matmul(UfL,iterUfL)
    enddo
    return
end subroutine iterativeTimeEvolutionOperator