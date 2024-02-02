
function expt = Gen_expt_T2(Experiment) 
    for ke = 1:length(Experiment.Numbers_T2) 
        expt(ke).folder         = Experiment.Folder;
        expt(ke).expt_number    = Experiment.Numbers_T2{ke};  
        ExptAt              = [Experiment.Folder '/' Experiment.Numbers_T2{ke}]; 
        edata               = BrukerOpenW_T2(ExptAt);   
%         expt(ke).B0_MHz     = edata.B0_MHz;
        image              = edata ; 
        %% rotations 
        image              = permute(image,[2 1 3]);  
        image              =  image(:, end:-1:1, :);
        
        %       image              = flipud(permute(image,[2 1 3])); % 90 deg rotation
        %Mz_stack              = permute(Mz_stack,[2 1 3]); % 90 deg rotation
    %image              = image(end:-1:1,:,:);

%         expt(ke).power_uT   = edata.power_uT; 
        expt(ke).image                  = image; 
    end 
end



