Fs = 1000;
T  = 1/Fs;
L  = 100000;

t = (-L/2:L/2)*T;
x = p2_x(t);

plot(t,x)

X = fft(x);
P2 = abs(X/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
P1 = P1/max(P1);
f = Fs*(0:(L/2))/L;

plot(f,P1)
