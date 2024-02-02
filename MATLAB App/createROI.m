function [Mask, ROI_def] = createROI(T2image, SegmentationMethod, slice_no, noofROIs, shape)

M0_stack = T2image;

% Define the way of creating mask
if nargin < 1   % load the existed mask into workspace
     [Mask] = uigetdir('C:');
     ROI_def = Mask;
else
   if strcmp(SegmentationMethod, 'manual')    % create mask manually
       figure(201)
       imagesc(M0_stack); 
       colormap(gray); axis off; axis equal;
       title(['Define ' int2str(noofROIs) ' ROI(s) in slice ' int2str(slice_no)]);
       for i = 1:noofROIs
            if strcmp(shape,'free') 
                e(i) = drawfreehand(gca); %imfreehand(gca);
            elseif strcmp(shape,'rect') 
                e(i) = drawrectangle(gca); %imrect(gca);
            elseif strcmp(shape,'ellipse')
                e(i) = drawellipse(gca); %imellipse(gca);
            elseif strcmp(shape,'poly')
                e(i) = drawpolygon(gca); %impoly(gca);
            end
       end
       h = uicontrol('Position',[450 10 100 20],'String','Continue',...
             'Callback','uiresume(gcbf)');
       uiwait(gcf)

      for i = 1:noofROIs   
           ROI_def(:, :, i) = createMask(e(i));
      end
      Mask = sum(ROI_def, 3); 
      temp = double(Mask);
      Mask(:, :) = temp;

   elseif strcmp (SegmentationMethod, 'automatic') % region growing
       [rows, columns] = size(M0_stack);
       fig = figure();
       imagesc(M0_stack); 
       title('Select initial points and press ENTER')
       colormap(gray); axis off; axis equal;
       [rgx, rgy] = getpts(fig);
       rgx = round(rgx);
       rgy = round(rgy);
       maxentry = length(rgx);
       
       J = NaN(rows, columns);    % allocation
       Mask = NaN(rows, columns);
       ROI_def = NaN(rows, columns, maxentry);
       
       prompt = {'Enter maximum intensity distance:'};
       dlg_title = 'Maximum intensity distance';
       num_lines = 1;
       defaultans = {'18000'};
       answer = inputdlg(prompt, dlg_title, num_lines, defaultans);
       close(gcf);
       
       for n = 1:maxentry
            J = regiongrowing(double(M0_stack(:, :)), rgy(n, 1), rgx(n, 1), str2double(answer{1}));
            ROI_def(:, :, n) = J;
            Mask = Mask + J;
       end
        temp = double(Mask);
        Mask(:, :) = temp;
   end
   disp('ROI(s) created succesfully');
end
close(gcf);


end