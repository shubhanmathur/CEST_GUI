function createPlots(Disp_map_offset1, Disp_map_offset2, CESTdata, min_lim, max_lim, clabel)

for i = 1:2*CESTdata(1).stack_dim(3)
    sl = CESTdata(1).stack_dim(3);
    ax = subplot(2, CESTdata(1).stack_dim(3), i);
    if i < sl 
    title(sprintf('Offset 1, slice %d', i));
    plot_framesoverlaid(Disp_map_offset1(:, :, i), CESTdata(1).M0norm_pre(:, :, i), 0.5, 0, ax, [min_lim  max_lim], 0);
    set(ax,  'FontSize', 12, 'LineWidth', 2, 'DataAspectRatio', [1 1 1])
    ax.YAxis.Visible = 'off';
    ax.XAxis.Visible = 'off';
   
    elseif (i == sl)
    title(sprintf('Offset 1, slice %d', sl));
    plot_framesoverlaid(Disp_map_offset1(:, :, sl), CESTdata(1).M0norm_pre(:, :, i), 0.5, 0, ax, [min_lim  max_lim], 1);
    c = colorbar;
    set(ax,  'FontSize', 12, 'LineWidth', 2, 'DataAspectRatio', [1 1 1])
    c.Label.String = clabel;
    ax.YAxis.Visible = 'off';
    ax.XAxis.Visible = 'off';
    
    elseif (i == 2*sl)
    title(sprintf('Offset 2, slice %d', sl));
    plot_framesoverlaid(Disp_map_offset2(:, :, sl), CESTdata(1).M0norm_pre(:, :, sl), 0.5, 0, ax, [min_lim  max_lim], 1);
    c = colorbar;
    set(ax,  'FontSize', 12, 'LineWidth', 2, 'DataAspectRatio', [1 1 1])
    c.Label.String = clabel;
    ax.YAxis.Visible = 'off';
    ax.XAxis.Visible = 'off';   
    
    else
    title(sprintf('Offset 2, slice %d', i-sl));
    plot_framesoverlaid(Disp_map_offset2(:, :, i-sl), CESTdata(1).M0norm_pre(:, :, i-sl, 1), 0.5, 0, ax, [min_lim  max_lim], 0);
    set(ax,  'FontSize', 12, 'LineWidth', 2, 'DataAspectRatio', [1 1 1])
    ax.YAxis.Visible = 'off';
    ax.XAxis.Visible = 'off';
   
    end
end

end