function createpHmaps(pH, CESTdata, min_lim, max_lim, clabel)

for i = 1:CESTdata(1).stack_dim(3)    
    sl = CESTdata(1).stack_dim(3);
    ax = subplot(1, CESTdata(1).stack_dim(3), i);
    if i < sl 
    title(sprintf('Slice %d', i));
    plot_framesoverlaid(pH(:, :, i), CESTdata(1).M0norm_pre(:, :, i), 0.5, 0, ax, [min_lim  max_lim], 0);
    set(ax,  'FontSize', 12, 'LineWidth', 2, 'DataAspectRatio', [1 1 1])
    ax.YAxis.Visible = 'off';
    ax.XAxis.Visible = 'off';
    elseif (i == sl)
    title(sprintf('Slice %d', sl));
    plot_framesoverlaid(pH(:, :, sl), CESTdata(1).M0norm_pre(:, :, i), 0.5, 0, ax, [min_lim  max_lim], 1);
    set(ax,  'FontSize', 12, 'LineWidth', 2, 'DataAspectRatio', [1 1 1])
    c = colorbar;
    set(gca,  'FontSize', 16, 'LineWidth', 2, 'DataAspectRatio', [1 1 1]);
    c.Label.String = clabel;
    ax.YAxis.Visible = 'off';
    ax.XAxis.Visible = 'off';
    end
end

end