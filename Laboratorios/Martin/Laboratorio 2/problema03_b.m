A = 5;
f = 20;

t = 0:0.0001:0.25;
y = saww(t,f,5);

plot(t,y);
ylim([-0.5, A + 0.5])
xlim([0,0.25])
grid on
ylabel('Amplitud (V)');
xlabel('Tiempo (s)');
title(sprintf('Onda diente de sierra\n(Frecuencia: 20 Hz; Amplitud:  5 V)'))
