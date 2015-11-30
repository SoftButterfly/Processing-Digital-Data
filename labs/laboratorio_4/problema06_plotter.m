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
    width  =  3.50;  % Width in inches
    height =  3.00;  % Height in inches
    pos = get(gcf, 'Position');
    set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

    T = 0.8;
    n = [-2:2];
    f = [0:0.125:2];
    X = zeros(size(f)) ;
    for i = 1: length(f)
        X(i) = sum(T*triangle(n*T/2).*exp(-j*2*pi*f(i)*n*T));
    end

    plot(f, abs(X), 'LineWidth', lw, 'MarkerSize', msz)
    xlabel('$$f$$', 'Interpreter', 'latex', 'FontSize', lfsz)
    ylabel('$$\mathrm{.abs}\left(\hat x\right)$$', 'Interpreter', 'latex', 'FontSize', lfsz)
    title('$$T=0.8$$', 'Interpreter', 'latex', 'FontSize', Tfsz)

    set(gca, 'XLim', [0.0, 2.0])
    set(gca, 'XTick', 0.0:0.5:2.0)
    set(gca, 'XGrid', 'on')

    set(gca, 'YLim', [0.0, 2])
    set(gca, 'YTick', 0.0:0.5:2)
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

    print('problema06_a','-dpng','-r600')

  % Plot of a) x ---------------------------------------------------------------
    figure(1)
    width  =  3.50;  % Width in inches
    height =  3.00;  % Height in inches
    pos = get(gcf, 'Position');
    set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

    T = 0.08;
    n = [-2:2];
    f = [0:0.125:2];
    X = zeros(size(f)) ;
    for i = 1: length(f)
        X(i) = sum(T*triangle(n*T/2).*exp(-j*2*pi*f(i)*n*T));
    end

    plot(f, abs(X), 'LineWidth', lw, 'MarkerSize', msz)
    xlabel('$$f$$', 'Interpreter', 'latex', 'FontSize', lfsz)
    ylabel('$$\mathrm{.abs}\left(\hat x\right)$$', 'Interpreter', 'latex', 'FontSize', lfsz)
    title('$$T=0.08$$', 'Interpreter', 'latex', 'FontSize', Tfsz)

    set(gca, 'XLim', [0.0, 2.0])
    set(gca, 'XTick', 0.0:0.5:2.0)
    set(gca, 'XGrid', 'on')

    set(gca, 'YLim', [0.0, 2])
    set(gca, 'YTick', 0.0:0.5:2)
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

    print('problema06_b','-dpng','-r600')
