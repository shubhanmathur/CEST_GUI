function CESTdata = loadCESTdata(ExpNo, ExpPath, MedFilterYesNo)

    for ke = 1:length(ExpNo) 
        %CESTdata(ke).folder         = Experiment.Folder;
        %CESTdata(ke).expt_number    = Experiment.Numbers{ke}; 
        l1= ExpPath(length(ExpPath)-1:length(ExpPath));
        if strcmp(l1, '/1')
            ExpPath = ExpPath(1:length(ExpPath)-2);
        end

        
        ExptAt              = [ExpPath '/' num2str(ExpNo{ke})];

        temp= ExptAt;

        

        edata               = BrukerOpenW_pv5(ExptAt);  

        CESTdata(ke).B0_MHz = edata.B0_MHz;
        CESTdata(ke).TR         = edata.TR;
        Mz_stack            = edata.data;
        Mz_stack            = Mz_stack;
        
        if ndims(Mz_stack) == 3
            Mz_stack = permute(Mz_stack, [1 2 4 3]);
        end
        % Rotations 
        %Mz_stack              = flipud(permute(Mz_stack,[2 1 3])); % 90 deg rotation
        %Mz_stack              = permute(Mz_stack,[2 1 3]); % 90 deg rotation
        %Mz_stack              = Mz_stack(:, end:-1:1, :, :);

        % Applying median filter 
        if MedFilterYesNo == 1
            for sl = 1:size(Mz_stack, 3)
                for k_off = 1:size(Mz_stack,4)
                    Mz_stack(:, :, sl, k_off)   =  medfilt2(Mz_stack(:, :, sl, k_off));
                end
            end
        end   
        
   
        
        CESTdata(ke).power_uT         = edata.power_uT;
        CESTdata(ke).Mz_stack_full    = flipud(rot90(Mz_stack(:,:,:,:))); 
        CESTdata(ke).offset_Hz_full   = edata.offset_Hz; %         CESTData(ke).zspect_norm                 = zspect(:,:,zspec_id)./ zspect(:,:,M0_loc);
        CESTdata(ke).stack_dim = size(CESTdata(ke).Mz_stack_full);
       
        CESTdata(ke).offset_ppm_full  = CESTdata(ke).offset_Hz_full/edata.B0_MHz ; 
        CESTdata(ke).diffoffsets = unique(CESTdata(ke).offset_Hz_full);
        [~, c] = find(CESTdata(ke).offset_Hz_full >= 20000, 50);
        %        [~, c] = find(CESTdata(ke).offset_Hz_full == 20000, 50);
        CESTdata(ke).M0_ind = c;
        [~, c_max]  = max(diff(c));
        CESTdata(ke).M0start_no = c_max;
        CESTdata(ke).M0end_no = numel(c) - c_max;
        CESTdata(ke).M0_stack_full    = CESTdata(ke).Mz_stack_full(:,:,:, c);
        

     for i = 1:numel(CESTdata(ke).diffoffsets) - 1
        [~, c_ind] = find(CESTdata(ke).offset_Hz_full == CESTdata(ke).diffoffsets(i), 10000);
        CESTdata(ke).Mz_stack(i).Mz_ind = c_ind; 
        CESTdata(ke).Mz_stack(i).OffsetStack = CESTdata(ke).Mz_stack_full(:, :, :, c_ind);  
     end
           
    end

disp('CEST Data loaded successfully')
end



