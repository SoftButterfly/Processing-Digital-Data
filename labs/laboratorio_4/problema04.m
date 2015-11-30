%% Prepare plot ----------------------------------------------------------------
clear all
close all
clc

%% Settings --------------------------------------------------------------------
  alw    =  0.75;  % AxesLineWidth
  Tfsz   = 12.00;  % Title Fontsize
  lfsz   = 12.00;  % Label Fontsize
  tfsz   =  9.00;  % Ticks Fontsize
  lw     =  0.75;  % LineWidth
  msz    =  6.00;  % MarkerSize

%% Part A ----------------------------------------------------------------------
  % Plot of a) x ---------------------------------------------------------------
    figure(1)
    width  =  7.00*1.0;  % Width in inches
    height =  3.00*1.0;  % Height in inches
    pos = get(gcf, 'Position');
    set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

    Fs = 100;
    T  = 1/Fs;
    t = 0:T:8*pi;
    y = p4_y(t);
    plot(t, y, 'LineWidth', lw, 'MarkerSize', msz)
    xlabel('$$t$$', 'Interpreter', 'latex', 'FontSize', lfsz)
    ylabel('$$y$$', 'Interpreter', 'latex', 'FontSize', lfsz)

    set(gca, 'XLim', [0.0, 8.0*pi])
    set(gca, 'XTick', 0.0:pi:8.0*pi)
    set(gca, 'xTickLabel',{'$$0$$','$$\pi$$','$$2\pi$$','$$3\pi$$','$$4\pi$$','$$5\pi$$','$$6\pi$$','$$7\pi$$','$$8\pi$$'})
    set(gca, 'XGrid', 'on')

    set(gca, 'YLim', [-1.5, 1.5])
    set(gca, 'YTick', -1.5:0.5:1.5)
    set(gca, 'YGrid', 'on')

    set(gca, 'LineWidth', alw) %<- Set properties
    plotTickLatex2D('Axis', gca, 'FontSize', tfsz);

    papersize = get(gcf, 'PaperSize');
    left = (papersize(1)- width)/2;
    bottom = (papersize(2)- height)/2;
    FigureSize = [left, bottom, width, height];
    set(gcf,'InvertHardcopy','on')
    set(gcf,'PaperUnits', 'inches')
    set(gcf,'PaperPosition', FigureSize)

    print('problema04_a','-dpng','-r600')
