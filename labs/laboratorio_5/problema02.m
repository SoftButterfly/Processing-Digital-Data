load sample01.mat
Fs = get(Recorder,'SampleRate');
T  = 1/Fs;
L  = get(Recorder,'TotalSamples');
s  = Recorder.getaudiodata();
x  = s - mean(s);
t  = (1:L)*T;

figure(1);
plot(t, x);
xlabel('Tiempo (s)');
ylabel('Senal');
title('Muestra 1');

X = fft(x);
P = abs(X/L);
P = P(1:round(L/2)+1);
P(2:end-1) = 2*P(2:end-1);
f = Fs*(0:round(L/2))/L;
S01X = X;

figure(2);
plot(f, P);
xlabel('Frecuencia (Hz)');
ylabel('P');
title('Espectro de potencia de la muestra 1');

Fc = 100;
Bt = 1.0*Fc;
Rs = 30;
Rp = 2;
Wp = 2*(Fc + 0.6*Bt)/Fs;
Ws = 2*(Fc + 0.0*Bt)/Fs;
Gp = 10^(-Rp/20);
Gs = 10^(-Rs/20);
[n1b, wn1] = buttord(Wp, Ws, Rp, Rs);
[B1, A1] = butter(5, 2*Fc/Fs, 'high');
[z, p, k] = butter(5, 2*Fc/Fs, 'high');
[hf1, ff1] = freqz(B1, A1, 2048, Fs);
sos = zp2sos(z, p, k);
y = filtfilt(B1, A1, x);

figure(3);
plot(t, y);
xlabel('Tiempo (s)');
ylabel('Senal');
title('Senal filtrada de la muestra 1');

load sample02.mat
Fs = get(Recorder,'SampleRate');
T  = 1/Fs;
L  = get(Recorder,'TotalSamples');
s  = Recorder.getaudiodata();
x  = s - mean(s);
t  = (1:L)*T;

figure(4);
plot(t, x);
xlabel('Tiempo (s)');
ylabel('Senal');
title('Muestra 2');

X = fft(x);
P = abs(X/L);
P = P(1:round(L/2)+1);
P(2:end-1) = 2*P(2:end-1);
f = Fs*(0:round(L/2))/L;
S02X = X;

figure(5);
plot(f, P);
xlabel('Frecuencia (Hz)');
ylabel('P');
title('Espectro de potencia de la muestra 2');

Fc = 100;
Bt = 1.0*Fc;
Rs = 30;
Rp = 2;
Wp = 2*(Fc + 0.6*Bt)/Fs;
Ws = 2*(Fc + 0.0*Bt)/Fs;
Gp = 10^(-Rp/20);
Gs = 10^(-Rs/20);
[n1b, wn1] = buttord(Wp, Ws, Rp, Rs);
[B1, A1] = butter(5, 2*Fc/Fs, 'high');
[z, p, k] = butter(5, 2*Fc/Fs, 'high');
[hf1, ff1] = freqz(B1, A1, 2048, Fs);
sos = zp2sos(z, p, k);
y = filtfilt(B1, A1, x);

figure(6);
plot(t, y);
xlabel('Tiempo (s)');
ylabel('Senal');
title('Senal filtrada de la muestra 2');

cc = abs(corr(S01X,S02X));
disp(cc);
