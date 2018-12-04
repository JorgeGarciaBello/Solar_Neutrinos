real(8) function solarProbabilityOfTransitionAB(iterUfL,flvr1,flvr2)
    implicit none
    double complex :: iterUfL(3,3)! iterUfL is the time evolution operator matrix in the flavour base iterative for diferents lengths and electron densities
    integer :: flvr1              ! flvr1 is the flavour with which the neutrino is generated
    integer :: flvr2              ! flvr2 is the flavour that is transited 
    
    double complex :: solarProbabilityAmplitude

    solarProbabilityOfTransitionAB = 0.0d0
    solarProbabilityOfTransitionAB = solarProbabilityAmplitude(iterUfL,flvr1,flvr2)*        &
                                CONJG(solarProbabilityAmplitude(iterUfL,flvr1,flvr2))
    return
end function solarProbabilityOfTransitionAB