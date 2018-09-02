!################################################
!
!   inverseMixingMatrix: is a subroutine that load
!       the inverse mixing matrix of the model of
!       neutrino oscillation
!
!################################################
subroutine inverseMixingMatrix(U_1,t12,t23,t13,delta)
    implicit none
    double complex :: U_1(3,3)    ! U is the mixing matrix of the oscillation model    
    real(8) :: t12,t23,t13        ! Are the mixing angles of hte oscillation model
    real(8) :: delta              ! delta is the phase factor for CP violations

    real(8) :: s12,s23,s13        ! Are the sin's os the mixing angles of the oscillation model
    real(8) :: c12,c23,c13        ! Are the cos's os the mixing angles of the oscillation model
    double complex :: arg,exp_delta   

    s12=sin(t12); s23=sin(t23); s13=sin(t13)
    c12=cos(t12); c23=cos(t23); c13=cos(t13)

    arg=cmplx(0.0,-delta)
    exp_delta=exp(arg)

    U_1(1,1)=c13*c12;                            U_1(2,1)=c13*s12;                        U_1(3,1)=s13*exp(cmplx(0.0d0,-delta))
    U_1(1,2)=-s12*c23-c12*s23*s13*exp(cmplx(0.0d0,delta)); U_1(2,2)=c12*c23-s12*s23*s13*exp(cmplx(0.0d0,delta));  U_1(3,2)=s23*c13
    U_1(1,3)=s12*s23-c12*c23*s13*exp(cmplx(0.0d0,delta));  U_1(2,3)=-c12*s23-s12*c23*s13*exp(cmplx(0.0d0,delta)); U_1(3,3)=c23*c13    
    !print*, 'U_1(1,3)', U_1(1,3)
    return
end subroutine inverseMixingMatrix