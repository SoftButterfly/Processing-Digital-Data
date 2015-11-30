Fs = 100;
T  = 1/Fs;
t = 0:T:8*pi;
y = p1_y(t);

L = length(t);
Y = fft(y);
P = abs(Y/L);
P = P(1:L/2+1);
P(2:end-1) = 2*P(2:end-1);
f = Fs*(0:(L/2))/L;

plot(f, P)
