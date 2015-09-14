A = 5;
f = 20;

t = 0:0.0001:0.25;
y = squarew(t,2*f,5);

plot(t,y);
ylim([-0.5, A + 0.5])
xlim([0,0.25])
ylabel('Amplitud (V)');
xlabel('Tiempo (s)');
title(sprintf('Onda cuadrada\n\n(Frecuencia: 20 Hz; Amplitud:  5 V)'))
grid on
