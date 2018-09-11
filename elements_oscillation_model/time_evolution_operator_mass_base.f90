!################################################
!
!   timeEvolutionOperatorMassBase: is a subroutine 
!       that load the time evolution operator
!       in the mass base as function of length L
!
!################################################
subroutine timeEvolutionOperatorMassBase(UmL,L,t12,t23,t13,delta,m1,m2,m3,P,nu,Ne)
    implicit none
    real(8) :: UmL(3,3)           ! UmL is the time evolution operator matrix in the mass base
    real(8) :: L                  ! L is the length between the source of neutrinos an the position

    real(8) :: complexPhaseFactor ! is the function that return the value of the complex fase factor phi of the model
    real(8) :: coefficientLambda  ! is the function that return the values of the lambda terms of the model
    real(8) :: coefficientC       ! is the function that return the values of the C coefficients os the model
    real(8) :: phi                ! is the complex phase factor value    
    real(8) :: c1                 ! is the coefficient c1 of the model
    real(8) :: t12,t23,t13,delta  ! Are the three mixing angles and the CP-violation phase of the mixing matrix
    real(8) :: m1,m2,m3           ! m1,m2,m3 are the masses of the mass-eogenstates    
    real(8) :: P                  ! P es el momento del neutrino
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino    
    real(8) :: Ne                 ! Ne is the electron density

    real(8) :: I(3,3)             ! I is the identity matrix
    real(8) :: T(3,3)             ! T is the T-matrix (3,3)
    real(8) :: T2(3,3)            ! T2 is the T-matrix squared (3,3)

    integer :: a

    phi = complexPhaseFactor(t12,t23,t13,delta,m1,m2,m3,L,P,nu,Ne)  
    c1 = coefficientC(1,t12,t23,t13,delta,m1,m2,m3,P,nu,Ne)

    call identityMatrix(I)
    call tMatrix(T,t12,t23,t13,delta,m1,m2,m3,P,nu,Ne)
    call tMatrix2(T2,t12,t23,t13,delta,m1,m2,m3,P,nu,Ne)

    UmL(:,:) =0.0d0
    do a=1,3
        UmL = UmL + cmplx(cos(L*coefficientLambda(a,t12,t23,t13,delta,m1,m2,m3,P,nu,Ne)),                &
                        -sin(L*coefficientLambda(a,t12,t23,t13,delta,m1,m2,m3,P,nu,Ne)))*                &
                        (1.0d0/(3.0d0*(coefficientLambda(a,t12,t23,t13,delta,m1,m2,m3,P,nu,Ne))**2+c1))* &
                        (((coefficientLambda(a,t12,t23,t13,delta,m1,m2,m3,P,nu,Ne))**2+c1)*I             &
                         + coefficientLambda(a,t12,t23,t13,delta,m1,m2,m3,P,nu,Ne)*T                     &
                         + T2) ! + matmul(T,T) )
    end do
    UmL=UmL*phi
    return
end subroutine timeEvolutionOperatorMassBase



