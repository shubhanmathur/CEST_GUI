function CESTdata = averageMOffsets(CESTdata, Mz_stack_full, kex)

for ke = kex
     offsets_halfno(ke) = round((numel(CESTdata(ke).diffoffsets) - 1)/2);
     offsets_no(ke) = numel(CESTdata(ke).diffoffsets) - 1;
     
     Mz_stack = Mz_stack_full(:, :, :, CESTdata(ke).M0start_no + 1:CESTdata(ke).stack_dim(4) - CESTdata(ke).M0end_no);
    % Mz_stack = CESTdata(ke).Mz_stack_mocorr_sort_full(:, :, :, CESTdata(ke).M0start_no + 1:CESTdata(ke).stack_dim(4) - CESTdata(ke).M0end_no);     
     CESTdata(ke).Mz_offset1 = zeros(CESTdata(ke).stack_dim(1), CESTdata(ke).stack_dim(2), CESTdata(ke).stack_dim(3), floor(size(Mz_stack, 4)/(numel(CESTdata(ke).diffoffsets) - 1)));
     CESTdata(ke).Mz_offset2 = zeros(CESTdata(ke).stack_dim(1), CESTdata(ke).stack_dim(2), CESTdata(ke).stack_dim(3), floor(size(Mz_stack, 4)/(numel(CESTdata(ke).diffoffsets) - 1)));

        for ko1 = 1:offsets_no(ke):(size(Mz_stack, 4) - offsets_no(ke) + 1)

            for j = 0:offsets_halfno(ke) - 1 
                temp1 = mean(Mz_stack(:, :, :, ko1 + j), 4) ;
            end
            
            CESTdata(ke).Mz_offset1(:, :, :, round(ko1/offsets_no(ke)) + 1) = temp1;
        end
     
        for ko2 = 1 + offsets_halfno(ke):offsets_no(ke):(size(Mz_stack, 4) - offsets_halfno(ke) + 1)

            for j =  0:offsets_halfno(ke) - 1 
                temp2 = mean(Mz_stack(:, :, :, ko2 + j), 4) ;
            end
             
            CESTdata(ke).Mz_offset2(:, :, :, round(ko2/offsets_no(ke)) + 1) = temp2;
        end  
end

end