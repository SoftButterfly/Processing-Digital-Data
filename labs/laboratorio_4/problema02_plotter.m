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
  % Data -----------------------------------------------------------------------
    Fs = 1000;
    T  = 1/Fs;
    L  = 100000;

    t = (-L/2:L/2)*T;
    y = p2_x(t);

    Y = fft(y);

    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    P1 = P1/max(P1);

    f = Fs*(0:(L/2))/L;

  % Plotting -------------------------------------------------------------------
    % Plot of f ----------------------------------------------------------------
      figure(1)
      width  =  3.50*1.0;  % Width in inches
      height =  3.00*1.0;  % Height in inches
      pos = get(gcf, 'Position');
      set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

      plot(t, y, 'LineWidth', lw, 'MarkerSize', msz)
      xlabel('$$t$$', 'Interpreter', 'latex', 'FontSize', lfsz)
      ylabel('$$x$$', 'Interpreter', 'latex', 'FontSize', lfsz)

      set(gca, 'XLim', [-3, 4])
      set(gca, 'XTick', -3:1:4)
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

      print('problema02_x','-dpng','-r600')

    % Plot of F ----------------------------------------------------------------
      figure(1)
      width  =  3.50*1.0;  % Width in inches
      height =  3.00*1.0;  % Height in inches
      pos = get(gcf, 'Position');
      set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

      plot(f, P1, 'LineWidth', lw, 'MarkerSize', msz)
      xlabel('$$\omega/2\pi$$', 'Interpreter', 'latex', 'FontSize', lfsz)
      ylabel('$$\mathrm{.abs}(\hat{x})$$', 'Interpreter', 'latex', 'FontSize', lfsz)

      set(gca, 'XLim', [0, 2.5])
      set(gca, 'XTick', 0:0.5:2.5)
      set(gca, 'XGrid', 'on')

      set(gca, 'YLim', [-0.5, 1.5])
      set(gca, 'YTick', -0.5:0.5:1.5)
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

      print('problema02_X','-dpng','-r600')
