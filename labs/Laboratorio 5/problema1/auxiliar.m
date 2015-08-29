clear all
close all
clc

Fs = 1000;
T  = 1/Fs;
t  = 0:1/Fs:25;
y  = sin(t)+0.25.*sin(10*t);
subplot(2,1,1)
plot(t,y)
grid
title('funcion')
N=length(y);
Y=fft(y,N);Pyy=Y.*conj(Y)/N;
f=Fs*(0:N/2-1)/N;
nf=length(f);
subplot(2,1,2), plot(f,Pyy(1:nf));
grid,zoom xon
title('transformada')

% filtro pasabajo
fcorte=1;
[b,a]=butter(5,fcorte/(Fs/2)); 
yf=filtfilt(b,a,y);
plot(t,yf),grid,zoom xon
title('función filtrada')
