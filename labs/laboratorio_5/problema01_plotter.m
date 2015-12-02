clear all
close all
clc

%% Plot Settings ---------------------------------------------------------------
    alw    = 0.75;  % AxesLineWidth
    Tfsz   = 12.00;  % Title Fontsize
    lfsz   = 12.00;  % Label Fontsize
    tfsz   = 9.00;  % Ticks Fontsize
    lw     = 0.75;  % LineWidth
    msz    = 6.00;  % MarkerSize

%% Señal -----------------------------------------------------------------------
    Fs = 100;
    T  = 1/Fs;
    t = 0:T:25;
    x = sin(t) + 0.25*sin(10*t);

%% Plot Original Signal --------------------------------------------------------
    figH = figure(1);
    width  = 3.50*2.0;  % Width in inches
    height = 3.00*1.0;  % Height in inches
    pos = get(figH, 'Position');
    set(figH, 'Position', [pos(1) pos(2) width*100 height*100]);

    axsH = subplot(1, 1, 1);
    pos = get(axsH, 'Position');
    pos(2) = pos(1);
    set(axsH, 'Position', pos);

    plot(axsH, t, x, 'LineWidth', lw, 'MarkerSize', msz);

    set(get(axsH, 'XLabel'), 'String', 'Tiempo (s)', 'Interpreter', 'latex', 'FontSize', lfsz);
    set(get(axsH, 'YLabel'), 'String', {'$$x$$',''}, 'Interpreter', 'latex', 'FontSize', lfsz);

    set(axsH, 'XLim', [0.0, 25.0]);
    set(axsH, 'XTick', 0.0:2.5:25.0);
    set(axsH, 'XGrid', 'on');

    set(axsH, 'YLim', [-1.5, 1.5]);
    set(axsH, 'YTick', -1.5:0.5:1.5);
    set(axsH, 'YGrid', 'on');

    set(axsH, 'LineWidth', alw);
    plotTickLatex2D('Axis', axsH, 'FontSize', tfsz);

    papersize = [width height];
    set(figH, 'InvertHardcopy', 'on');
    set(figH, 'PaperUnits', 'inches');
    set(figH, 'PaperSize', papersize);

    left = (papersize(1)- width)/2;
    bottom = (papersize(2)- height)/2;
    PaperPosition = [left, bottom, width, height];

    set(figH, 'PaperPosition', PaperPosition);

    print('problema01_signal', '-dpdf', '-r600');

%% Transformada de Fourier -----------------------------------------------------
    L = length(t);
    X = fft(x);
    P = abs(X/L);
    P = P(1:round(L/2)+1);
    P(2:end-1) = 2*P(2:end-1);
    f = Fs*(0:round(L/2))/L;

%% Find peaks ------------------------------------------------------------------
    [pks, locs] = findpeaks(P, 'Sortstr', 'descend');
    f1 = f(locs(1));
    f2 = f(locs(2));

%% Plot Power Spectrum ---------------------------------------------------------
    figH = figure(1);
    width  = 3.50*2.0;  % Width in inches
    height = 3.00*1.0;  % Height in inches
    pos = get(figH, 'Position');
    set(figH, 'Position', [pos(1) pos(2) width*100 height*100]);

    axsH = subplot(1, 1, 1);
    pos = get(axsH, 'Position');
    pos(2) = pos(1);
    set(axsH, 'Position', pos);

    plot(axsH, f, P, 'LineWidth', lw, 'MarkerSize', msz);
    set(axsH, 'NextPlot', 'add');
    pf1 = plot(axsH, f1, pks(1), 'r*', 'LineWidth', lw, 'MarkerSize', msz);
    pf2 = plot(axsH, f2, pks(2), 'g*', 'LineWidth', lw, 'MarkerSize', msz);
    leg = legend([pf1, pf2], sprintf('f = %7.4f Hz, P = %7.4f', f1, pks(1)), sprintf('f = %7.4f Hz, P = %7.4f', f2, pks(2)));
    set(leg, 'Interpreter', 'latex', 'FontSize', lfsz, 'Box', 'Off')
    set(axsH, 'NextPlot', 'replace');

    set(get(axsH, 'XLabel'), 'String', 'Frecuencia (Hz)', 'Interpreter', 'latex', 'FontSize', lfsz);
    set(get(axsH, 'YLabel'), 'String', {'$$P$$',''}, 'Interpreter', 'latex', 'FontSize', lfsz);

    set(axsH, 'XLim', [0.0, 10.0]);
    set(axsH, 'XTick', 0.0:2:10.0);
    set(axsH, 'XGrid', 'on');

    set(axsH, 'YLim', [0.0, 1.25]);
    set(axsH, 'YTick', 0.0:0.25:1.25);
    set(axsH, 'YGrid', 'on');

    set(axsH, 'LineWidth', alw);
    plotTickLatex2D('Axis', axsH, 'FontSize', tfsz);

    papersize = [width height];
    set(figH, 'InvertHardcopy', 'on');
    set(figH, 'PaperUnits', 'inches');
    set(figH, 'PaperSize', papersize);

    left = (papersize(1)- width)/2;
    bottom = (papersize(2)- height)/2;
    PaperPosition = [left, bottom, width, height];

    set(figH, 'PaperPosition', PaperPosition);

    print('problema01_power_spectrum', '-dpdf', '-r600');

%% Diseño del filtro pasabajo --------------------------------------------------
    Fc = 0.5*(f1 + f2);                     % [Hz] Frecuencia de Corte
    Bt = 1.0*Fc;                            % [Hz] Ancho de la banda de transicion
    Rs = 50;                                % [dB] Atenuacion en la banda de rechazo
    Rp = 1;                                 % [dB] Atenuacion en la banda de paso
    Wp = 2*(Fc - 0.8*Bt)/Fs;                % [rad/s] Frecuencia angular de la Bt
    Ws = 2*(Fc + 0.0*Bt)/Fs;                % [rad/s] Frecuencia angular de la Fc
    Gp = 10^(-Rp/20);
    Gs = 10^(-Rs/20);
    [n1b, wn1] = buttord(Wp, Ws, Rp, Rs);   % Orden del filtro y fecuencia angular de corte (función buttord).
    [B1, A1] = butter(n1b, wn1, 'low');     % Coeficientes del filtro (función butter).
    [z, p, k] = butter(n1b, wn1, 'low');    % Obteniendo los zeros, los polos y la ganancia
    [hf1, ff1] = freqz(B1, A1, 2048, Fs);     % Funcion de transferencia y respuesta en frecuencia
    sos = zp2sos(z, p, k);                  % Second-order section representation
    y = filtfilt(B1, A1, x);                % Filtrado de la señal

%% Plot Filtered Signal --------------------------------------------------------
    figH = figure(1);
    width  = 3.50*2.0;  % Width in inches
    height = 3.00*1.0;  % Height in inches
    pos = get(figH, 'Position');
    set(figH, 'Position', [pos(1) pos(2) width*100 height*100]);

    axsH = subplot(1, 1, 1);
    pos = get(axsH, 'Position');
    pos(2) = pos(1);
    set(axsH, 'Position', pos);

    plot(axsH, t, y, 'LineWidth', lw, 'MarkerSize', msz);

    set(get(axsH, 'XLabel'), 'String', 'Tiempo (s)', 'Interpreter', 'latex', 'FontSize', lfsz);
    set(get(axsH, 'YLabel'), 'String', {'$$y$$',''}, 'Interpreter', 'latex', 'FontSize', lfsz);

    set(axsH, 'XLim', [0.0, 25.0]);
    set(axsH, 'XTick', 0.0:2.5:25.0);
    set(axsH, 'XGrid', 'on');

    set(axsH, 'YLim', [-1.5, 1.5]);
    set(axsH, 'YTick', -1.5:0.5:1.5);
    set(axsH, 'YGrid', 'on');

    set(axsH, 'LineWidth', alw);
    plotTickLatex2D('Axis', axsH, 'FontSize', tfsz);

    papersize = [width height];
    set(figH, 'InvertHardcopy', 'on');
    set(figH, 'PaperUnits', 'inches');
    set(figH, 'PaperSize', papersize);

    left = (papersize(1)- width)/2;
    bottom = (papersize(2)- height)/2;
    PaperPosition = [left, bottom, width, height];

    set(figH, 'PaperPosition', PaperPosition);

    print('problema01_lowpass_filtered_signal', '-dpdf', '-r600');

%% Plot Transfer Function ------------------------------------------------------
    figH = figure(1);
    width  = 3.50*2.0;  % Width in inches
    height = 3.00*1.0;  % Height in inches
    pos = get(figH, 'Position');
    set(figH, 'Position', [pos(1) pos(2) width*100 height*100]);

    axsH = subplot(1, 1, 1);
    pos = get(axsH, 'Position');
    pos(2) = pos(1);
    set(axsH, 'Position', pos);

    plot(axsH, ff1, abs(hf1), 'LineWidth', lw, 'MarkerSize', msz);
    set(axsH, 'NextPlot', 'add');
    plot(axsH, [0 Wp*Fs/2 Wp*Fs/2], [Gp Gp Gs], 'r--', 'LineWidth', lw, 'MarkerSize', msz);
    plot(axsH, [Ws*Fs/2 Ws*Fs/2 5], [Gp Gs Gs], 'g--', 'LineWidth', lw, 'MarkerSize', msz);
    pf3 = plot(axsH, wn1*Fs/2, 1, 'g*', 'LineWidth', lw, 'MarkerSize', msz, 'MarkerEdgeColor', [1 1 1]);
    leg = legend([pf3], sprintf('$$f_c = %7.4f Hz$$', wn1*Fs/2));
    set(leg, 'Interpreter', 'latex', 'FontSize', lfsz, 'Box', 'Off');
    set(axsH, 'NextPlot', 'replace');

    set(get(axsH, 'XLabel'), 'String', 'Frecuencia (Hz)', 'Interpreter', 'latex', 'FontSize', lfsz);
    set(get(axsH, 'YLabel'), 'String', {'$$|H|$$',''}, 'Interpreter', 'latex', 'FontSize', lfsz);

    set(axsH, 'XLim', [0.0, 2.0]);
    set(axsH, 'XTick', 0.0:0.25:2.0);
    set(axsH, 'XGrid', 'on');

    set(axsH, 'YLim', [0.0, 1.25]);
    set(axsH, 'YTick', 0.0:0.25:1.25);
    set(axsH, 'YGrid', 'on');

    set(axsH, 'LineWidth', alw);
    plotTickLatex2D('Axis', axsH, 'FontSize', tfsz);

    papersize = [width height];
    set(figH, 'InvertHardcopy', 'on');
    set(figH, 'PaperUnits', 'inches');
    set(figH, 'PaperSize', papersize);

    left = (papersize(1)- width)/2;
    bottom = (papersize(2)- height)/2;
    PaperPosition = [left, bottom, width, height];

    set(figH, 'PaperPosition', PaperPosition);

    print('problema01_lowpass_transfer_function', '-dpdf', '-r600');

%% Recovery data from Bode plot ------------------------------------------------
    figH = figure(1);

    freqz(sos, 1024, Fs);
    axsH = get(figH, 'Children');

    bf = get(get(axsH(1), 'Children'), 'XData');
    bhf = get(get(axsH(1), 'Children'), 'YData');

    bt = get(get(axsH(2), 'Children'), 'XData');
    bht = get(get(axsH(2), 'Children'), 'YData');

    clf(figH);

%% Plot Filter responde in magnitude -------------------------------------------
    figH = figure(1);
    width  = 3.50*2.0;  % Width in inches
    height = 3.00*1.0;  % Height in inches
    pos = get(figH, 'Position');
    set(figH, 'Position', [pos(1) pos(2) width*100 height*100]);

    axsH = subplot(1, 1, 1);
    pos = get(axsH, 'Position');
    pos(2) = pos(1);
    set(axsH, 'Position', pos);

    plot(axsH, bf, bhf, 'LineWidth', lw, 'MarkerSize', msz);

    set(get(axsH, 'XLabel'), 'String', 'Frecuencia (Hz)', 'Interpreter', 'latex', 'FontSize', lfsz);
    set(get(axsH, 'YLabel'), 'String', {'Magnitud (dB)';''}, 'Interpreter', 'latex', 'FontSize', lfsz);

    set(axsH, 'XLim', [0.0, 50.0]);
    set(axsH, 'XTick', 0.0:5.0:50.0);
    set(axsH, 'XGrid', 'on');

    set(axsH, 'YLim', [-400.0, 0.0]);
    set(axsH, 'YTick', -400.0:100.0:0.0);
    set(axsH, 'YGrid', 'on');

    set(axsH, 'LineWidth', alw);
    plotTickLatex2D('Axis', axsH, 'FontSize', tfsz);

    papersize = [width height];
    set(figH, 'InvertHardcopy', 'on');
    set(figH, 'PaperUnits', 'inches');
    set(figH, 'PaperSize', papersize);

    left = (papersize(1)- width)/2;
    bottom = (papersize(2)- height)/2;
    PaperPosition = [left, bottom, width, height];

    set(figH, 'PaperPosition', PaperPosition);

    print('problema01_lowpass_filter_magnitude', '-dpdf', '-r600');

%% Plot Filter responde in magnitude -------------------------------------------
    figH = figure(1);
    width  = 3.50*2.0;  % Width in inches
    height = 3.00*1.0;  % Light in inches
    pos = get(figH, 'Position');
    set(figH, 'Position', [pos(1) pos(2) width*100 height*100]);

    axsH = subplot(1, 1, 1);
    pos = get(axsH, 'Position');
    pos(2) = pos(1);
    set(axsH, 'Position', pos);

    plot(axsH, bt, bht, 'LineWidth', lw, 'MarkerSize', msz);

    set(get(axsH, 'XLabel'), 'String', 'Frecuencia (Hz)', 'Interpreter', 'latex', 'FontSize', lfsz);
    set(get(axsH, 'YLabel'), 'String', {'Fase (deg)';''}, 'Interpreter', 'latex', 'FontSize', lfsz);

    set(axsH, 'XLim', [0.0, 50.0]);
    set(axsH, 'XTick', 0.0:5.0:50.0);
    set(axsH, 'XGrid', 'on');

    set(axsH, 'YLim', [-400.0, 0.0]);
    set(axsH, 'YTick', -400.0:100.0:0.0);
    set(axsH, 'YGrid', 'on');

    set(axsH, 'LineWidth', alw);
    plotTickLatex2D('Axis', axsH, 'FontSize', tfsz);

    papersize = [width height];
    set(figH, 'InvertHardcopy', 'on');
    set(figH, 'PaperUnits', 'inches');
    set(figH, 'PaperSize', papersize);

    left = (papersize(1)- width)/2;
    bottom = (papersize(2)- height)/2;
    PaperPosition = [left, bottom, width, height];

    set(figH, 'PaperPosition', PaperPosition);

    print('problema01_lowpass_filter_phase', '-dpdf', '-r600');

%% Diseño del filtro pasaalto --------------------------------------------------
    Fc = 0.5*(f1 + f2);                     % [Hz] Frecuencia de Corte
    Bt = 1.0*Fc;                            % [Hz] Ancho de la banda de transicion
    Rs = 30;                                % [dB] Atenuacion en la banda de rechazo
    Rp = 2;                                 % [dB] Atenuacion en la banda de paso
    Wp = 2*(Fc + 0.6*Bt)/Fs;                % [rad/s] Frecuencia angular de la Bt
    Ws = 2*(Fc + 0.0*Bt)/Fs;                % [rad/s] Frecuencia angular de la Fc
    Gp = 10^(-Rp/20);
    Gs = 10^(-Rs/20);
    [n1b, wn1] = buttord(Wp, Ws, Rp, Rs);   % Orden del filtro y fecuencia angular de corte (función buttord).
    [B1, A1] = butter(n1b, wn1, 'high');     % Coeficientes del filtro (función butter).
    [z, p, k] = butter(n1b, wn1, 'high');    % Obteniendo los zeros, los polos y la ganancia
    [hf1, ff1] = freqz(B1, A1, 2048, Fs);     % Funcion de transferencia y respuesta en frecuencia
    sos = zp2sos(z, p, k);                  % Second-order section representation
    y = filtfilt(B1, A1, x);                % Filtrado de la señal

%% Plot Filtered Signal --------------------------------------------------------
    figH = figure(1);
    width  = 3.50*2.0;  % Width in inches
    height = 3.00*1.0;  % Height in inches
    pos = get(figH, 'Position');
    set(figH, 'Position', [pos(1) pos(2) width*100 height*100]);

    axsH = subplot(1, 1, 1);
    pos = get(axsH, 'Position');
    pos(2) = pos(1);
    set(axsH, 'Position', pos);

    plot(axsH, t, y, 'LineWidth', lw, 'MarkerSize', msz);

    set(get(axsH, 'XLabel'), 'String', 'Tiempo (s)', 'Interpreter', 'latex', 'FontSize', lfsz);
    set(get(axsH, 'YLabel'), 'String', {'$$y$$',''}, 'Interpreter', 'latex', 'FontSize', lfsz);

    set(axsH, 'XLim', [0.0, 25.0]);
    set(axsH, 'XTick', 0.0:2.5:25.0);
    set(axsH, 'XGrid', 'on');

    set(axsH, 'YLim', [-0.3, 0.3]);
    set(axsH, 'YTick', -0.3:0.1:0.3);
    set(axsH, 'YGrid', 'on');

    set(axsH, 'LineWidth', alw);
    plotTickLatex2D('Axis', axsH, 'FontSize', tfsz);

    papersize = [width height];
    set(figH, 'InvertHardcopy', 'on');
    set(figH, 'PaperUnits', 'inches');
    set(figH, 'PaperSize', papersize);

    left = (papersize(1)- width)/2;
    bottom = (papersize(2)- height)/2;
    PaperPosition = [left, bottom, width, height];

    set(figH, 'PaperPosition', PaperPosition);

    print('problema01_highpass_filtered_signal', '-dpdf', '-r600');

%% Plot Transfer Function ------------------------------------------------------
    figH = figure(1);
    width  = 3.50*2.0;  % Width in inches
    height = 3.00*1.0;  % Height in inches
    pos = get(figH, 'Position');
    set(figH, 'Position', [pos(1) pos(2) width*100 height*100]);

    axsH = subplot(1, 1, 1);
    pos = get(axsH, 'Position');
    pos(2) = pos(1);
    set(axsH, 'Position', pos);

    plot(axsH, ff1, abs(hf1), 'LineWidth', lw, 'MarkerSize', msz);
    set(axsH, 'NextPlot', 'add');
    plot(axsH, [0 Ws*Fs/2 Ws*Fs/2], [Gs Gs Gp], 'r--', 'LineWidth', lw, 'MarkerSize', msz);
    plot(axsH, [Wp*Fs/2 Wp*Fs/2 5], [Gs Gp Gp], 'g--', 'LineWidth', lw, 'MarkerSize', msz);
    pf3 = plot(axsH, wn1*Fs/2, 1, 'g*', 'LineWidth', lw, 'MarkerSize', msz, 'MarkerEdgeColor', [1 1 1]);
    leg = legend([pf3], sprintf('$$f_c = %7.4f Hz$$', wn1*Fs/2));
    set(leg, 'Interpreter', 'latex', 'FontSize', lfsz, 'Box', 'Off');
    set(axsH, 'NextPlot', 'replace');

    set(get(axsH, 'XLabel'), 'String', 'Frecuencia (Hz)', 'Interpreter', 'latex', 'FontSize', lfsz);
    set(get(axsH, 'YLabel'), 'String', {'$$|H|$$',''}, 'Interpreter', 'latex', 'FontSize', lfsz);

    set(axsH, 'XLim', [0.0, 2.0]);
    set(axsH, 'XTick', 0.0:0.25:2.0);
    set(axsH, 'XGrid', 'on');

    set(axsH, 'YLim', [0.0, 1.25]);
    set(axsH, 'YTick', 0.0:0.25:1.25);
    set(axsH, 'YGrid', 'on');

    set(axsH, 'LineWidth', alw);
    plotTickLatex2D('Axis', axsH, 'FontSize', tfsz);

    papersize = [width height];
    set(figH, 'InvertHardcopy', 'on');
    set(figH, 'PaperUnits', 'inches');
    set(figH, 'PaperSize', papersize);

    left = (papersize(1)- width)/2;
    bottom = (papersize(2)- height)/2;
    PaperPosition = [left, bottom, width, height];

    set(figH, 'PaperPosition', PaperPosition);

    print('problema01_highpass_transfer_function', '-dpdf', '-r600');

%% Recovery data from Bode plot ------------------------------------------------
    figH = figure(1);

    freqz(sos, 1024, Fs);
    axsH = get(figH, 'Children');

    bf = get(get(axsH(1), 'Children'), 'XData');
    bhf = get(get(axsH(1), 'Children'), 'YData');

    bt = get(get(axsH(2), 'Children'), 'XData');
    bht = get(get(axsH(2), 'Children'), 'YData');

    clf(figH);

%% Plot Filter responde in magnitude -------------------------------------------
    figH = figure(1);
    width  = 3.50*2.0;  % Width in inches
    height = 3.00*1.0;  % Height in inches
    pos = get(figH, 'Position');
    set(figH, 'Position', [pos(1) pos(2) width*100 height*100]);

    axsH = subplot(1, 1, 1);
    pos = get(axsH, 'Position');
    pos(2) = pos(1);
    set(axsH, 'Position', pos);

    plot(axsH, bf, bhf, 'LineWidth', lw, 'MarkerSize', msz);

    set(get(axsH, 'XLabel'), 'String', 'Frecuencia (Hz)', 'Interpreter', 'latex', 'FontSize', lfsz);
    set(get(axsH, 'YLabel'), 'String', {'Magnitud (dB)';''}, 'Interpreter', 'latex', 'FontSize', lfsz);

    set(axsH, 'XLim', [0.0, 50.0]);
    set(axsH, 'XTick', 0.0:5.0:50.0);
    set(axsH, 'XGrid', 'on');

    set(axsH, 'YLim', [-200.0, 0.0]);
    set(axsH, 'YTick', -200.0:50.0:0.0);
    set(axsH, 'YGrid', 'on');

    set(axsH, 'LineWidth', alw);
    plotTickLatex2D('Axis', axsH, 'FontSize', tfsz);

    papersize = [width height];
    set(figH, 'InvertHardcopy', 'on');
    set(figH, 'PaperUnits', 'inches');
    set(figH, 'PaperSize', papersize);

    left = (papersize(1)- width)/2;
    bottom = (papersize(2)- height)/2;
    PaperPosition = [left, bottom, width, height];

    set(figH, 'PaperPosition', PaperPosition);

    print('problema01_highpass_filter_magnitude', '-dpdf', '-r600');

%% Plot Filter responde in magnitude -------------------------------------------
    figH = figure(1);
    width  = 3.50*2.0;  % Width in inches
    height = 3.00*1.0;  % Light in inches
    pos = get(figH, 'Position');
    set(figH, 'Position', [pos(1) pos(2) width*100 height*100]);

    axsH = subplot(1, 1, 1);
    pos = get(axsH, 'Position');
    pos(2) = pos(1);
    set(axsH, 'Position', pos);

    plot(axsH, bt, bht, 'LineWidth', lw, 'MarkerSize', msz);

    set(get(axsH, 'XLabel'), 'String', 'Frecuencia (Hz)', 'Interpreter', 'latex', 'FontSize', lfsz);
    set(get(axsH, 'YLabel'), 'String', {'Fase (deg)';''}, 'Interpreter', 'latex', 'FontSize', lfsz);

    set(axsH, 'XLim', [0.0, 50.0]);
    set(axsH, 'XTick', 0.0:5.0:50.0);
    set(axsH, 'XGrid', 'on');

    set(axsH, 'YLim', [0.0, 800.0]);
    set(axsH, 'YTick', 0.0:100.0:800.0);
    set(axsH, 'YGrid', 'on');

    set(axsH, 'LineWidth', alw);
    plotTickLatex2D('Axis', axsH, 'FontSize', tfsz);

    papersize = [width height];
    set(figH, 'InvertHardcopy', 'on');
    set(figH, 'PaperUnits', 'inches');
    set(figH, 'PaperSize', papersize);

    left = (papersize(1)- width)/2;
    bottom = (papersize(2)- height)/2;
    PaperPosition = [left, bottom, width, height];

    set(figH, 'PaperPosition', PaperPosition);

    print('problema01_highpass_filter_phase', '-dpdf', '-r600');


close all
