Fs = 100;
T  = 1/Fs;
t = 0:T:25;
x = sin(t) + 0.25*sin(10*t);

figure(1);
plot(t, x);
xlabel('Tiempo (s)');
ylabel('x');
title('Senal x(t)');

L = length(t);
X = fft(x);
P = abs(X/L);
P = P(1:round(L/2)+1);
P(2:end-1) = 2*P(2:end-1);
f = Fs*(0:round(L/2))/L;

[pks, locs] = findpeaks(P, 'Sortstr', 'descend');
f1 = f(locs(1));
f2 = f(locs(2));

figure(2);
plot(f, P);
hold on
plot(f1, pks(1));
plot(f2, pks(2));
hold off
xlabel('Frecuencia (Hz)');
ylabel('P');
title('Espectro de potencia');

Fc = 0.5*(f1 + f2);
Bt = 1.0*Fc;
Rs = 50;
Rp = 1;
Wp = 2*(Fc - 0.8*Bt)/Fs;
Ws = 2*(Fc + 0.0*Bt)/Fs;
Gp = 10^(-Rp/20);
Gs = 10^(-Rs/20);
[n1b, wn1] = buttord(Wp, Ws, Rp, Rs);
[B1, A1] = butter(n1b, wn1, 'Low');
[z, p, k] = butter(n1b, wn1, 'Low');
[hf1, ff1] = freqz(B1, A1, 2048, Fs);
sos = zp2sos(z, p, k);
y = filtfilt(B1, A1, x);

figure(3);
plot(t, y);
xlabel('Tiempo (s)');
ylabel('y');
title('Senal filtrada con pasa bajo');

figure(4);
plot(ff1, abs(hf1));
hold on
plot([0 Wp*Fs/2 Wp*Fs/2], [Gp Gp Gs]);
plot([Ws*Fs/2 Ws*Fs/2 5], [Gp Gs Gs]);
hold off
xlabel('Frecuencia (Hz)');
ylabel('|H|');
title('Funcion de transferencia');

figure(5)
freqz(sos, 1024, Fs);

Fc = 0.5*(f1 + f2);
Bt = 1.0*Fc;
Rs = 30;
Rp = 2;
Wp = 2*(Fc + 0.6*Bt)/Fs;
Ws = 2*(Fc + 0.0*Bt)/Fs;
Gp = 10^(-Rp/20);
Gs = 10^(-Rs/20);
[n1b, wn1] = buttord(Wp, Ws, Rp, Rs);
[B1, A1] = butter(n1b, wn1, 'high');
[z, p, k] = butter(n1b, wn1, 'high');
[hf1, ff1] = freqz(B1, A1, 2048, Fs);
sos = zp2sos(z, p, k);
y = filtfilt(B1, A1, x);

figure(6);
plot(t, y);
xlabel('Tiempo (s)');
ylabel('y');
title('Senal filtrada con pasa alto');

figure(7);
plot(ff1, abs(hf1));
hold on
plot([0 Wp*Fs/2 Wp*Fs/2], [Gp Gp Gs]);
plot([Ws*Fs/2 Ws*Fs/2 5], [Gp Gs Gs]);
hold off
xlabel('Frecuencia (Hz)');
ylabel('|H|');
title('Funcion de transferencia');

figure(8)
freqz(sos, 1024, Fs);
