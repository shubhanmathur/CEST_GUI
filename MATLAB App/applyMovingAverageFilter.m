function CESTdata = applyMovingAverageFilter(CESTdata, span)

 for ke = 1:2
      for i = 1:numel(CESTdata(1).diffoffsets) - 1
         [~, c_ind] = find(CESTdata(ke).offset_Hz_full == CESTdata(ke).diffoffsets(i), 10000);
     %   temp = CESTdata(ke).Mz_stack_full(:, :, :, c_ind);  
       temp = CESTdata(ke).Mz_stack(i).OffsetStack;
    
        for sl = 1:CESTdata(1).stack_dim(3)
            for kx = 1:CESTdata(1).stack_dim(1)
                for ky = 1:CESTdata(1).stack_dim(2) 
                    Mz_offsetstack(kx, ky, sl, :) = smooth(temp(kx, ky, sl, :), span(ke));
                end
            end
        end 
        
    % CESTdata(ke).Mz_stack(i).OffsetStack = temp;
     CESTdata(ke).Mz_stack_mocorr(i).OffsetStack = Mz_offsetstack;
     clear Mz_offsetstack temp
     end
     
        for sl = 1:CESTdata(1).stack_dim(3)
            for kx = 1:CESTdata(1).stack_dim(1)
                for ky = 1:CESTdata(1).stack_dim(2) 
                     M0start_mocorr(kx, ky, sl, :) = smooth(CESTdata(ke).Mz_stack_full(kx, ky, sl, 1:CESTdata(ke).M0start_no), CESTdata(ke).M0start_no);
                     M0end_mocorr(kx, ky, sl, :) = smooth(CESTdata(ke).Mz_stack_full(kx, ky, sl, CESTdata(ke).stack_dim(4) - CESTdata(ke).M0end_no + 1:CESTdata(ke).stack_dim(4)), CESTdata(ke).M0end_no);
                end
            end
        end
     
     CESTdata(ke).M0start_mocorr = M0start_mocorr;
     CESTdata(ke).M0end_mocorr = M0end_mocorr; 
     
     CESTdata(ke).Mz_stack_mocorr_sort_full = zeros(size(CESTdata(ke).Mz_stack_full));
     CESTdata(ke).Mz_stack_mocorr_sort_full(:, :, :, 1:CESTdata(ke).M0start_no) = M0start_mocorr;
     CESTdata(ke).Mz_stack_mocorr_sort_full(:, :, :, CESTdata(ke).stack_dim(4) - CESTdata(ke).M0end_no + 1:CESTdata(ke).stack_dim(4)) = M0end_mocorr;
     
     for i = 1:numel(CESTdata(1).diffoffsets) - 1
         CESTdata(ke).Mz_stack_mocorr_full(i).OffsetStack = cat(4, M0start_mocorr, CESTdata(ke).Mz_stack_mocorr(i).OffsetStack, M0end_mocorr);
         CESTdata(ke).Mz_stack_mocorr_sort_full(:, :, :, CESTdata(ke).Mz_stack(i).Mz_ind) = CESTdata(ke).Mz_stack_mocorr(i).OffsetStack;
     end
     
     
    clear  M0start_mocorr M0end_mocorr
 end

end