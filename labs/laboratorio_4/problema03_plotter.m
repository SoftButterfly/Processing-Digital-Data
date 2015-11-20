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
    width  =  3.50*1.0;  % Width in inches
    height =  3.00*1.0;  % Height in inches
    pos = get(gcf, 'Position');
    set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

    t = -1:0.0001:1;
    y = gate(t);
    plot(t, y, 'LineWidth', lw, 'MarkerSize', msz)
    xlabel('$$t$$', 'Interpreter', 'latex', 'FontSize', lfsz)
    ylabel('$$x$$', 'Interpreter', 'latex', 'FontSize', lfsz)

    set(gca, 'XLim', [-1.0, 1.0])
    set(gca, 'XTick', -1.0:0.5:1.0)
    set(gca, 'xTickLabel',{'','-a/2','0','a/2',''})
    set(gca, 'XGrid', 'on')

    set(gca, 'YLim', [-0.5, 1.5])
    set(gca, 'YTick', -0.5:0.5:1.5)
    set(gca, 'YTickLabel',{'','0','','1/a',''})
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

    print('problema03_a','-dpng','-r600')

  % Plot of b) x ---------------------------------------------------------------
    figure(1)
    width  =  3.50*1.0;  % Width in inches
    height =  3.00*1.0;  % Height in inches
    pos = get(gcf, 'Position');
    set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

    t = -4:1:4;
    y = 1+impulso(mod(t,2));
    stem(t, y, 'LineWidth', lw, 'MarkerSize', msz)
    xlabel('$$t$$', 'Interpreter', 'latex', 'FontSize', lfsz)
    ylabel('$$x$$', 'Interpreter', 'latex', 'FontSize', lfsz)

    set(gca, 'XLim', [-4.5, 4.5])
    set(gca, 'XTick', -4.0:1.0:4.0)
    set(gca, 'XGrid', 'on')

    set(gca, 'YLim', [-0.5, 2.5])
    set(gca, 'YTick', -0.5:0.5:2.5)
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

    print('problema03_b','-dpng','-r600')

close all
