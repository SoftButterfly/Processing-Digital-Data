Fs = 8000;
T  = 1/Fs;
y = load('datos.txt');
L = length(y);
t = (1:L)*T;
plot(t, y)

Y = fft(y);
P = abs(Y/L);
P = P(1:floor(L/2)+1);
P(2:end-1) = 2*P(2:end-1);
f = Fs*(0:floor(L/2))/L;
plot(f, P)

fprintf('Señal y(t) contenida en el archivo ''datos.txt'':\n')
fprintf('* Cantidad de datos: %d\n', L)
fprintf('* Duracion         : %.5f s\n', max(t))
fprintf('* Valor medio      : %.5f\n', mean(y))
