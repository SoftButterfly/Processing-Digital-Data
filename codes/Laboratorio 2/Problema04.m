Fs = 100;
A  = linspace(0,5,5*Fs);
B  = 10*exp(-1*A) - 5*exp(-0.5*A);
plot(A,B);
grid on
xlabel('Tiempo (s)');
ylabel('Intensidad');
title(['X(t) = 10e^{-t} - 5e^{-0.5t}',...
       sprintf('\n'),...
       'Frecuencia de Muestreo 100 Hz']);