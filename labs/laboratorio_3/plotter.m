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
    % A: Funcion impulso -------------------------------------------------------
        figure(1)
        width  =  7.00;  % Width in inches
        height =  3.00;  % Height in inches
        pos = get(gcf, 'Position');
        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

        L = 1;

        X = -5:1:5;
        Y = impulso(X);

        stem(X, Y, 'LineWidth', lw, 'MarkerSize', msz)
        xlabel('$$n$$', 'Interpreter', 'latex', 'FontSize', lfsz)
        ylabel('$$\delta$$', 'Interpreter', 'latex', 'FontSize', lfsz)
        % title('$$\textrm{Funci\''on\ impulso\ unitario}\ \delta\left(n\right)$$', 'Interpreter', 'latex', 'FontSize', Tfsz)

        set(gca, 'XLim', [-5, 5])
        set(gca, 'XTick', -5:1:5)
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

        print('problema01_impulso','-dpng','-r600')

    % B: Funcion X -------------------------------------------------------------
        figure(1)
        width  =  7.00;  % Width in inches
        height =  3.00;  % Height in inches
        pos = get(gcf, 'Position');
        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

        L = 1;

        X = -5:1:5;
        Y = p1_X(X);

        stem(X, Y, 'LineWidth', lw, 'MarkerSize', msz)
        xlabel('$$n$$', 'Interpreter', 'latex', 'FontSize', lfsz)
        ylabel('$$x$$', 'Interpreter', 'latex', 'FontSize', lfsz)
        % title('$$\textrm{Funci\''on}\ x\left(n\right)$$', 'Interpreter', 'latex', 'FontSize', Tfsz)

        set(gca, 'XLim', [-5, 5])
        set(gca, 'XTick', -5:1:5)
        set(gca, 'XGrid', 'on')

        set(gca, 'YLim', [-1.5, 2.5])
        set(gca, 'YTick', -1.5:1:2.5)
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

        print('problema01_x','-dpng','-r600')

    % C: Funcion H -------------------------------------------------------------
        figure(1)
        width  =  7.00;  % Width in inches
        height =  3.00;  % Height in inches
        pos = get(gcf, 'Position');
        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

        L = 1;

        X = -5:1:5;
        Y = p1_H(X);

        stem(X, Y, 'LineWidth', lw, 'MarkerSize', msz)
        xlabel('$$n$$', 'Interpreter', 'latex', 'FontSize', lfsz)
        ylabel('$$h$$', 'Interpreter', 'latex', 'FontSize', lfsz)
        % title('$$\textrm{Funci\''on}\ h\left(n\right)$$', 'Interpreter', 'latex', 'FontSize', Tfsz)

        set(gca, 'XLim', [-5, 5])
        set(gca, 'XTick', -5:1:5)
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

        print('problema01_h','-dpng','-r600')

    % D: Funcion Y1 = X(n)*H(n) ------------------------------------------------
        figure(1)
        width  =  7.00;  % Width in inches
        height =  3.00;  % Height in inches
        pos = get(gcf, 'Position');
        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

        L = 1;
        X = -5:1:5;

        Y = conv(p1_X(X), p1_H(X));
        X = -10:1:10;

        stem(X, Y, 'LineWidth', lw, 'MarkerSize', msz)
        xlabel('$$n$$', 'Interpreter', 'latex', 'FontSize', lfsz)
        ylabel('$$y_1$$', 'Interpreter', 'latex', 'FontSize', lfsz)
        % title('$$\textrm{Funci\''on}\ h\left(n\right)$$', 'Interpreter', 'latex', 'FontSize', Tfsz)

        set(gca, 'XLim', [-10, 10])
        set(gca, 'XTick', -10:2:10)
        set(gca, 'XGrid', 'on')

        set(gca, 'YLim', [-2.5, 4.5])
        set(gca, 'YTick', -2.5:1:4.5)
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

        print('problema01_y1','-dpng','-r600')

    % E: Funcion Y2 = X(n+2)*H(n) ----------------------------------------------
        figure(1)
        width  =  7.00;  % Width in inches
        height =  3.00;  % Height in inches
        pos = get(gcf, 'Position');
        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

        L = 1;
        X = -5:1:5;

        Y = conv(p1_X(X+2), p1_H(X));
        X = -10:1:10;

        stem(X, Y, 'LineWidth', lw, 'MarkerSize', msz)
        xlabel('$$n$$', 'Interpreter', 'latex', 'FontSize', lfsz)
        ylabel('$$y_2$$', 'Interpreter', 'latex', 'FontSize', lfsz)
        % title('$$\textrm{Funci\''on}\ h\left(n\right)$$', 'Interpreter', 'latex', 'FontSize', Tfsz)

        set(gca, 'XLim', [-10, 10])
        set(gca, 'XTick', -10:2:10)
        set(gca, 'XGrid', 'on')

        set(gca, 'YLim', [-2.5, 4.5])
        set(gca, 'YTick', -2.5:1:4.5)
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

        print('problema01_y2','-dpng','-r600')

    % F: Funcion Y3 = X(n)*H(n+2) ----------------------------------------------
        figure(1)
        width  =  7.00;  % Width in inches
        height =  3.00;  % Height in inches
        pos = get(gcf, 'Position');
        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

        L = 1;
        X = -5:1:5;

        Y = conv(p1_X(X), p1_H(X+2));
        X = -10:1:10;

        stem(X, Y, 'LineWidth', lw, 'MarkerSize', msz)
        xlabel('$$n$$', 'Interpreter', 'latex', 'FontSize', lfsz)
        ylabel('$$y_3$$', 'Interpreter', 'latex', 'FontSize', lfsz)
        % title('$$\textrm{Funci\''on}\ h\left(n\right)$$', 'Interpreter', 'latex', 'FontSize', Tfsz)

        set(gca, 'XLim', [-10, 10])
        set(gca, 'XTick', -10:2:10)
        set(gca, 'XGrid', 'on')

        set(gca, 'YLim', [-2.5, 4.5])
        set(gca, 'YTick', -2.5:1:4.5)
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

        print('problema01_y3','-dpng','-r600')

%% Problema 02 -----------------------------------------------------------------
    % A: Funcion X1 ------------------------------------------------------------
        figure(1)
        width  =  3.50;  % Width in inches
        height =  3.00;  % Height in inches
        pos = get(gcf, 'Position');
        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

        L = 1;

        X = -0.5:0.01:2.5;
        Y = p2_X1(X);

        plot(X, Y, 'LineWidth', lw, 'MarkerSize', msz)
        xlabel('$$t$$', 'Interpreter', 'latex', 'FontSize', lfsz)
        ylabel('$$x_1$$', 'Interpreter', 'latex', 'FontSize', lfsz)
        title('$$x_1\left(t\right)$$', 'Interpreter', 'latex', 'FontSize', Tfsz)

        set(gca, 'XLim', [-0.5, 2.5])
        set(gca, 'XTick', -0.5:0.5:2.5)
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

        print('problema02_X1','-dpng','-r600')

    % B: Funcion Y1 ------------------------------------------------------------
        figure(1)
        width  =  3.50;  % Width in inches
        height =  3.00;  % Height in inches
        pos = get(gcf, 'Position');
        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

        L = 1;

        X = -0.5:0.01:2.5;
        Y = p2_Y1(X);

        plot(X, Y, 'LineWidth', lw, 'MarkerSize', msz)
        xlabel('$$t$$', 'Interpreter', 'latex', 'FontSize', lfsz)
        ylabel('$$y_1$$', 'Interpreter', 'latex', 'FontSize', lfsz)
        title('$$y_1\left(t\right)$$', 'Interpreter', 'latex', 'FontSize', Tfsz)

        set(gca, 'XLim', [-0.5, 2.5])
        set(gca, 'XTick', -0.5:0.5:2.5)
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

        print('problema02_Y1','-dpng','-r600')

    % C: Funcion X2 ------------------------------------------------------------
        figure(1)
        width  =  3.50;  % Width in inches
        height =  3.00;  % Height in inches
        pos = get(gcf, 'Position');
        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

        L = 1;

        X = -0.5:0.01:3.5;
        Y = p2_X2(X);

        plot(X, Y, 'LineWidth', lw, 'MarkerSize', msz)
        xlabel('$$t$$', 'Interpreter', 'latex', 'FontSize', lfsz)
        ylabel('$$x_2$$', 'Interpreter', 'latex', 'FontSize', lfsz)
        title('$$x_2\left(t\right)$$', 'Interpreter', 'latex', 'FontSize', Tfsz)

        set(gca, 'XLim', [-0.5, 3.5])
        set(gca, 'XTick', -0.5:0.5:3.5)
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

        print('problema02_X2','-dpng','-r600')

    % D: Funcion Y2 ------------------------------------------------------------
        figure(1)
        width  =  3.50;  % Width in inches
        height =  3.00;  % Height in inches
        pos = get(gcf, 'Position');
        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

        L = 1;

        X = -0.5:0.01:3.5;
        Y = p2_Y2(X);

        plot(X, Y, 'LineWidth', lw, 'MarkerSize', msz)
        xlabel('$$t$$', 'Interpreter', 'latex', 'FontSize', lfsz)
        ylabel('$$y_2$$', 'Interpreter', 'latex', 'FontSize', lfsz)
        title('$$y_2\left(t\right)$$', 'Interpreter', 'latex', 'FontSize', Tfsz)

        set(gca, 'XLim', [-0.5, 3.5])
        set(gca, 'XTick', -0.5:0.5:3.5)
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

        print('problema02_Y2','-dpng','-r600')

    % E: Funcion X3 ------------------------------------------------------------
        figure(1)
        width  =  3.50;  % Width in inches
        height =  3.00;  % Height in inches
        pos = get(gcf, 'Position');
        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

        L = 1;

        X = -0.5:0.01:4.5;
        Y = p2_X3(X);

        plot(X, Y, 'LineWidth', lw, 'MarkerSize', msz)
        xlabel('$$t$$', 'Interpreter', 'latex', 'FontSize', lfsz)
        ylabel('$$x_3$$', 'Interpreter', 'latex', 'FontSize', lfsz)
        title('$$x_3\left(t\right)$$', 'Interpreter', 'latex', 'FontSize', Tfsz)

        set(gca, 'XLim', [-0.5, 4.5])
        set(gca, 'XTick', -0.5:0.5:4.5)
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

        print('problema02_X3','-dpng','-r600')

    % F: Funcion Y3 ------------------------------------------------------------
        figure(1)
        width  =  3.50;  % Width in inches
        height =  3.00;  % Height in inches
        pos = get(gcf, 'Position');
        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

        L = 1;

        X = -0.5:0.01:4.5;
        Y = p2_Y3(X);

        plot(X, Y, 'LineWidth', lw, 'MarkerSize', msz)
        xlabel('$$t$$', 'Interpreter', 'latex', 'FontSize', lfsz)
        ylabel('$$y_3$$', 'Interpreter', 'latex', 'FontSize', lfsz)
        title('$$y_3\left(t\right)$$', 'Interpreter', 'latex', 'FontSize', Tfsz)

        set(gca, 'XLim', [-0.5, 4.5])
        set(gca, 'XTick', -0.5:0.5:4.5)
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

        print('problema02_Y3','-dpng','-r600')

close all
