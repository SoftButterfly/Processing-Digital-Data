Fs = 8000;
T  = 1/Fs;
y = load('datos.txt');
L = length(y);
t = (1:L)*T;
y = p4_y(t);

plot(t, y)

Y = fft(y);
P = abs(Y/L);
P = P(1:floor(L/2)+1);
P(2:end-1) = 2*P(2:end-1);
f = Fs*(0:floor(L/2))/L;

% plot(f(1:100), P(1:100))
