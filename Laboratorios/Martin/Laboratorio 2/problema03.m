A = 5;               % Ampitud
f = 20;              % Frecuencia
t = 0:0.0001:0.25;   % Puntos de evaluación

% Onda cuadrada con amplitud de A = 5V y frecuencia de f = 20 Hz
figure(1)
plot(t,squarew(t,2*f,5));
ylim([-0.5, A + 0.5])
xlim([0,0.25])
grid on
ylabel('Amplitud (V)');
xlabel('Tiempo (s)');
title(sprintf('Onda cuadrada\n\n(Frecuencia: 20 Hz; Amplitud:  5 V)'))


% Onda diente de sierra con amplitud de A = 5V y frecuencia de f = 20 Hz
figure(2)
plot(t,saww(t,f,5));
ylim([-0.5, A + 0.5])
xlim([0,0.25])
grid on
ylabel('Amplitud (V)');
xlabel('Tiempo (s)');
title(sprintf('Onda diente de sierra\n\n(Frecuencia: 20 Hz; Amplitud:  5 V)'))

