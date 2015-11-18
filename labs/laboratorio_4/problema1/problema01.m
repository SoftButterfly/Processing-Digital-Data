clear all
close all
clc

alw    =  0.75;  % AxesLineWidth
Tfsz   = 12.00;  % Title Fontsize
lfsz   = 12.00;  % Label Fontsize
tfsz   =  9.00;  % Ticks Fontsize
lw     =  0.75;  % LineWidth
msz    =  6.00;  % MarkerSize

Fs = 1000;
T  = 1/Fs;
L  = 10000;

t = (-L/2:L/2)*T;
y = p1_f1(t);


Y = fft(y);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
plot(f,P1)
xlabel('f (Hz)')
ylabel('|P1(f)|')
