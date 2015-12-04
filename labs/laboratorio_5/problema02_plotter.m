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
    Fs = get(Recorder,'SampleRate');
    T  = 1/Fs;
    L  = get(Recorder,'TotalSamples');
    s  = Recorder.getaudiodata();
    x  = s - mean(s);
    t  = (1:L)*T;

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
    set(get(axsH, 'YLabel'), 'String', {'Se\~nal',''}, 'Interpreter', 'latex', 'FontSize', lfsz);

    set(axsH, 'XLim', [0.0, 5.0]);
    set(axsH, 'XTick', 0.0:0.5:5.0);
    set(axsH, 'XGrid', 'on');

    set(axsH, 'YLim', [-1.0, 1.0]);
    set(axsH, 'YTick', -1.0:0.25:1.0);
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

    print('problema02_sample01_signal', '-dpdf', '-r600');

%% Transformada de Fourier -----------------------------------------------------
    X = fft(x);
    P = abs(X/L);
    P = P(1:round(L/2)+1);
    P(2:end-1) = 2*P(2:end-1);
    f = Fs*(0:round(L/2))/L;
    S01X = X;

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

    set(get(axsH, 'XLabel'), 'String', 'Frecuencia (Hz)', 'Interpreter', 'latex', 'FontSize', lfsz);
    set(get(axsH, 'YLabel'), 'String', {'$$P$$',''}, 'Interpreter', 'latex', 'FontSize', lfsz);

    set(axsH, 'XLim', [0.0, 3500.0]);
    set(axsH, 'XTick', 0.0:250:3500.0);
    set(axsH, 'XGrid', 'on');

    set(axsH, 'YLim', [0.0, 0.025]);
    set(axsH, 'YTick', 0.0:0.005:0.025);
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

    print('problema02_sample01_power_spectrum', '-dpdf', '-r600');

%% Diseño del filtro pasabajo --------------------------------------------------
    Fc = 100;                               % [Hz] Frecuencia de Corte
    Bt = 1.0*Fc;                            % [Hz] Ancho de la banda de transicion
    Rs = 30;                                % [dB] Atenuacion en la banda de rechazo
    Rp = 2;                                 % [dB] Atenuacion en la banda de paso
    Wp = 2*(Fc + 0.6*Bt)/Fs;                % [rad/s] Frecuencia angular de la Bt
    Ws = 2*(Fc + 0.0*Bt)/Fs;                % [rad/s] Frecuencia angular de la Fc
    Gp = 10^(-Rp/20);
    Gs = 10^(-Rs/20);
    [n1b, wn1] = buttord(Wp, Ws, Rp, Rs);   % Orden del filtro y fecuencia angular de corte (función buttord).
    [B1, A1] = butter(5, 2*Fc/Fs, 'high');     % Coeficientes del filtro (función butter).
    [z, p, k] = butter(5, 2*Fc/Fs, 'high');    % Obteniendo los zeros, los polos y la ganancia
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
    set(get(axsH, 'YLabel'), 'String', {'Se\~nal Filtrada',''}, 'Interpreter', 'latex', 'FontSize', lfsz);

    set(axsH, 'XLim', [0.0, 5.0]);
    set(axsH, 'XTick', 0.0:0.5:5.0);
    set(axsH, 'XGrid', 'on');

    set(axsH, 'YLim', [-1.0, 1.0]);
    set(axsH, 'YTick', -1.0:0.25:1.0);
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

    print('problema02_sample01_highpass_filtered_signal', '-dpdf', '-r600');

%% Señal -----------------------------------------------------------------------
    load sample02.mat
    Fs = get(Recorder,'SampleRate');
    T  = 1/Fs;
    L  = get(Recorder,'TotalSamples');
    s  = Recorder.getaudiodata();
    x  = s - mean(s);
    t  = (1:L)*T;

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
    set(get(axsH, 'YLabel'), 'String', {'Se\~nal',''}, 'Interpreter', 'latex', 'FontSize', lfsz);

    set(axsH, 'XLim', [0.0, 5.0]);
    set(axsH, 'XTick', 0.0:0.5:5.0);
    set(axsH, 'XGrid', 'on');

    set(axsH, 'YLim', [-1.0, 1.0]);
    set(axsH, 'YTick', -1.0:0.25:1.0);
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

    print('problema02_sample02_signal', '-dpdf', '-r600');

%% Transformada de Fourier -----------------------------------------------------
    X = fft(x);
    P = abs(X/L);
    P = P(1:round(L/2)+1);
    P(2:end-1) = 2*P(2:end-1);
    f = Fs*(0:round(L/2))/L;
    S02X = X;

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

    set(get(axsH, 'XLabel'), 'String', 'Frecuencia (Hz)', 'Interpreter', 'latex', 'FontSize', lfsz);
    set(get(axsH, 'YLabel'), 'String', {'$$P$$',''}, 'Interpreter', 'latex', 'FontSize', lfsz);

    set(axsH, 'XLim', [0.0, 3500.0]);
    set(axsH, 'XTick', 0.0:250:3500.0);
    set(axsH, 'XGrid', 'on');

    set(axsH, 'YLim', [0.0, 0.025]);
    set(axsH, 'YTick', 0.0:0.005:0.025);
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

    print('problema02_sample02_power_spectrum', '-dpdf', '-r600');

%% Diseño del filtro pasabajo --------------------------------------------------
    Fc = 100;                               % [Hz] Frecuencia de Corte
    Bt = 1.0*Fc;                            % [Hz] Ancho de la banda de transicion
    Rs = 30;                                % [dB] Atenuacion en la banda de rechazo
    Rp = 2;                                 % [dB] Atenuacion en la banda de paso
    Wp = 2*(Fc + 0.6*Bt)/Fs;                % [rad/s] Frecuencia angular de la Bt
    Ws = 2*(Fc + 0.0*Bt)/Fs;                % [rad/s] Frecuencia angular de la Fc
    Gp = 10^(-Rp/20);
    Gs = 10^(-Rs/20);
    [n1b, wn1] = buttord(Wp, Ws, Rp, Rs);   % Orden del filtro y fecuencia angular de corte (función buttord).
    [B1, A1] = butter(5, 2*Fc/Fs, 'high');     % Coeficientes del filtro (función butter).
    [z, p, k] = butter(5, 2*Fc/Fs, 'high');    % Obteniendo los zeros, los polos y la ganancia
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
    set(get(axsH, 'YLabel'), 'String', {'Se\~nal Filtrada',''}, 'Interpreter', 'latex', 'FontSize', lfsz);

    set(axsH, 'XLim', [0.0, 5.0]);
    set(axsH, 'XTick', 0.0:0.5:5.0);
    set(axsH, 'XGrid', 'on');

    set(axsH, 'YLim', [-1.0, 1.0]);
    set(axsH, 'YTick', -1.0:0.25:1.0);
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

    print('problema02_sample02_highpass_filtered_signal', '-dpdf', '-r600');

%% Correlation signals ---------------------------------------------------------
    cc = abs(corr(S01X,S02X));
    disp(cc);
