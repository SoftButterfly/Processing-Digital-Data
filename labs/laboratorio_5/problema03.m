    Fs = 1;
    T  = 1/Fs;
    s  = load('pardata.txt');
    L  = length(s);
    t  = (1:L)*T;
    sf = medfilt1(s);
    x  = sf - mean(sf);

    figure(1);
    plot(t, s);
    xLabel('Tiempo (s)');
    xLabel('Senal');
    title('Senal mareografica');

    figure(2);
    plot(t, sf);
    xLabel('Tiempo (s)');
    xLabel('Senal');
    title('Senal mareografica filtrada con filtro mediano');

    figure(3);
    plot(t, x);
    xLabel('Tiempo (s)');
    xLabel('Senal');
    title('Senal mareografica filtrada con filtro mediano centrada en sin componente media');

    L = length(t);
    X = fft(x);
    P = abs(X/L);
    P = P(1:round(L/2)+1);
    P(2:end-1) = 2*P(2:end-1);
    f = Fs*(0:round(L/2))/L;

    [pks, locs] = findpeaks(P, 'Sortstr', 'descend');
    f1 = f(locs(1));
    f2 = f(locs(2));

    figure(4)
    plot(f, P);
    hold on
    pf1 = plot(f1, pks(1), 'r*');
    pf2 = plot(f2, pks(2), 'g*');
    leg = legend([pf1, pf2], sprintf('f = %7.4e Hz (T = %7.1f h), P = %7.4f', f1, (1/f1)/(60*60), pks(1)), sprintf('f = %7.4e Hz (T = %7.1f h), P = %7.4f', f2, (1/f2)/(60*60), pks(2)));
    set(leg, 'Box', 'Off')
    hold off

    xlabel('Frecuencia (Hz)');
    xlabel('P');
    title('Espectro de potencias de la señal mareográfica filtrada');
    xlim([0.0, 0.0001]);
    ylim([0.0, 0.25]);

    Fc = 1/(0.5*60*60);
    Bt = 1.0*Fc;
    Rs = 50;
    Rp = 1;
    Wp = 2*(Fc - 0.8*Bt)/Fs;
    Ws = 2*(Fc + 0.0*Bt)/Fs;
    Gp = 10^(-Rp/20);
    Gs = 10^(-Rs/20);
    [n1b, wn1] = buttord(Wp, Ws, Rp, Rs);
    [B1, A1] = butter(n1b, wn1, 'low');
    [z, p, k] = butter(n1b, wn1, 'low');
    [hf1, ff1] = freqz(B1, A1, 2048, Fs);
    sos = zp2sos(z, p, k);
    y = filtfilt(B1, A1, x);

    figure(5);
    plot(t, y);
    xLabel('Tiempo (s)');
    xLabel('Senal');
    title('Componente de mareas de la señal mareográfica');

    L = length(t);
    Y = fft(y);
    P = abs(Y/L);
    P = P(1:round(L/2)+1);
    P(2:end-1) = 2*P(2:end-1);
    f = Fs*(0:round(L/2))/L;

    [pks, locs] = findpeaks(P, 'Sortstr', 'descend');
    f1 = f(locs(1));
    f2 = f(locs(2));

    figure(6);
    plot(f, P);
    hold on
    pf1 = plot(f1, pks(1), 'r*');
    pf2 = plot(f2, pks(2), 'g*');
    leg = legend([pf1, pf2], sprintf('f = %7.4e Hz (T = %7.1f h), P = %7.4f', f1, (1/f1)/(60*60), pks(1)), sprintf('f = %7.4e Hz (T = %7.1f h), P = %7.4f', f2, (1/f2)/(60*60), pks(2)));
    set(leg, 'Box', 'Off')
    hold off

    xlabel('Frecuencia (Hz)');
    xlabel('P');
    title('Espectro de potencias de la componente de mareas de la señal mareográfica filtrada');

    wf = f((1./f)<60);
    wP = P((1./f)<60);
    wP = wP(8<1./wf);
    wf = wf(8<1./wf);

    figure(7);
    plot(wf, wP);
    hold on
    pf1 = plot(f1, pks(1), 'r*');
    pf2 = plot(f2, pks(2), 'g*');
    leg = legend([pf1, pf2], sprintf('f = %7.4e Hz (T = %7.1f h), P = %7.4f', f1, (1/f1)/(60*60), pks(1)), sprintf('f = %7.4e Hz (T = %7.1f h), P = %7.4f', f2, (1/f2)/(60*60), pks(2)));
    set(leg, 'Box', 'Off')
    hold off

    xlabel('Frecuencia (Hz)');
    xlabel('P');
    title('Espectro de potencias de la señal mareográfica filtrada');
    xlim([0.0, 0.0001]);
    ylim([0.0, 0.25]);

    Fc = [1/60 1/8];
    Bt = 0.5*(Fc(2) - Fc(1));
    Rs = 50;
    Rp = 2;
    Wp = 2*Fc/Fs;
    Ws = [2*(Fc(1) - 0.30*Bt)/Fs  2*(Fc(2) + 2.0*Bt)/Fs];
    Gp = 10^(-Rp/20);
    Gs = 10^(-Rs/20);
    [n1b, wn1] = buttord(Wp, Ws, Rp, Rs);
    [B1, A1] = butter(n1b, wn1, 'bandpass');
    [z, p, k] = butter(n1b, wn1, 'bandpass');
    [hf1, ff1] = freqz(B1, A1, 2048, Fs);
    sos = zp2sos(z, p, k);
    y = filtfilt(B1, A1, x);

    figure(8);
    plot(t, y);
    xLabel('Tiempo (s)');
    xLabel('Senal');
    title('Componente de olas de la señal mareográfica');

    L = length(t);
    Y = fft(y);
    P = abs(Y/L);
    P = P(1:round(L/2)+1);
    P(2:end-1) = 2*P(2:end-1);
    f = Fs*(0:round(L/2))/L;

    [pks, locs] = findpeaks(P, 'Sortstr', 'descend');
    f1 = f(locs(1));
    f2 = f(locs(2));

    figure(9);
    plot(f, P);
    hold on
    pf1 = plot(f1, pks(1), 'r*');
    pf2 = plot(f2, pks(2), 'g*');
    leg = legend([pf1, pf2], sprintf('f = %7.4e Hz (T = %7.1f h), P = %7.4f', f1, (1/f1)/(60*60), pks(1)), sprintf('f = %7.4e Hz (T = %7.1f h), P = %7.4f', f2, (1/f2)/(60*60), pks(2)));
    set(leg, 'Box', 'Off')
    hold off

    xlabel('Frecuencia (Hz)');
    xlabel('P');
    title('Espectro de potencias de la componente de olas de la señal mareográfica filtrada');
