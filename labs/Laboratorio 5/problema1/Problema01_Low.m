clear all
close all
clc

figure(1)
set(gcf,'Color',[1 1 1]);
subplot(2,1,1)
Fs = 1000;
T = 1/Fs;
t = 0:T:25;
L = length(t);
x = sin(t) + 0.25*sin(10*t);

subplot(2,1,2)
NFFT = 2^nextpow2(L);
y    = fft(x,NFFT)/L;
y2   = 2*abs(y);
f    = Fs/2*linspace(0,1,NFFT/2+1);

[pks,locs] = findpeaks(abs(y2(1:100)),'Sortstr','descend');
f1 = f(locs(1));
f2 = f(locs(2));

% Diseño del filtro pasabjo
Fc = (f1 + f2)/2;                 % [Hz] Frecuencia de Corte
Bt = Fc + 1;                      % [Hz] Ancho de la banda de transicion
Rs = 50;                          % [dB] Atenuacion en la banda de rechazo
Rp = 2;                           % [dB] Atenuacion en la banda de paso
Wp = 2*Fc/Fs;                     % [rad/s] Frecuencia angular de la Fc
Ws = 2*(Fc+Bt)/Fs;                % [rad/s] Frecuencia angular de la Bt
[n1b,wn1]=buttord(Wp,Ws,Rp,Rs);   % Orden del filtro y fecuencia angular de corte (función buttord).
[B1,A1]=butter(n1b,wn1,'High');    % Coeficientes del filtro (función butter).
[h1,w1]=freqz(B1,A1);                  % Respuesta en frecuencia (función freqz).
xf=filtfilt(B1,A1,x);             % Filñtrado de la señal

subplot(2,1,1)
plot(w1(1:10),abs(h1(1:10)))
set(gca,'FontSize',12,'FontName','Cambria');
set(gca,'YTick',0:0.25:1)
ylim([0 1])
xlim([0 0.05])
xlabel('Frecuencia Angular (rad/s)')
ylabel('|H(w)|')
title('Diagram de Bode','FontSize',14)
grid on

subplot(2,1,2)
plot(t,xf,'LineWidth',2)
set(gca,'FontSize',12,'FontName','Cambria');
set(gca,'YTick',-1.5:0.5:1.5)
ylim([-1.5 1.5])
xlabel('Tiempo (s)')
ylabel('Amplitud')
title('Señal filtrada','FontSize',14)
grid on