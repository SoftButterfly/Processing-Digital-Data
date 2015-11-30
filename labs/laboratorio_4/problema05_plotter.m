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
    width  =  7.00;  % Width in inches
    height =  3.00;  % Height in inches
    pos = get(gcf, 'Position');
    set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

    Fs = 8000;
    T  = 1/Fs;
    y = load('datos.txt');
    L = length(y);
    t = (1:L)*T;

    plot(t, y, 'LineWidth', lw, 'MarkerSize', msz)
    xlabel('$$t$$', 'Interpreter', 'latex', 'FontSize', lfsz)
    ylabel('$$y$$', 'Interpreter', 'latex', 'FontSize', lfsz)

    set(gca, 'XLim', [0.0, 10.0])
    set(gca, 'XTick', 0.0:1.0:10.0)
    set(gca, 'XGrid', 'on')

    set(gca, 'YLim', [-2.0, 4.0]*10e-4)
    set(gca, 'YTick', (-2.0:1:4.0)*10e-4)
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

    print('problema05_a','-dpng','-r600')

  % Plot of a) x ---------------------------------------------------------------
    figure(1)
    width  =  7.00;  % Width in inches
    height =  3.00;  % Height in inches
    pos = get(gcf, 'Position');
    set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

    Y = fft(y);
    P = abs(Y/L);
    P = P(1:floor(L/2)+1);
    P(2:end-1) = 2*P(2:end-1);
    f = Fs*(0:floor(L/2))/L;

    plot(f, P, 'LineWidth', lw, 'MarkerSize', msz)
    xlabel('$$\omega/2\pi$$', 'Interpreter', 'latex', 'FontSize', lfsz)
    ylabel('$$\mathrm{.abs}\left(\hat y\right)$$', 'Interpreter', 'latex', 'FontSize', lfsz)

    % set(gca, 'XLim', [-2.0, 4.0]*10e-3)
    % set(gca, 'XTick', (-2.0:0.5:4.0)*10e-3)
    set(gca, 'XGrid', 'on')

    set(gca, 'YLim', [0.0, 1.5]*10e-5)
    set(gca, 'YTick', (0.0:0.25:1.5)*10e-5)
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

    print('problema05_b','-dpng','-r600')
