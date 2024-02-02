function  plot_framesoverlaid(imAct, imBack, logicalpha, plotnow, axH, act_clim, plot_cbar)
% Overlay an color image over a  background
% INPUT 
% 'imAct' - image to display in colors
% 'imBack' - background image
% 'logicalpha': logic matrix with transparency information (1 = shown pixel)
% 'plotnow': whether we want to plot the figure (set to 0 if we are providing a axisHandle)
% 'axH': axes handle in which to plot it, when it's going to be included into a subplot
% 'act_clim': color limits for 'imAct'. If no color limits is provided for the activity (color) map, use the max
% and min from the input movie
% 'plot_cbar' : whether we want to plot the colorbar (useful in subplots)
if ~exist('act_clim')
    act_clim = [min(nonzeros(imAct(:))) max(nonzeros(imAct(:)))];
elseif isempty(act_clim)
    act_clim = [min(nonzeros(imAct(:))) max(nonzeros(imAct(:)))];
end

if ~exist('thresh')
    thresh = 0;
elseif isempty(thresh)
        thresh = 0;
end
if ~exist('plotnow')
        plotnow= 1;
elseif isempty(plotnow)
        plotnow= 1;
end 
if ~exist('plot_cbar')
        plot_cbar= 1;
elseif isempty(plot_cbar)
        plot_cbar= 1;
end 
% end of input control ------------------------
if plotnow
    fig1 = figure; 
end


ax1 = axes;
imagesc(imBack);
colormap(ax1,'gray');
%c1 = colorbar; 
ax1.Visible = 'off';
set(ax1, 'DataAspectRatio', [1 1 1]);

ax2 = axes;
%imagesc(ax2, imAct, 'alphadata', logicalpha);
h2 = imagesc(ax2, imAct);
alpha(h2, isfinite(imAct)*logicalpha);
 %CT = cbrewer('seq', 'YlGnBu', 9);
 CT = cbrewer('seq', 'YlOrRd', 9);
%CT = cbrewer('div', 'RdYlBu', 9);
colormap(ax2, flipud(CT));

caxis(ax2, act_clim);
ax2.Visible = 'off';
ax1.Visible = 'off';

set(ax2, 'DataAspectRatio', [1 1 1]);


if plot_cbar 
c = colorbar;
set(gca,  'FontSize', 16, 'LineWidth', 2);
%c.Label.String = 'Contrast';
end

linkprop([axH ax1 ax2],'Position');
end