function WASSRdata = loadWASSRdata(ExpNo, ExpPath, MedFilterYesNo)
        
        
        l1= ExpPath(length(ExpPath)-1:length(ExpPath));
        if strcmp(l1, '/1')
            ExpPath = ExpPath(1:length(ExpPath)-2);
        end
         ExptAt              = [ExpPath '/' num2str(ExpNo)];

        temp= ExptAt;


        edata               = BrukerOpenW_pv5(ExptAt);  

        WASSRdata.B0_MHz    = edata.B0_MHz;
        Mz_stack            = edata.data;
        
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
        
   
        
        WASSRdata.Mz_stack_full    = flipud(rot90(Mz_stack(:,:,:,:))); 
        WASSRdata.offset_Hz_full   = edata.offset_Hz; %         CESTData(ke).zspect_norm                 = zspect(:,:,zspec_id)./ zspect(:,:,M0_loc);
        WASSRdata.stack_dim = size(WASSRdata.Mz_stack_full);
       
        WASSRdata.offset_ppm_full  = WASSRdata.offset_Hz_full/edata.B0_MHz; 
        [~, c] = find(WASSRdata.offset_Hz_full >= 20000, 50);
        WASSRdata.offset_Hz =  WASSRdata.offset_Hz_full;
        WASSRdata.offset_Hz(c)=[];
        WASSRdata.offset_ppm = WASSRdata.offset_Hz/edata.B0_MHz; 
        WASSRdata.M0_ind = c;
        WASSRdata.M0_stack    = mean(WASSRdata.Mz_stack_full(:,:,:, c), 4);
        WASSRdata.Mz_stack = WASSRdata.Mz_stack_full;
        WASSRdata.Mz_stack(:, :, :, c) = [];

    for sl = 1:WASSRdata.stack_dim(3)
        WASSRdata.Mz_stack_norm(:, :, sl, :) = double(WASSRdata.Mz_stack(:, :, sl, :)./WASSRdata.M0_stack(:, :, sl));
    end

disp('WASSR Data loaded successfully')
end



