real(8) function mixing_matrix(i,j,t12,t23,t13,delta)
    implicit none
    integer :: i,j
    real(8) :: t12,t23,t13
    real(8) :: delta

    real(8) :: s12,s23,s13
    real(8) :: c12,c23,c13    
    double complex :: arg,exp_delta
    real(8) :: U(3,3)
    

    s12=sin(t12); s23=sin(t23); s13=sin(t13)
    c12=cos(t12); c23=cos(t23); c13=cos(t13)

    arg=cmplx(0.0,-delta)
    exp_delta=exp(arg)    

    U(1,1)=c13*c12;           U(1,2)=c13*s12;       U(1,3)=s13*exp(cmplx(0.0,-delta))
    U(2,1)=-s12*c23-c12*s23*s13*exp(cmplx(0.0,delta)); U(2,2)=c12*c23-s12*s23*s13*exp(cmplx(0.0,delta));  U(2,3)=s23*c13
    U(3,1)=s12*s23-c12*c23*s13*exp(cmplx(0.0,delta));  U(3,2)=-c12*s23-s12*c23*s13*exp(cmplx(0.0,delta)); U(3,3)=c23*c13
    mixing_matrix=U(i,j)
    return
end function mixing_matrix