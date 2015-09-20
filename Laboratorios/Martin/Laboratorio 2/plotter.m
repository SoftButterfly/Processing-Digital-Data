clear all
close all
clc

%% Paper Sizes ---------------------------------------------------------------
    alw    =  0.50;  % AxesLineWidth
    fsz    = 10.00;  % Fontsize
    lw     =  0.50;  % LineWidth
    msz    =  6.00;  % MarkerSize

%% Article Sizes ---------------------------------------------------------------
%     width  =  7.00;  % Width in inches
%     height =  3.00;  % Height in inches
%     alw    =  0.75;  % AxesLineWidth
%     fsz    = 11.00;  % Fontsize
%     lw     =  1.50;  % LineWidth
%     msz    =  8.00;  % MarkerSize

%%% Problema 01 -----------------------------------------------------------------
%    % Parte A ------------------------------------------------------------------
%        figure(1)
%        width  =  7.00;  % Width in inches
%        height =  3.00;  % Height in inches
%        pos = get(gcf, 'Position');
%        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
%
%        L = 1;
%
%        X = -5:0.01:5;
%        Y = impulso(X);
%
%        plot(X, Y, 'LineWidth', lw, 'MarkerSize', msz)
%        ylim([-0.5, 1.5])
%        xlabel('X');
%        ylabel('Y');
%        title(sprintf('Funcion impulso unitario'), 'FontSize', fsz);
%
%        set(gca, 'XLim', [-5, 5]);
%        set(gca, 'XTick', -5:1:5);
%        set(gca, 'XGrid', 'on');
%
%        set(gca, 'YLim', [-0.5, 1.5]);
%        set(gca, 'YTick', -0.5:0.5:1.5);
%        set(gca, 'YGrid', 'on');
%
%        set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
%
%        papersize = get(gcf, 'PaperSize');
%        left = (papersize(1)- width)/2;
%        bottom = (papersize(2)- height)/2;
%        myfiguresize = [left, bottom, width, height];
%
%        set(gcf,'InvertHardcopy','on');
%        set(gcf,'PaperUnits', 'inches');
%        set(gcf,'PaperPosition', myfiguresize);
%
%        print('problema01_a','-dpng','-r600');
%
%    % Parte B ------------------------------------------------------------------
%        figure(1)
%        width  =  7.00;  % Width in inches
%        height =  3.00;  % Height in inches
%        pos = get(gcf, 'Position');
%        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
%
%        L = 1;
%
%        X = -5:0.01:5;
%        Y = escalon(X);
%
%        plot(X, Y, 'LineWidth', lw, 'MarkerSize', msz)
%        ylim([-0.5, 1.5])
%        xlabel('X');
%        ylabel('Y');
%        title(sprintf('Funcion escalon unitario'), 'FontSize', fsz);
%
%        set(gca, 'XLim', [-5, 5]);
%        set(gca, 'XTick', -5:1:5);
%        set(gca, 'XGrid', 'on');
%
%        set(gca, 'YLim', [-0.5, 1.5]);
%        set(gca, 'YTick', -0.5:0.5:1.5);
%        set(gca, 'YGrid', 'on');
%
%        set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
%
%        papersize = get(gcf, 'PaperSize');
%        left = (papersize(1)- width)/2;
%        bottom = (papersize(2)- height)/2;
%        myfiguresize = [left, bottom, width, height];
%
%        set(gcf,'InvertHardcopy','on');
%        set(gcf,'PaperUnits', 'inches');
%        set(gcf,'PaperPosition', myfiguresize);
%
%        print('problema01_b','-dpng','-r600');
%
%    % Parte C ------------------------------------------------------------------
%        figure(1)
%        width  =  7.00;  % Width in inches
%        height =  3.00;  % Height in inches
%        pos = get(gcf, 'Position');
%        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
%
%        L = 1;
%
%        X = -5:0.01:5;
%        Y = rampa(X);
%
%        plot(X, Y, 'LineWidth', lw, 'MarkerSize', msz)
%        ylim([-0.5, 1.5])
%        xlabel('X');
%        ylabel('Y');
%        title(sprintf('Funcion rampa'), 'FontSize', fsz);
%
%        set(gca, 'XLim', [-5, 5]);
%        set(gca, 'XTick', -5:1:5);
%        set(gca, 'XGrid', 'on');
%
%        set(gca, 'YLim', [-0.5, 1.5]);
%        set(gca, 'YTick', -0.5:0.5:1.5);
%        set(gca, 'YGrid', 'on');
%
%        set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
%
%        papersize = get(gcf, 'PaperSize');
%        left = (papersize(1)- width)/2;
%        bottom = (papersize(2)- height)/2;
%        myfiguresize = [left, bottom, width, height];
%
%        set(gcf,'InvertHardcopy','on');
%        set(gcf,'PaperUnits', 'inches');
%        set(gcf,'PaperPosition', myfiguresize);
%
%        print('problema01_c','-dpng','-r600');
%
%%% Problema 02 -----------------------------------------------------------------
%    % Parte A ------------------------------------------------------------------
%        figure(1)
%        width  =  7.00;  % Width in inches
%        height =  3.00;  % Height in inches
%        pos = get(gcf, 'Position');
%        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
%
%        L = 1;
%
%        X = -5:0.01:5;
%        Y = ones(size(X)).*(-0.5*L*ones(size(X)) <= X & X <= 0.5*L*ones(size(X)));
%
%        plot(X, Y, 'LineWidth', lw, 'MarkerSize', msz)
%        ylim([-0.5, 1.5])
%        xlabel('X');
%        ylabel('Y');
%        title(sprintf('Funcion compuerta unitaria\n(Usando comandos "zeros" y "ones")'), 'FontSize', fsz);
%
%        set(gca, 'XLim', [-5, 5]);
%        set(gca, 'XTick', -5:1:5);
%        set(gca, 'XGrid', 'on');
%
%        set(gca, 'YLim', [-0.5, 1.5]);
%        set(gca, 'YTick', -0.5:0.5:1.5);
%        set(gca, 'YGrid', 'on');
%
%        set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
%
%        papersize = get(gcf, 'PaperSize');
%        left = (papersize(1)- width)/2;
%        bottom = (papersize(2)- height)/2;
%        myfiguresize = [left, bottom, width, height];
%
%        set(gcf,'InvertHardcopy','on');
%        set(gcf,'PaperUnits', 'inches');
%        set(gcf,'PaperPosition', myfiguresize);
%
%        print('problema02_a','-dpng','-r600');
%
%    % Parte B ------------------------------------------------------------------
%        figure(1)
%        width  =  7.00;  % Width in inches
%        height =  3.00;  % Height in inches
%        pos = get(gcf, 'Position');
%        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
%
%        figure(1)
%        pos = get(gcf, 'Position');
%        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
%
%        L = 1;
%
%        X = -5:0.01:5;
%        Y = escalon(X,-0.5*L).*escalon(-X,-0.5*L);
%
%        plot(X, Y, 'LineWidth', lw, 'MarkerSize', msz)
%        ylim([-0.5, 1.5])
%        xlabel('X');
%        ylabel('Y');
%        title(sprintf('Funcion compuerta unitaria\n(Usando la funcion "escalon" del problema 1)'), 'FontSize', fsz);
%
%        set(gca, 'XLim', [-5, 5]);
%        set(gca, 'XTick', -5:1:5);
%        set(gca, 'XGrid', 'on');
%
%        set(gca, 'YLim', [-0.5, 1.5]);
%        set(gca, 'YTick', -0.5:0.5:1.5);
%        set(gca, 'YGrid', 'on');
%
%        set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
%
%        papersize = get(gcf, 'PaperSize');
%        left = (papersize(1)- width)/2;
%        bottom = (papersize(2)- height)/2;
%        myfiguresize = [left, bottom, width, height];
%
%        set(gcf,'InvertHardcopy','on');
%        set(gcf,'PaperUnits', 'inches');
%        set(gcf,'PaperPosition', myfiguresize);
%
%        print('problema02_b','-dpng','-r600');
%
%%% Problema 03 -----------------------------------------------------------------
%    % Parte A ------------------------------------------------------------------
%        figure(1)
%        width  =  4.00;  % Width in inches
%        height =  5.00;  % Height in inches
%        pos = get(gcf, 'Position');
%        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
%
%        A = 5;
%        f = 20;
%
%        t = 0:0.0001:1;
%        y = squarew(t,f,A);
%
%        plot(t, y, 'LineWidth', lw, 'MarkerSize', msz)
%        ylim([-0.5, 5.5])
%        xlabel('Tiempo (s)');
%        ylabel('Amplitud (V)');
%        title(sprintf('Onda cuadrada\n(Frecuencia: 20 Hz; Amplitud:  5 V)'), 'FontSize', fsz);
%
%        set(gca, 'XLim', [0, 0.25]);
%        set(gca, 'XTick', 0:0.05:0.25);
%        set(gca, 'XGrid', 'on');
%
%        set(gca, 'YLim', [-1, 6]);
%        set(gca, 'YTick', -1:1:6);
%        set(gca, 'YGrid', 'on');
%
%        set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
%
%        papersize = get(gcf, 'PaperSize');
%        left = (papersize(1)- width)/2;
%        bottom = (papersize(2)- height)/2;
%        myfiguresize = [left, bottom, width, height];
%
%        set(gcf,'InvertHardcopy','on');
%        set(gcf,'PaperUnits', 'inches');
%        set(gcf,'PaperPosition', myfiguresize);
%
%        print('problema03_a','-dpng','-r600');
%
%    % Parte B -----------------------------------------------------------------
%        figure(1)
%        width  =  4.00;  % Width in inches
%        height =  5.00;  % Height in inches
%        pos = get(gcf, 'Position');
%        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
%
%        A = 5;
%        f = 20;
%
%        t = 0:0.0001:1;
%        y = saww(t,f,A);
%
%        plot(t, y, 'LineWidth', lw, 'MarkerSize', msz)
%        ylim([-0.5, 5.5])
%        xlabel('Tiempo (s)');
%        ylabel('Amplitud (V)');
%        title(sprintf('Onda diente de sierra\n(Frecuencia: 20 Hz; Amplitud:  5 V)'), 'FontSize', fsz);
%
%        set(gca, 'XLim', [0, 0.25]);
%        set(gca, 'XTick', 0:0.05:0.25);
%        set(gca, 'XGrid', 'on');
%
%        set(gca, 'YLim', [-1, 6]);
%        set(gca, 'YTick', -1:1:6);
%        set(gca, 'YGrid', 'on');
%
%        set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
%
%        papersize = get(gcf, 'PaperSize');
%        left = (papersize(1)- width)/2;
%        bottom = (papersize(2)- height)/2;
%        myfiguresize = [left, bottom, width, height];
%
%        set(gcf,'InvertHardcopy','on');
%        set(gcf,'PaperUnits', 'inches');
%        set(gcf,'PaperPosition', myfiguresize);
%
%        print('problema03_b','-dpng','-r600');
%
%% Problema 04 -----------------------------------------------------------------
%    figure(1)
%    width  =  4.00;  % Width in inches
%    height =  5.00;  % Height in inches
%    pos = get(gcf, 'Position');
%    set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
%
%    Fs = 100;
%
%    t  = linspace(0,5,5*Fs);
%    X  = 10*exp(1*t) - 5*exp(-0.5*t);
%
%    plot(t,X, 'b.', 'LineWidth', lw, 'MarkerSize', 1+0*msz)
%    xlabel('Tiempo (s)');
%    ylabel('Intensidad');
%    title(sprintf('X(t) = 10e^{t} - 5e^{-0.5t}\n(Frecuencia de Muestreo 100 Hz)'), 'FontSize', fsz);
%
%    set(gca, 'XLim', [0, 5]);
%    set(gca, 'XTick', 0:1:5);
%    set(gca, 'XGrid', 'on');
%
%    set(gca, 'YLim', [0, 1500]);
%    set(gca, 'YTick', 0:250:1500);
%    set(gca, 'YGrid', 'on');
%
%    set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
%
%    papersize = get(gcf, 'PaperSize');
%    left = (papersize(1)- width)/2;
%    bottom = (papersize(2)- height)/2;
%    myfiguresize = [left, bottom, width, height];
%
%    set(gcf,'InvertHardcopy','on');
%    set(gcf,'PaperUnits', 'inches');
%    set(gcf,'PaperPosition', myfiguresize);
%
%    print('problema04','-dpng','-r600');
%
%% Problema 05 -----------------------------------------------------------------
%    figure(1)
%    width  =  4.00;  % Width in inches
%    height =  5.00;  % Height in inches
%    pos = get(gcf, 'Position');
%    set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
%
%    Fs = 100;
%
%    t  = linspace(0,5,5*Fs);
%    X  = 10*exp(1*t) + 5*exp(-0.5*t);
%
%    plot(t,X, 'b.', 'LineWidth', lw, 'MarkerSize', 1+0*msz)
%    xlabel('Tiempo (s)');
%    ylabel('Intensidad');
%    title(sprintf('X(t) = 10e^{t} + 5e^{-0.5t}\n(Frecuencia de Muestreo 100 Hz)'), 'FontSize', fsz);
%
%    set(gca, 'XLim', [0, 5]);
%    set(gca, 'XTick', 0:1:5);
%    set(gca, 'XGrid', 'on');
%
%    set(gca, 'YLim', [0, 1500]);
%    set(gca, 'YTick', 0:250:1500);
%    set(gca, 'YGrid', 'on');
%
%    set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
%
%    papersize = get(gcf, 'PaperSize');
%    left = (papersize(1)- width)/2;
%    bottom = (papersize(2)- height)/2;
%    myfiguresize = [left, bottom, width, height];
%
%    set(gcf,'InvertHardcopy','on');
%    set(gcf,'PaperUnits', 'inches');
%    set(gcf,'PaperPosition', myfiguresize);
%
%    print('problema05','-dpng','-r600');
%
%% Problema 06 -----------------------------------------------------------------
%    figure(1)
%    width  =  7.00;  % Width in inches
%    height =  4.00;  % Height in inches
%    pos = get(gcf, 'Position');
%    set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
%
%    Fs = 20;
%    f  = 1;
%
%    t  = 0:1/Fs:5;
%    X  = zeros(3,length(t));
%
%    X(1,:) = exp( -1*t).*cos(2*pi*f.*t);
%    X(2,:) = exp( -5*t).*cos(2*pi*f.*t);
%    X(3,:) = exp(-20*t).*cos(2*pi*f.*t);
%
%    hold on
%    plot(t,X(1,:), '-r.', 'DisplayName','a =  1', 'LineWidth', lw, 'MarkerSize', msz)
%    plot(t,X(2,:), '-g.', 'DisplayName','a =  5', 'LineWidth', lw, 'MarkerSize', msz)
%    plot(t,X(3,:), '-b.', 'DisplayName','a = 20', 'LineWidth', lw, 'MarkerSize', msz)
%    box on
%
%    xlabel('Tiempo (s)');
%    ylabel('Amplitud');
%    title(sprintf('X(t)=e^{-at} cos(2\\pi t)'), 'FontSize', fsz);
%
%    set(gca, 'XLim', [0, 5]);
%    set(gca, 'XTick', 0:1:5);
%    set(gca, 'XGrid', 'on');
%
%    set(gca, 'YLim', [-1.5, 1.5]);
%    set(gca, 'YTick', -1.5:0.5:1.5);
%    set(gca, 'YGrid', 'on');
%
%    set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
%    legend('show')
%
%    papersize = get(gcf, 'PaperSize');
%    left = (papersize(1)- width)/2;
%    bottom = (papersize(2)- height)/2;
%    myfiguresize = [left, bottom, width, height];
%
%    set(gcf,'InvertHardcopy','on');
%    set(gcf,'PaperUnits', 'inches');
%    set(gcf,'PaperPosition', myfiguresize);
%
%    print('problema06','-dpng','-r600');
%
%% Problema 06 -----------------------------------------------------------------
    % Parte 0 ------------------------------------------------------------------
        figure(1)
        width  =  4.00;  % Width in inches
        height =  3.00;  % Height in inches
        pos = get(gcf, 'Position');
        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

        t = -10:0.0001:10;
        x = hfun(t);

        plot(t,x)

        xlabel('$$t$$', 'interpreter', 'latex');
        ylabel('$$x$$', 'interpreter', 'latex');
        title('$$x(t) = h(t)$$', 'interpreter', 'latex', 'FontSize', fsz);

        set(gca, 'XLim', [-10, 10]);
        set(gca, 'XTick', -10:2:10);
        set(gca, 'XGrid', 'on');

        set(gca, 'YLim', [min(x)-0.5, max(x) + 0.5]);
        set(gca, 'YTick', (min(x)-0.5):0.5:(max(x) + 0.5));
        set(gca, 'YGrid', 'on');

        set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties

        papersize = get(gcf, 'PaperSize');
        left = (papersize(1)- width)/2;
        bottom = (papersize(2)- height)/2;
        myfiguresize = [left, bottom, width, height];

        set(gcf,'InvertHardcopy','on');
        set(gcf,'PaperUnits', 'inches');
        set(gcf,'PaperPosition', myfiguresize);

        print('problema07','-dpng','-r600');

    % Parte A ------------------------------------------------------------------
        figure(1)
        width  =  4.00;  % Width in inches
        height =  3.00;  % Height in inches
        pos = get(gcf, 'Position');
        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

        t = -10:0.0001:10;
        x = hfun(t + 1);

        plot(t,x)

        xlabel('$$t$$', 'interpreter', 'latex');
        ylabel('$$x$$', 'interpreter', 'latex');
        title('$$x(t) = h(t + 1)$$', 'interpreter', 'latex', 'FontSize', fsz);

        set(gca, 'XLim', [-10, 10]);
        set(gca, 'XTick', -10:2:10);
        set(gca, 'XGrid', 'on');

        set(gca, 'YLim', [min(x)-0.5, max(x) + 0.5]);
        set(gca, 'YTick', (min(x)-0.5):0.5:(max(x) + 0.5));
        set(gca, 'YGrid', 'on');

        set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties

        papersize = get(gcf, 'PaperSize');
        left = (papersize(1)- width)/2;
        bottom = (papersize(2)- height)/2;
        myfiguresize = [left, bottom, width, height];

        set(gcf,'InvertHardcopy','on');
        set(gcf,'PaperUnits', 'inches');
        set(gcf,'PaperPosition', myfiguresize);

        print('problema07_a','-dpng','-r600');

    % Parte B ------------------------------------------------------------------
        figure(1)
        width  =  4.00;  % Width in inches
        height =  3.00;  % Height in inches
        pos = get(gcf, 'Position');
        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

        t = -10:0.0001:10;
        x = hfun(0.5*t - 2);

        plot(t,x)

        xlabel('$$t$$', 'interpreter', 'latex');
        ylabel('$$x$$', 'interpreter', 'latex');
        title('$$x(t) = h({1 \over 2}t-2)$$', 'interpreter', 'latex', 'FontSize', fsz);

        set(gca, 'XLim', [-10, 10]);
        set(gca, 'XTick', -10:2:10);
        set(gca, 'XGrid', 'on');

        set(gca, 'YLim', [min(x)-0.5, max(x) + 0.5]);
        set(gca, 'YTick', (min(x)-0.5):0.5:(max(x) + 0.5));
        set(gca, 'YGrid', 'on');

        set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties

        papersize = get(gcf, 'PaperSize');
        left = (papersize(1)- width)/2;
        bottom = (papersize(2)- height)/2;
        myfiguresize = [left, bottom, width, height];

        set(gcf,'InvertHardcopy','on');
        set(gcf,'PaperUnits', 'inches');
        set(gcf,'PaperPosition', myfiguresize);

        print('problema07_b','-dpng','-r600');

    % Parte C ------------------------------------------------------------------
        figure(1)
        width  =  4.00;  % Width in inches
        height =  3.00;  % Height in inches
        pos = get(gcf, 'Position');
        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

        t = -10:0.0001:10;
        x = hfun(1 - 2*t);

        plot(t,x)

        xlabel('$$t$$', 'interpreter', 'latex');
        ylabel('$$x$$', 'interpreter', 'latex');
        title('$$x(t) = h(1-2t)$$', 'interpreter', 'latex', 'FontSize', fsz);

        set(gca, 'XLim', [-10, 10]);
        set(gca, 'XTick', -10:2:10);
        set(gca, 'XGrid', 'on');

        set(gca, 'YLim', [min(x)-0.5, max(x) + 0.5]);
        set(gca, 'YTick', (min(x)-0.5):0.5:(max(x) + 0.5));
        set(gca, 'YGrid', 'on');

        set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties

        papersize = get(gcf, 'PaperSize');
        left = (papersize(1)- width)/2;
        bottom = (papersize(2)- height)/2;
        myfiguresize = [left, bottom, width, height];

        set(gcf,'InvertHardcopy','on');
        set(gcf,'PaperUnits', 'inches');
        set(gcf,'PaperPosition', myfiguresize);

        print('problema07_c','-dpng','-r600');

    % Parte D ------------------------------------------------------------------
        figure(1)
        width  =  4.00;  % Width in inches
        height =  3.00;  % Height in inches
        pos = get(gcf, 'Position');
        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

        t = -10:0.0001:10;
        x = 4*hfun(0.25*t);

        plot(t,x)

        xlabel('$$t$$', 'interpreter', 'latex');
        ylabel('$$x$$', 'interpreter', 'latex');
        title('$$x(t) = 4h({1\over 4}t)$$', 'interpreter', 'latex', 'FontSize', fsz);

        set(gca, 'XLim', [-10, 10]);
        set(gca, 'XTick', -10:2:10);
        set(gca, 'XGrid', 'on');

        set(gca, 'YLim', [min(x)-0.5, max(x) + 0.5]);
        set(gca, 'YTick', (min(x)-0.5):0.5:(max(x) + 0.5));
        set(gca, 'YGrid', 'on');

        set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties

        papersize = get(gcf, 'PaperSize');
        left = (papersize(1)- width)/2;
        bottom = (papersize(2)- height)/2;
        myfiguresize = [left, bottom, width, height];

        set(gcf,'InvertHardcopy','on');
        set(gcf,'PaperUnits', 'inches');
        set(gcf,'PaperPosition', myfiguresize);

        print('problema07_d','-dpng','-r600');

    % Parte E ------------------------------------------------------------------
        figure(1)
        width  =  4.00;  % Width in inches
        height =  3.00;  % Height in inches
        pos = get(gcf, 'Position');
        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

        t = -10:0.0001:10;
        x = 0.5.*hfun(t).*escalon(t) + hfun(-t).*escalon(t);

        plot(t,x)

        xlabel('$$t$$', 'interpreter', 'latex');
        ylabel('$$x$$', 'interpreter', 'latex');
        title('$$x(t) = {1\over 2}h(t)u(t) + h(-t)u(t)$$', 'interpreter', 'latex', 'FontSize', fsz);

        set(gca, 'XLim', [-10, 10]);
        set(gca, 'XTick', -10:2:10);
        set(gca, 'XGrid', 'on');

        set(gca, 'YLim', [min(x)-0.5, max(x) + 0.5]);
        set(gca, 'YTick', (min(x)-0.5):0.5:(max(x) + 0.5));
        set(gca, 'YGrid', 'on');

        set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties

        papersize = get(gcf, 'PaperSize');
        left = (papersize(1)- width)/2;
        bottom = (papersize(2)- height)/2;
        myfiguresize = [left, bottom, width, height];

        set(gcf,'InvertHardcopy','on');
        set(gcf,'PaperUnits', 'inches');
        set(gcf,'PaperPosition', myfiguresize);

        print('problema07_e','-dpng','-r600');

    % Parte F ------------------------------------------------------------------
        figure(1)
        width  =  4.00;  % Width in inches
        height =  3.00;  % Height in inches
        pos = get(gcf, 'Position');
        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

        t = -10:0.0001:10;
        x = hfun(0.5*t).*impulso(t+1);

        plot(t,x)

        xlabel('$$t$$', 'interpreter', 'latex');
        ylabel('$$x$$', 'interpreter', 'latex');
        title('$$x(t) = h({1\over 2}t)\delta(t)$$', 'interpreter', 'latex', 'FontSize', fsz);

        set(gca, 'XLim', [-10, 10]);
        set(gca, 'XTick', -10:2:10);
        set(gca, 'XGrid', 'on');

        set(gca, 'YLim', [min(x)-0.5, max(x) + 0.5]);
        set(gca, 'YTick', (min(x)-0.5):0.5:(max(x) + 0.5));
        set(gca, 'YGrid', 'on');

        set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties

        papersize = get(gcf, 'PaperSize');
        left = (papersize(1)- width)/2;
        bottom = (papersize(2)- height)/2;
        myfiguresize = [left, bottom, width, height];

        set(gcf,'InvertHardcopy','on');
        set(gcf,'PaperUnits', 'inches');
        set(gcf,'PaperPosition', myfiguresize);

        print('problema07_f','-dpng','-r600');

    % Parte G ------------------------------------------------------------------
        figure(1)
        width  =  4.00;  % Width in inches
        height =  3.00;  % Height in inches
        pos = get(gcf, 'Position');
        set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size

        t = -10:0.0001:10;
        x = hfun(t).*(escalon(t+1)-escalon(t-1));

        plot(t,x)

        xlabel('$$t$$', 'interpreter', 'latex');
        ylabel('$$x$$', 'interpreter', 'latex');
        title('$$x(t) = h(t)(u(t+1)-u(t-1))$$', 'interpreter', 'latex', 'FontSize', fsz);

        set(gca, 'XLim', [-10, 10]);
        set(gca, 'XTick', -10:2:10);
        set(gca, 'XGrid', 'on');

        set(gca, 'YLim', [min(x)-0.5, max(x) + 0.5]);
        set(gca, 'YTick', (min(x)-0.5):0.5:(max(x) + 0.5));
        set(gca, 'YGrid', 'on');

        set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties

        papersize = get(gcf, 'PaperSize');
        left = (papersize(1)- width)/2;
        bottom = (papersize(2)- height)/2;
        myfiguresize = [left, bottom, width, height];

        set(gcf,'InvertHardcopy','on');
        set(gcf,'PaperUnits', 'inches');
        set(gcf,'PaperPosition', myfiguresize);

        print('problema07_g','-dpng','-r600');

