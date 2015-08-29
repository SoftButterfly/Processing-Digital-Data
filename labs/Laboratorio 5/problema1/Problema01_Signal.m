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
plot(t,x,'LineWidth',2)
set(gca,'FontSize',12,'FontName','Cambria');
set(gca,'YTick',-2:1:2)
xlabel('Tiempo (s)')
ylabel('Amplitud')
title('Señal y(t)=sin(t)+0.25sin(10t)','FontSize',14)
grid on

subplot(2,1,2)
NFFT = 2^nextpow2(L);
y    = fft(x,NFFT)/L;
y2   = 2*abs(y);
f    = Fs/2*linspace(0,1,NFFT/2+1);
plot(f(1:100),y2(1:100),'LineWidth',2)
xlim([0 3])
set(gca,'FontSize',12,'FontName','Cambria');
set(gca,'YTick',0:0.25:1)
xlabel('Frecuencia (Hz)')
ylabel('|Y(f)|')
title('Espectro de amplitudes de y(x)','FontSize',14)
grid on

[pks,locs] = findpeaks(abs(y2(1:100)),'Sortstr','descend');
f1 = f(locs(1));
f2 = f(locs(2));
fprintf('Pico 1 :\n\tAmplitud   : %6.4f\n\tFrecuencia : %6.4f\n',...
        pks(1),f1)
fprintf('Pico 2 :\n\tAmplitud   : %6.4f\n\tFrecuencia : %6.4f\n',...
        pks(2),f2)