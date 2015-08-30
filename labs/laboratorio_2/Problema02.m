% Funcion rampa
% Ancho de la compuerta
L = 1;
% Puntos a evaluar
A = -5:0.01:5;

% Usando "zeros" y "ones"
figure(1)
B = ones(size(A)).*(-0.5*L*ones(size(A)) <= A & A <= 0.5*L*ones(size(A)));
plot(A,B)
ylim([-0.5, 1.5])
grid on
str = sprintf('Función compuerta unitaria \n\n Usando comandos "zeros" y "ones"');
title(str);

% Usando "escalon" del problema 1
figure(2)
A = -5:0.01:5;
B = escalon(A,-0.5*L).*escalon(-A,-0.5*L);
plot(A,B)
ylim([-0.5, 1.5])
grid on
str = sprintf('Función compuerta unitaria \n\n Usando la funcion "escalon" del problema 1');
title(str);
