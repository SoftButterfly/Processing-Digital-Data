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
    load sample01.mat
    Fs = 1;
    T  = 1/Fs;
    s  = load('pardata.txt');
    L  = length(s);
    t  = (1:L)*T;
    sf = medfilt1(s);
    x  = sf - mean(sf);

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

    plot(axsH, t, s, 'LineWidth', lw, 'MarkerSize', msz);

    set(get(axsH, 'XLabel'), 'String', 'Tiempo (s)', 'Interpreter', 'latex', 'FontSize', lfsz);
    set(get(axsH, 'YLabel'), 'String', {'Se\~nal',''}, 'Interpreter', 'latex', 'FontSize', lfsz);

    set(axsH, 'XLim', [0.0, max(t)]);
    % set(axsH, 'XTick', 0.0:0.5:5.0);
    set(axsH, 'XGrid', 'on');

    set(axsH, 'YLim', [0.0, 3.0]);
    set(axsH, 'YTick', 0.0:0.5:3.0);
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

    print('problema03_signal', '-dpdf', '-r600');

%% Plot median filtered signal -------------------------------------------------
    figH = figure(1);
    width  = 3.50*2.0;  % Width in inches
    height = 3.00*1.0;  % Height in inches
    pos = get(figH, 'Position');
    set(figH, 'Position', [pos(1) pos(2) width*100 height*100]);

    axsH = subplot(1, 1, 1);
    pos = get(axsH, 'Position');
    pos(2) = pos(1);
    set(axsH, 'Position', pos);

    plot(axsH, t, sf, 'LineWidth', lw, 'MarkerSize', msz);

    set(get(axsH, 'XLabel'), 'String', 'Tiempo (s)', 'Interpreter', 'latex', 'FontSize', lfsz);
    set(get(axsH, 'YLabel'), 'String', {'Se\~nal',''}, 'Interpreter', 'latex', 'FontSize', lfsz);

    set(axsH, 'XLim', [0.0, max(t)]);
    % set(axsH, 'XTick', 0.0:0.5:5.0);
    set(axsH, 'XGrid', 'on');

    set(axsH, 'YLim', [0.0, 3.0]);
    set(axsH, 'YTick', 0.0:0.5:3.0);
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

    print('problema03_signal_median_filter', '-dpdf', '-r600');

%% Removed mean signal ---------------------------------------------------------
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
    set(get(axsH, 'YLabel'), 'String', {'Se\~nal',''}, 'Interpreter', 'latex', 'FontSize', lfsz);

    set(axsH, 'XLim', [0.0, max(t)]);
    % set(axsH, 'XTick', 0.0:0.5:5.0);
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

    print('problema03_signal_removed_mean', '-dpdf', '-r600');

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
    leg = legend([pf1, pf2], sprintf('f = %7.4e Hz (T = %7.1f h), P = %7.4f', f1, (1/f1)/(60*60), pks(1)), sprintf('f = %7.4e Hz (T = %7.1f h), P = %7.4f', f2, (1/f2)/(60*60), pks(2)));
    set(leg, 'Interpreter', 'latex', 'FontSize', lfsz, 'Box', 'Off')
    set(axsH, 'NextPlot', 'replace');

    set(get(axsH, 'XLabel'), 'String', 'Frecuencia (Hz)', 'Interpreter', 'latex', 'FontSize', lfsz);
    set(get(axsH, 'YLabel'), 'String', {'$$P$$',''}, 'Interpreter', 'latex', 'FontSize', lfsz);

    set(axsH, 'XLim', [0.0, 0.0001]);
    % set(axsH, 'XTick', 0.0:250:0.1);
    set(axsH, 'XGrid', 'on');

    set(axsH, 'YLim', [0.0, 0.25]);
    set(axsH, 'YTick', 0.0:0.05:0.25);
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

    print('problema03_power_spectrum', '-dpdf', '-r600');

%% Focus power spectrum in 8<1/f<60 --------------------------------------------
    wf = f((1./f)<60);
    wP = P((1./f)<60);
    wP = wP(8<1./wf);
    wf = wf(8<1./wf);

%% Plot Focus Power Spectrum ---------------------------------------------------
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

    set(get(axsH, 'XLabel'), 'String', 'Frecuencia (Hz)', 'Interpreter', 'latex', 'FontSize', lfsz);
    set(get(axsH, 'YLabel'), 'String', {'$$P$$',''}, 'Interpreter', 'latex', 'FontSize', lfsz);

    set(axsH, 'XLim', [0.01, 0.13]);
    set(axsH, 'XTick', 0.01:0.01:0.13);
    set(axsH, 'XGrid', 'on');

    set(axsH, 'YLim', [0.0, 0.0015]);
    set(axsH, 'YTick', 0.0:0.00025:0.0015);
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

    print('problema03_power_spectrum_focus', '-dpdf', '-r600');

%% Diseño del filtro pasaalto (mareas) -----------------------------------------
    Fc = 1/(0.5*60*60);                     % [Hz] Frecuencia de Corte
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

    set(axsH, 'XLim', [0.0, max(t)]);
    % set(axsH, 'XTick', 0.0:0.5:5.0);
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

    print('problema03_signal_tidal', '-dpdf', '-r600');

%% Transformada de Fourier -----------------------------------------------------
    L = length(t);
    Y = fft(y);
    P = abs(Y/L);
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
    leg = legend([pf1, pf2], sprintf('f = %7.4e Hz (T = %7.1f h), P = %7.4f', f1, (1/f1)/(60*60), pks(1)), sprintf('f = %7.4e Hz (T = %7.1f h), P = %7.4f', f2, (1/f2)/(60*60), pks(2)));
    set(leg, 'Interpreter', 'latex', 'FontSize', lfsz, 'Box', 'Off')
    set(axsH, 'NextPlot', 'replace');

    set(get(axsH, 'XLabel'), 'String', 'Frecuencia (Hz)', 'Interpreter', 'latex', 'FontSize', lfsz);
    set(get(axsH, 'YLabel'), 'String', {'$$P$$',''}, 'Interpreter', 'latex', 'FontSize', lfsz);

    set(axsH, 'XLim', [0.0, 0.0001]);
    % set(axsH, 'XTick', 0.0:250:0.1);
    set(axsH, 'XGrid', 'on');

    set(axsH, 'YLim', [0.0, 0.25]);
    set(axsH, 'YTick', 0.0:0.05:0.25);
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

    print('problema03_power_spectrum_tidal', '-dpdf', '-r600');

%% Diseño del filtro pasabansa (olas) ------------------------------------------
    Fc = [1/60 1/8];                                       % [Hz] Frecuencia de Corte
    Bt = 0.5*(Fc(2) - Fc(1));                              % [Hz] Ancho de la banda de transicion
    Rs = 50;                                               % [dB] Atenuacion en la banda de rechazo
    Rp = 2;                                                % [dB] Atenuacion en la banda de paso
    Wp = 2*Fc/Fs;                                          % [rad/s] Frecuencia angular de la Bt
    Ws = [2*(Fc(1) - 0.30*Bt)/Fs  2*(Fc(2) + 2.0*Bt)/Fs];  % [rad/s] Frecuencia angular de la Fc
    Gp = 10^(-Rp/20);
    Gs = 10^(-Rs/20);
    [n1b, wn1] = buttord(Wp, Ws, Rp, Rs);                  % Orden del filtro y fecuencia angular de corte (función buttord).
    [B1, A1] = butter(n1b, wn1, 'bandpass');               % Coeficientes del filtro (función butter).
    [z, p, k] = butter(n1b, wn1, 'bandpass');              % Obteniendo los zeros, los polos y la ganancia
    [hf1, ff1] = freqz(B1, A1, 2048, Fs);                  % Funcion de transferencia y respuesta en frecuencia
    sos = zp2sos(z, p, k);                                 % Second-order section representation
    y = filtfilt(B1, A1, x);                               % Filtrado de la señal

%% Plot waves signal -----------------------------------------------------------
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
    set(get(axsH, 'YLabel'), 'String', {'Se\~nal',''}, 'Interpreter', 'latex', 'FontSize', lfsz);

    set(axsH, 'XLim', [0.0, 600.0]);
    % set(axsH, 'XTick', 0.0:0.5:5.0);
    set(axsH, 'XGrid', 'on');

    set(axsH, 'YLim', [-0.20, 0.2]);
    set(axsH, 'YTick', -0.2:0.1:0.2);
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

    print('problema03_signal_waves', '-dpdf', '-r600');

%% Transformada de Fourier -----------------------------------------------------
    L = length(t);
    Y = fft(y);
    P = abs(Y/L);
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
    leg = legend([pf1, pf2], sprintf('f = %7.4e Hz (T = %7.1f s), P = %7.4f', f1, (1/f1), pks(1)), sprintf('f = %7.4e Hz (T = %7.1f s), P = %7.4f', f2, (1/f2), pks(2)));
    set(leg, 'Interpreter', 'latex', 'FontSize', lfsz, 'Box', 'Off')
    set(axsH, 'NextPlot', 'replace');

    set(get(axsH, 'XLabel'), 'String', 'Frecuencia (Hz)', 'Interpreter', 'latex', 'FontSize', lfsz);
    set(get(axsH, 'YLabel'), 'String', {'$$P$$',''}, 'Interpreter', 'latex', 'FontSize', lfsz);

    set(axsH, 'XLim', [0.0, 0.2]);
    set(axsH, 'XTick', 0.0:0.02:0.2);
    set(axsH, 'XGrid', 'on');

    set(axsH, 'YLim', [0.0, 0.0015]);
    set(axsH, 'YTick', 0.0:0.00025:0.0015);
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

    print('problema03_power_spectrum_waves', '-dpdf', '-r600');

