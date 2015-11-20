clear all
close all
clc

%% Paper Sizes ---------------------------------------------------------------
    alw    =  0.75;  % AxesLineWidth
    Tfsz   = 12.00;  % Title Fontsize
    lfsz   = 12.00;  % Label Fontsize
    tfsz   =  9.00;  % Ticks Fontsize
    lw     =  0.75;  % LineWidth
    msz    =  6.00;  % MarkerSize

%% Article Sizes ---------------------------------------------------------------
%     width  =  7.00;  % Width in inches
%     height =  3.00;  % Height in inches
%     alw    =  0.75;  % AxesLineWidth
%     fsz    = 11.00;  % Fontsize
%     lw     =  1.50;  % LineWidth
%     msz    =  8.00;  % MarkerSize

%% Problema 01 -----------------------------------------------------------------
    % A: f3(t) -----------------------------------------------------------------
        figure(1)
        width  =  3.50;  % Width in inches
        height =  3.00;  % Height in inches
        pos = get(gcf, 'Position');
        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

        L = 1;

        X = -2:0.01:4;
        Y = p1_f3(X);

        plot(X, Y, 'LineWidth', lw, 'MarkerSize', msz)
        xlabel('$$t$$', 'Interpreter', 'latex', 'FontSize', lfsz)
        ylabel('$$f_3$$', 'Interpreter', 'latex', 'FontSize', lfsz)
        % title('$$\textrm{Funci\''on\ impulso\ unitario}\ \delta\left(n\right)$$', 'Interpreter', 'latex', 'FontSize', Tfsz)

        set(gca, 'XLim', [-2, 4])
        set(gca, 'XTick', -2:1:4)
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

        print('problema01_f3','-dpng','-r600')

    % B: f4(t) -----------------------------------------------------------------
        figure(1)
        width  =  3.50;  % Width in inches
        height =  3.00;  % Height in inches
        pos = get(gcf, 'Position');
        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

        L = 1;

        X = -2:0.01:4;
        Y = p1_f4(X);

        plot(X, Y, 'LineWidth', lw, 'MarkerSize', msz)
        xlabel('$$t$$', 'Interpreter', 'latex', 'FontSize', lfsz)
        ylabel('$$f_4$$', 'Interpreter', 'latex', 'FontSize', lfsz)
        % title('$$\textrm{Funci\''on\ impulso\ unitario}\ \delta\left(n\right)$$', 'Interpreter', 'latex', 'FontSize', Tfsz)

        set(gca, 'XLim', [-2, 4])
        set(gca, 'XTick', -2:1:4)
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

        print('problema01_f4','-dpng','-r600')

%% Problema 02 -----------------------------------------------------------------
    % A: f(t) -----------------------------------------------------------------
        figure(1)
        width  =  3.50;  % Width in inches
        height =  3.00;  % Height in inches
        pos = get(gcf, 'Position');
        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

        L = 1;

        X = -3:0.01:4;
        Y = p2_x(X);

        plot(X, Y, 'LineWidth', lw, 'MarkerSize', msz)
        xlabel('$$t$$', 'Interpreter', 'latex', 'FontSize', lfsz)
        ylabel('$$x$$', 'Interpreter', 'latex', 'FontSize', lfsz)
        % title('$$\textrm{Funci\''on\ impulso\ unitario}\ \delta\left(n\right)$$', 'Interpreter', 'latex', 'FontSize', Tfsz)

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

close all
