Fs = 100;

t  = linspace(0,5,5*Fs);
X  = 10*exp(1*t) - 5*exp(-0.5*t);

plot(t,X);
xlabel('Tiempo (s)')
ylabel('Intensidad')
title(sprintf('X(t) = 10e^{t} - 5e^{-0.5t}\nFrecuencia de Muestreo 100 Hz'))
grid on
