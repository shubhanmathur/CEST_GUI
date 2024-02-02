
function expt = Gen_expt(Experiment)


    for ke = 1:length(Experiment.Numbers) 
        expt(ke).folder         = Experiment.Folder;
        expt(ke).expt_number    = Experiment.Numbers{ke}; 
        
        
        ExptAt              = [Experiment.Folder '\' Experiment.Numbers{ke}];

        edata               = BrukerOpenW(ExptAt);  
% size(edata.data)
        expt(ke).B0_MHz     = edata.B0_MHz;
        zspect              = edata.data(1:48,:,:);%+edata.data(33:64,:,:);
        
        %% rotations 
        zspect              = permute(zspect,[2 1 3]); % 90 deg rotation
        zspect              =  zspect(end:-1:1,:,:);
%         zspect              =  zspect(:,end:-1:1,:);
        expt(ke).power_uT   = edata.power_uT;

%         expt(ke).zspect_norm                 = zspect(:,:,2:end)./ zspect(:,:,1);
        expt(ke).zspect_norm                 = zspect(:,:,2:end)./ max(max(zspect(:,:,1)));
        expt(ke).zspect_norm_4st                 = zspect(:,:,2:end)./((zspect(:,:,1)));
        
        expt(ke).zspect                 = zspect(:,:,2:end); 
        
        expt(ke).zspect_size            = size(expt(ke).zspect);
        [expt(ke).zspect_max, temp_l]   = max(abs(expt(ke).zspect(:)));
        [expt(ke).zspect_max_loc(1), expt(ke).zspect_max_loc(2), expt(ke).zspect_max_loc(3)]  = ind2sub(size(expt(ke).zspect), temp_l);

        expt(ke).offset_Hz              =  edata.offset_Hz(2:end); 
%         expt(ke).offset_ppm             = expt(ke).offset_Hz/edata.B0_MHz ; 
        expt(ke).image                  = squeeze(expt(ke).zspect(:,:,expt(ke).zspect_max_loc(3)));
        expt(ke).image_norm             = expt(ke).image/expt(ke).zspect_max;
    end


end



