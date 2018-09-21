subroutine getDataFromModel()
    implicit none
    real(8) :: dataModel(1219,13)
    integer :: i,j

    open(34,file='solar_model/distribution_neutrino_fluxes_BS05_model.dat')
        read(34,*) ((dataModel(i,j),j=1,13),i=1,1219)
    close(34)

    open(35,file='solar_model/data_for_solar_neutrino_oscillations.dat')
    open(36,file='solar_model/data_for_solar_neutrino_oscillations.csv')

    write(36,*) 'Ratio',',','log(ro)[cm_3/N_A]',',','pp_nu',',','boro8_nu',',','nitrogen13_nu',','  &
               ,'oxygen15_nu',',','florine17_nu',',','beryllium7_nu',',','pep_nu',',','hep_nu'
    do i=1,1219
        write(35,*) dataModel(i,1), dataModel(i,3), dataModel(i,6:13)        
        write(36,*) dataModel(i,1),',',dataModel(i,3),',',dataModel(i,6),',',dataModel(i,7),',',dataModel(i,8),  &
                 ',',dataModel(i,9),',',dataModel(i,10),',',dataModel(i,11),',',dataModel(i,12),',',dataModel(i,13)
    enddo
    close(35)
    close(36)    
    return
end subroutine getDataFromModel