function CESTdata = normalizeCESTdata(CESTdata, M0normSel)


M0start_ind =  nan(2, max(CESTdata(1).M0start_no, CESTdata(2).M0start_no));
M0end_ind =  nan(2, max(CESTdata(1).M0end_no, CESTdata(2).M0end_no));

for ke = 1:2
    M0start_ind(ke, 1:CESTdata(ke).M0start_no) = CESTdata(ke).M0_ind(1:CESTdata(ke).M0start_no);
    M0end_ind(ke, 1:CESTdata(ke).M0end_no) = CESTdata(ke).M0_ind(~ismember(CESTdata(ke).M0_ind, M0start_ind));
end

% % Define denominator for normalization 
% if strcmp(M0normSel, 'M0pre_start')
     M0norm_pre = mean(CESTdata(1).Mz_stack_full(:, :, :,  ~isnan(M0start_ind(1, :))), 4, 'omitnan');
% elseif strcmp(M0normSel, 'M0pre_end')
%     M0norm = mean(CESTdata(1).Mz_stack_full(:, :, :,  ~isnan(M0end_ind(1, :))), 4, 'omitnan');
% elseif strcmp(M0normSel, 'M0post_start')
%     M0norm = mean(CESTdata(2).Mz_stack_full(:, :, :,  ~isnan(M0start_ind(2, :))), 4, 'omitnan');
% elseif strcmp(M0normSel, 'M0post_end')
     M0norm_post = mean(CESTdata(2).Mz_stack_full(:, :, :,  ~isnan(M0end_ind(2, :))), 4, 'omitnan');
% end


%for ke = 1:2
    for sl = 1:CESTdata(ke).stack_dim(3)
       % CESTdata(ke).Mz_stack_norm(:, :, sl, :) = double(CESTdata(ke).Mz_stack_full(:, :, sl, :)./M0norm(:, :, sl));
        CESTdata(1).Mz_stack_norm(:, :, sl, :) = double(CESTdata(1).Mz_stack_full(:, :, sl, :)./M0norm_pre(:, :, sl));
        CESTdata(2).Mz_stack_norm(:, :, sl, :) = double(CESTdata(2).Mz_stack_full(:, :, sl, :)./M0norm_post(:, :, sl)); 

    end
%     CESTdata(ke).M0norm = M0norm;
%     CESTdata(ke).M0normSel = M0normSel;

     CESTdata(1).M0norm_pre = M0norm_pre;
     CESTdata(2).M0norm_post = M0norm_post;
%     CESTdata(ke).M0normSel = M0normSel;
%end


end