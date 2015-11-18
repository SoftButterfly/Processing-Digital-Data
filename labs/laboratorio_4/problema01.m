Fs = 1000;
T  = 1/Fs;
L  = 100000;

t = (-L/2:L/2)*T;
y = p1_f1(t);

plot(t,y)

Y = fft(y);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
P1 = P1/max(P1);
f = Fs*(0:(L/2))/L;

plot(f,P1)

t = (-L/2:L/2)*T;
y = p1_f2(t);

plot(t,y)

Y = fft(y);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
P1 = P1/max(P1);
f = Fs*(0:(L/2))/L;

plot(f,P1)

t = (-L/2:L/2)*T;
y = p1_f3(t);

plot(t,y)

Y = fft(y);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
P1 = P1/max(P1);
f = Fs*(0:(L/2))/L;

plot(f,P1)

t = (-L/2:L/2)*T;
y = p1_f4(t);

plot(t,y)

Y = fft(y);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
P1 = P1/max(P1);
f = Fs*(0:(L/2))/L;

plot(f,P1)
