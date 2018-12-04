double complex function solarProbabilityAmplitude(iterUfL,flvr1,flvr2)
    implicit none
    double complex :: iterUfL(3,3)! iterUfL is the time evolution operator matrix in the flavour base iterative for diferents lengths and electron densities
    integer :: flvr1              ! flvr1 is the flavour with which the neutrino is generated
    integer :: flvr2              ! flvr2 is the flavour that is transited 
    
    real(8) :: fState1(3)         ! is the initial flavour eigenstate 
    real(8) :: fState2(3)         ! ! is the final flavour eigenstate

    solarProbabilityAmplitude=0.0d0

    select case (flvr1)
        case(1)
            fState1=(/1.0d0,0.0d0,0.0d0/)
        case(2)
            fState1=(/0.0d0,1.0d0,0.0d0/)
        case(3)
            fState1=(/0.0d0,0.0d0,1.0d0/)
        case DEFAULT
            fState1=(/0.0d0,0.0d0,0.0d0/)
            print*, 'No seleccionaste un eigenestado de sabor inicila definido'
    end select

    select case (flvr2)
        case(1)
            fState2=(/1.0d0,0.0d0,0.0d0/)
        case(2)
            fState2=(/0.0d0,1.0d0,0.0d0/)
        case(3)
            fState2=(/0.0d0,0.0d0,1.0d0/)
        case DEFAULT
            
            print*, 'No seleccionaste un eigenestado de sabor final definido'
    end select
    
    solarProbabilityAmplitude = dot_product(fState1,matmul(iterUfL,fState2))

    return
end function solarProbabilityAmplitude